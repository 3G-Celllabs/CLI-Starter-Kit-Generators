const https = require("https");
const fs = require("fs");
const readline = require("readline");
const chalk = require("chalk");

const util = require("util");
const exec = util.promisify(require("child_process").exec);

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

let projectName = "";

const baseUrl =
  "https://gitlab.com/pranay.prasad/utilities/-/raw/main/flutter/";

const folders = [
  "assets/images",
  "lib/controllers",
  "lib/helpers",
  "lib/models/states",
  "lib/routes",
  "lib/services",
  "lib/views/screens",
  "lib/views/widgets/common",
];

const defaultPackages = [
  "flutter_dotenv",
  "flutter_launcher_icons",
  "logger",
  "intl",
  "uuid",
];

const additionalPackages = [
  { name: "get", checked: false, url: "routes/routes.dart" },
  { name: "http", checked: false, url: "services/http_service.dart" },
  { name: "mqtt_client", checked: false, url: "services/mqtt_service.dart" },
  {
    name: "flutter_reactive_ble",
    checked: false,
    url: "services/ble_service.dart",
  },
];

async function initializeFlutterProject() {
  const answer = await ask("Enter app name: ");

  if (answer.trim() === "") {
    console.error(chalk.red("Error: Please provide a project name."));
    process.exit(1);
  } else {
    projectName = answer.trim();
    await executeCommands(`flutter create ${projectName}`);
    console.log("\n");
    console.log(
      chalk.yellow(`Flutter project:: ${projectName} is initialized .`)
    );
  }
}

async function ask(questionText) {
  return new Promise((resolve, reject) => {
    rl.question(chalk.blue(questionText), (input) => resolve(input));
  });
}

function generateFolders() {
  changeWorkingDirectory(projectName, true);
  console.log("\n");
  folders.forEach((folder) => createfolder(folder));
}

function changeWorkingDirectory(dir, showLog = false) {
  try {
    process.chdir(`${dir}`);
    if (showLog) console.log(chalk.yellow(`Moved in to ${dir} directory.`));
  } catch (err) {
    console.error(chalk.red(`Unable to change dir: ${err}`));
    process.exit(1);
  }
}

function createfolder(folder) {
  try {
    fs.mkdirSync(`${folder}`, { recursive: true });
    console.log(chalk.yellow(`Created ${folder} directory.`));
  } catch (e) {
    console.error(chalk.red(`Unable to create ${folder} directory.`));
  }
}

async function installDefaultPackages() {
  console.log("\n");
  console.log(
    chalk.yellow(`Installing packages: ${defaultPackages.join(", ")}`)
  );

  console.log(chalk.yellow(`Hold on....`));
  await installMultiplePackages(defaultPackages);

  console.log(chalk.green(`Packages installed successfully!`));
}

async function updatePubspec() {
  console.log("\n");

  console.log("Updating Pubspec");
  return new Promise((resolve, reject) => {
    const dataToAppend = `
flutter_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/bitmaps/round-logo.png"
  min_sdk_android: 21 # android min sdk min:16, default 21`;

    fs.appendFile("pubspec.yaml", dataToAppend, "utf8", (err) => {
      if (err) {
        console.log(chalk.red(`Error: ${err}`));
        reject(err);
      }
      console.log(chalk.green(`Updated pubspec.yaml file.`));
      console.log("\n");
      resolve(null);
    });
  });
}

async function installAdditionalPackages() {
  let index = 0;

  for (const package of additionalPackages) {
    const answer = await ask(
      `Would you like to install ${package["name"]} (y/n): `
    );

    if (answer.toLowerCase() === "y") {
      additionalPackages[index]["checked"] = true;
    } else {
      additionalPackages[index]["checked"] = false;
    }
    index++;
  }

  const packagesToInstall = [];
  additionalPackages.forEach((package) => {
    if (package["checked"]) {
      packagesToInstall.push(package["name"]);
    }
  });

  console.log(
    chalk.yellow(`Installing packages: ${packagesToInstall.join(", ")}`)
  );
  console.log(chalk.yellow(`Hold on....`));
  console.log("\n");
  await installMultiplePackages(packagesToInstall);

  console.log(chalk.green(`Packages installed successfully!`));
}

