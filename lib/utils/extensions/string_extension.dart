extension ProperCase on String {
  String toProperCase() {
    final firstLetter = substring(0, 1).toUpperCase();
    final otherLetters = substring(1).toLowerCase();

    return "$firstLetter$otherLetters";
  }
}
