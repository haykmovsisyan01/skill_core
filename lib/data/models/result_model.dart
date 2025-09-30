class Result {
  final int correctAnswers;
  final int wrongAnswers;
  late final int accuracy;

  Result({required this.correctAnswers, required this.wrongAnswers}) {
    if (correctAnswers != 0 && wrongAnswers != 0) {
      accuracy = ((correctAnswers / (correctAnswers + wrongAnswers)) * 100)
          .round();
    } else {
      accuracy = 0;
    }
  }
}