async function installMultiplePackages(packages) {
  await executeCommands(`flutter pub add ${packages.join(" ")}`);
}

async function createNecessaryFiles() {
  // Create constants file with app name.
  changeWorkingDirectory("lib/helpers/");
  const appName = projectName
    .split("_")
    .map((value) => value[0].toUpperCase() + value.slice(1))
    .join(" ");

  addFilesWithContent(
    "constants.dart",
    `class Constants{\n\tstatic String appName = '${appName}';\n}\n`
  );

  // Create assets file with logo.
  addFilesWithContent(
    "assets.dart",
    `class Images{\n\tstatic String logo = '';\n}\n`
  );

  changeWorkingDirectory(`../`);
}

function addFilesWithContent(fileName, content) {
  fs.writeFileSync(fileName, content);
  console.log(chalk.yellow(`Added ${fileName} file`));
}

async function copyNecessaryFiles() {
  changeWorkingDirectory("../assets/images");

  // Copy assets
  await copyFile("assets/images/logo.png", "logo.png");
  changeWorkingDirectory("../");

  await copyFile("assets/.env", ".env");
  changeWorkingDirectory("../lib");

  // Copy Theme, Utils files to helpers folder
  changeWorkingDirectory("helpers/");

  await copyFile("helpers/theme.dart", "theme.dart");
  await copyFile("helpers/utils.dart", "utils.dart");

  // Copy Splash, Home screens to views/screens folder
  changeWorkingDirectory("../views/screens/");

  await copyFile("screens/splash_screen.dart", "splash_screen.dart");
  await copyFile("screens/home_screen.dart", "home_screen.dart");

  changeWorkingDirectory("../../");
  // takes you to lib folder.

  for (const package of additionalPackages) {
    if (package["checked"] && package["url"] != null) {
      if (package["name"] == "get") {
        // Copy main.dart replacing existing file
        await copyFile("main.dart", "main.dart");

        changeWorkingDirectory("controllers/");
        await copyFile(
          "controllers/splash_controller.dart",
          "splash_controller.dart"
        );

        changeWorkingDirectory(`../routes/`);
        await copyFile(package["url"], "routes.dart");
        changeWorkingDirectory(`../`);
      } else {
        if (process.cwd().split("/").pop() !== "services") {
          changeWorkingDirectory(`services/`);
        }
        await copyFile(package["url"], package["url"].split("/").pop());
      }
    }
  }
  if (process.cwd().split("/").pop() !== "lib") {
    changeWorkingDirectory(`../`);
  }
}

async function copyFile(fileUrl, destFolder) {
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
}

async function initializeGit() {
  if (process.cwd().split("/").pop() !== projectName) {
    changeWorkingDirectory(`../`);
  }

  await executeCommands("git init");

  await executeCommands("git config core.autocrlf false");

  await executeCommands("git add .");

  await executeCommands(
    'git commit -m "Initialize project with recommended setup."'
  );
  console.log(chalk.yellow("Git Initialized successfully"));
  console.log("\n");
}

async function executeCommands(command, showLogs = false) {
  try {
    const { stdout, stderr } = await exec(command);

    if (stderr) {
      console.error(chalk.red(`stderr: ${stderr}`));
      process.exit(1);
    }
    if (showLogs) {
      console.log(chalk.white(`${stdout}`));
    }
  } catch (e) {
    console.error(chalk.red(`${e}`));
    process.exit(1);
  }
}

function endScript() {
  console.log(
    chalk.whiteBright.bgGrey.bold(
      "Make sure to add assets/.env, assets/images to assets in pubspec.yaml"
    )
  );
  console.log(
    chalk.whiteBright.bgGrey.bold(
      "Few files need to be imported in main.dart, routes.dart"
    )
  );
  console.log("\n");
  console.log(
    chalk.green("SUCCESS:: Flutter app setup finished successfully!")
  );
  process.exit(0);
}

async function main() {
  await initializeFlutterProject();

  generateFolders();

  await installDefaultPackages();

  await updatePubspec();

  await installAdditionalPackages();

  await createNecessaryFiles();

  await copyNecessaryFiles();

  await initializeGit();

  endScript();
}

main();