class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
  "In a team of six, if John is the fourth tallest, and there are two people shorter than Mary, who is the second shortest?",
  [
    Answer("Mary", true),
    Answer("John", false),
    Answer("Option not given", false),
    Answer("Cannot be determined", false),
  ],
));

list.add(Question(
  "If cat is to kitten, then dog is to:",
  [
    Answer("Cub", false),
    Answer("Puppy", true),
    Answer("Fawn", false),
    Answer("Colt", false),
  ],
));

list.add(Question(
  "Arrange the following words alphabetically: Elephant, Dog, Apple, Banana.",
  [
    Answer("Apple, Banana, Dog, Elephant", true),
    Answer("Banana, Apple, Dog, Elephant", false),
    Answer("Apple, Banana, Elephant, Dog", false),
    Answer("Banana, Dog, Apple, Elephant", false),
  ],
));

list.add(Question(
  "If red means stop and green means go, what does yellow mean?",
  [
    Answer("Speed up", false),
    Answer("Slow down", false),
    Answer("Proceed with caution", true),
    Answer("Reverse", false),
  ],
));

list.add(Question(
  "If the pattern is 2, 6, 12, 20, what is the next number in the sequence?",
  [
    Answer("28", true),
    Answer("30", false),
    Answer("32", false),
    Answer("34", false),
  ],
));

list.add(Question(
  "What is the next letter in the sequence: A, C, E, G, __?",
  [
    Answer("H", false),
    Answer("I", true),
    Answer("F", false),
    Answer("J", false),
  ],
));

list.add(Question(
  "If a clock shows 3:15, what is the angle between the hour and minute hands?",
  [
    Answer("30 degrees", false),
    Answer("45 degrees", false),
    Answer("60 degrees", true),
    Answer("75 degrees", false),
  ],
));

list.add(Question(
  "What comes next in the series: 1, 4, 9, 16, __?",
  [
    Answer("25", false),
    Answer("36", false),
    Answer("49", true),
    Answer("64", false),
  ],
));

list.add(Question(
  "How would you handle a situation where a team member is feeling overwhelmed and stressed?",
  [
    Answer("Give them space and time alone", false),
    Answer("Offer a listening ear and support", true),
    Answer("Advise them to toughen up", false),
    Answer("Ignore the person",false),
  ]
));


  return list;
}