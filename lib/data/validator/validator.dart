class AppValidator {
 static String? validateText(String? text) {
    if (text!.isEmpty) {
      return 'Please enter Password';
    }
    return null;
  }
}
