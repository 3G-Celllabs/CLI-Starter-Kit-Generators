const axios = require("axios");
const chalk = require("chalk");
const fs = require("fs");
const ora = require("ora");
const path = require("path");

const baseEndPoint =
  "https://api.github.com/repos/3G-Celllabs/CLI-Starter-Kit-Generators/contents";

exports.copyFolders = async (remotePath, localPath) => {
  try {
    const { data } = await axios.get(`${baseEndPoint}/${remotePath}`);
    await handleCopyFolder(data, localPath);
  } catch (error) {
    ora("").fail(
      chalk.red(
        `Fetching folders failed: ${baseEndPoint}/${remotePath}:${error}`
      )
    );
  }
};

async function handleCopyFolder(files, localPath) {
  for (const file of files) {
    if (file.type === "file") {
      const fileUrl = file.download_url;

      axios
        .get(fileUrl, { responseType: "stream" })
        .then(({ data }) => {
          const filePath = `${localPath}/${path.basename(file.path)}`;
          const outputStream = fs.createWriteStream(filePath);
          data.pipe(outputStream);
          outputStream.on("finish", () => {
            ora("").succeed(
              chalk.green(`File ${filePath} downloaded successfully!`)
            );
          });
        })
        .catch((error) => {
          console.error(
            chalk.red(`Error downloading file ${fileName}: ${error}`)
          );
        });
    }
  }
}
