const axios = require("axios");
const chalk = require("chalk");
const fs = require("fs");

const util = require("util");
const stream = require("stream");
const pipeline = util.promisify(stream.pipeline);

const baseUrl =
  "https://raw.githubusercontent.com/3G-Celllabs/CLI-Starter-Kit-Generators/main/web/";

exports.copyFile = async (fileUrl, destFolder = null, folder = "ionic/") => {
  if (destFolder == null) destFolder = fileUrl;

  try {
    const request = await axios.get(baseUrl + folder + fileUrl, {
      responseType: "stream",
    });
    await pipeline(
      request.data,
      fs.createWriteStream(destFolder, {
        flags: "w",
        encoding: "utf8",
      })
    );
    console.log(chalk.yellow(`Added ${destFolder.split("/").pop()} file`));
  } catch (error) {
    console.error(chalk.red("Something went wrong: ", error));
  }
};
