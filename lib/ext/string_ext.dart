
extension StringReplaceTime on String {
  String get replaceTimeString {
    // Split the input string by ':'
    List<String> parts = split(':');

    // Check if there are at least two parts
    if (parts.length >= 2) {
      // Take the first two parts and join them with ':'
      return '${parts[0]}:${parts[1]}';
    } else {
      // Handle the case where there are not enough parts
      return this; // or throw an error, depending on your requirements
    }
  }
}