
class Validator {

  static const String passwordRegex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static const String upperCaseRegex = r'^(?=.*?[A-Z]).{1,}$';
  static const String lowerCaseRegex = r'^(?=.*?[a-z]).{1,}$';
  static const String symbolRegex = r'^(?=.*?[!@#\$&*~]).{1,}$';
  static const String digitRegex = r'^(?=.*?[0-9]).{1,}$';

  static final digitExp = RegExp(digitRegex);
  static final symbolExp = RegExp(symbolRegex);
  static final upperExp = RegExp(upperCaseRegex);
  static final lowerExp = RegExp(lowerCaseRegex);

  /// Checks if string is email.
  static bool isValidEmail(String? inputString, {bool isRequired = false}) {
    bool isInputStringValid = false;
    if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
      isInputStringValid = true;
    }
    if (inputString != null && inputString.isNotEmpty) {
      const pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      final regExp = RegExp(pattern);
      isInputStringValid = regExp.hasMatch(inputString);
    }
    return isInputStringValid;
  }

  static bool isValidUrl(String? inputString, {bool isRequired = false}) {
    bool isInputStringValid = false;
    if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
      isInputStringValid = true;
    }
    if (inputString != null && inputString.isNotEmpty) {
      const pattern = passwordRegex;
      // const pattern = r'^(http[s]?:\/\/(www\.)?|ftp:\/\/(www\.)?|www\.){1}([0-9A-Za-z-\.@:%_\+~#=]+)+((\.[a-zA-Z]{2,3})+)(\/(.)*)?(\?(.)*)?/g';
      final regExp = RegExp(pattern);
      isInputStringValid = regExp.hasMatch(inputString);
    }
    return isInputStringValid;
  }

  /// Password should have,
  /// at least a upper case letter
  ///  at least a lower case letter
  ///  at least a digit
  ///  at least a special character [@#$%^&+=]
  ///  length of at least 4
  /// no white space allowed
  static bool isValidPassword(String? inputString, {bool isRequired = false}) {
    bool isInputStringValid = false;
    if (!isRequired && (inputString == null ? true : inputString.isEmpty)) {
      isInputStringValid = true;
    }
    if (inputString != null && inputString.isNotEmpty) {
      const pattern =
          r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$';
      final regExp = RegExp(pattern);
      isInputStringValid = regExp.hasMatch(inputString);
    }
    return isInputStringValid;
  }
}
