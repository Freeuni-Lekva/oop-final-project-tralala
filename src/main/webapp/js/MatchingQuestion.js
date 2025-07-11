let selectedQuestion = null;
let selectedAnswer = null;
let colorIndex = 0;

const colors = [
  "#007138", "#722c61", "#327D7D", "#de7136", "#42B191",
  "#c29c59", "#30aba7", "#9cea65", "#b64a68", "#F79FF8",
  "#3075C1", "#6c04c2", "#409CD6", "rgba(206,51,23,0.81)", "#60B6E1",
  "rgba(26,96,67,0.69)", "#99D2BA", "#56f106", "#6348ab", "#B77CD2",
  "rgba(41,115,57,0.8)", "#2E5FE8", "#45B8E8", "#bd2b49", "#72D7F5",
  "#ea3d27", "#3b93ad", "#042498", "#FECBEB", "#FED8F1",
  "#fc6916", "#fad20b", "#FC9240", "rgba(133,220,181,0.71)", "#FCA0A9",
  "rgba(52,67,232,0.8)", "#2E5FE8", "#45B8E8", "#3d348b", "#72D7F5",
  "#ea3d27", "#3b93ad", "#042498", "rgba(119,128,28,0.6)", "#FED8F1",
  "#e6af2e", "#fad20b", "#00b295", "rgba(33,104,128,0.49)", "#FCA0A9"
];

let matchingPairs = {};

function selectQuestion(id) {
  selectedQuestion = document.getElementById(id);
  checkMatch();
}

function selectAnswer(id) {
  selectedAnswer = document.getElementById(id);
  checkMatch();
}

function checkMatch() {
  if (selectedQuestion && selectedAnswer) {
    colorIndex = Math.ceil(Math.random()*colors.length);
    selectedQuestion.style.backgroundColor = colors[colorIndex];
    selectedAnswer.style.backgroundColor = colors[colorIndex];
    selectedQuestion.style.borderColor = colors[colorIndex];
    selectedAnswer.style.borderColor = colors[colorIndex];

    // Get question and answer texts
    let questionText = selectedQuestion.innerText;
    let answerText = selectedAnswer.innerText;

    // Add to matchingPairs hashmap
    matchingPairs[questionText] = answerText;
    let matchingPairsJson = JSON.stringify(matchingPairs);
    console.log(matchingPairs);
    document.getElementById('userAnswers').value = matchingPairsJson;
    localStorage.setItem("json", matchingPairsJson)
    selectedQuestion = null;
    selectedAnswer = null;
  }
}
