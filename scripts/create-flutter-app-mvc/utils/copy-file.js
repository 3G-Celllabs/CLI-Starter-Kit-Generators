const https = require("https");
const fs = require("fs");
const chalk = require("chalk");

const baseUrl =
  "https://gitlab.com/pranay.prasad/utilities/-/raw/main/flutter/";

exports.copyFile = async (fileUrl, destFolder) => {
  return new Promise((resolve, reject) => {
    const req = https.get(baseUrl + fileUrl, (res) => {
      const writeStream = fs.createWriteStream(destFolder, {
        flags: "w",
        encoding: "utf8",
      });

      res.pipe(writeStream);

      writeStream.on("finish", () => {
        writeStream.close();
        console.log(chalk.yellow(`Added ${destFolder.split("/").pop()} file`));
      });
      res.on("end", () => {
        resolve(null);
      });
    });

    req.on("error", (err) => {
      reject(err);
    });
  });
};
