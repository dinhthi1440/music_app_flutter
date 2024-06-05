
String formatMinuteTime(double seconds) {
  int minutes = (seconds / 60).floor();
  int remainingSeconds = (seconds % 60).round();

  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  return "$minutesStr:$secondsStr";
}