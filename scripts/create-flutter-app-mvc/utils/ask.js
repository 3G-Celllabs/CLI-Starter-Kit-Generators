exports.ask = async (questionText) => {
  const answers = await require("inquirer").prompt([
    {
      name: "response",
      message: questionText,
    },
  ]);
  return answers.response;
};
