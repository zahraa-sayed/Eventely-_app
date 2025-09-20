class Validator{
  static String? validateName(String? value){
    if (value == null || value.trim().isEmpty) {
      return "Plz, Enter User Name";
    }
    return null;
  }

  static String? validateEmail(String? value){
    var regexp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (value == null || value.trim().isEmpty) {
      return "Plz, Enter Your E-mail";
    }
    if(! regexp.hasMatch(value)){
      return "E-mail bad format";
    }
    return null;
  }

  static String? validatePassword(String? value){
    var regexp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
    );
    if (value == null || value.trim().isEmpty) {
      return "Plz, Enter Your Password";
    }
    if (value.length < 6) {
      return "Password You Should be at least 6 chars";
    }
    if(! regexp.hasMatch(value)){
      return "Weak password";
    }
    return null;
  }

  static String? validateRePassword(String? rePassword){
    if (rePassword == null || rePassword.trim().isEmpty) {
      return "Plz, Enter Your Password";
    }
    return null;
  }

}