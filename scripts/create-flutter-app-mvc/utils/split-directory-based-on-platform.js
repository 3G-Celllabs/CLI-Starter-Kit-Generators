exports.splitDirectoryBasedOnPlatform = () => {
  return process.platform === "win32"
    ? process.cwd().split("\\")
    : process.cwd().split("/");
};
