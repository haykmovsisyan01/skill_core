class Result {
  final int correctAnswers;
  final int wrongAnswers;
  late final int accuracy;

  Result({required this.correctAnswers, required this.wrongAnswers}) {
    accuracy = ((correctAnswers / (correctAnswers + wrongAnswers)) * 100)
        .round();
  }
}
