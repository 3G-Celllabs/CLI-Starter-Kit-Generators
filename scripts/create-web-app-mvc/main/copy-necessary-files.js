const chalk = require("chalk");
const fs = require("fs");
const ora = require("ora");

const { changeWorkingDirectory } = require("../utils/change-working-directory");
const { copyFile } = require("../utils/copy-file");
const { delay } = require("../utils/delay");

exports.copyNecessaryFiles = async (type) => {
  if (type === "ionic") {
    // Copy tsconfig
    await copyFile("tsconfig.json");
    await delay(1000);

    // Copy main.ts, global.scss
    changeWorkingDirectory("src/");
    await copyFile("main.ts");
    await copyFile("global.scss");
    await delay(1000);

    // Copy envs
    changeWorkingDirectory("environments/");
    await copyFile("environment.ts");
    await copyFile("environment.prod.ts");
    await delay(1000);

    //Copy app files
    changeWorkingDirectory("../app/");
    await copyFile("app.component.html");
    await copyFile("app.component.ts");
    await copyFile("app.routes.ts");
  } else {
    const angular = "angular/";

    // Copy tsconfig
    await copyFile("tsconfig.json", null, angular);
    await delay(1000);

    // Copy styles.scss
    changeWorkingDirectory("src/");
    await copyFile("main.ts", null, angular);
    await copyFile("styles.scss", null, angular);
    await delay(1000);

    // Copy envs
    changeWorkingDirectory("environments/");
    await copyFile("environment.ts", null, angular);
    await copyFile("environment.prod.ts", null, angular);
    await delay(1000);

    // Copy favicon
    changeWorkingDirectory("../assets/icon/");
    copyFile("favicon.png", null, angular);
    await delay(1000);

    //Copy app files
    changeWorkingDirectory("../../app/");

    await copyFile("app.component.html", null, angular);
    await copyFile("app.component.ts", null, angular);
    await copyFile("app.routes.ts", null, angular);

    // Delete app.module and app-routing.module
    fs.rmSync("app.module.ts", { force: true });
    fs.rmSync("app-routing.module.ts", { force: true });
    ora("").succeed(
      chalk.green(`app.module and app-routing.module deleted successfully.`)
    );
  }
};
