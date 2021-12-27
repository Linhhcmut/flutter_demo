// ignore: camel_case_types
class Register_Validation {
  static String validateName(String name) {
    if (name.length < 4) {
      return "Name require minimum 4 charaters";
    }
    return null;
  }

  static String validateEmail(String email) {
    var isValid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
        if(!isValid){
          return "Email invalid";
        }
    return null;
  }
  static String validatePhone(String phone) {
    var isValid = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phone);
    if(!isValid){
      return "Phone invalid";
    }    
    return null;
  }
  static String validatePass(String pass) {
    if(pass.length < 8){
      return "Pass require minimum 8 charaters";
    }
    var isValid = RegExp(r'(?=.*?[#?!@$%^&*-])').hasMatch(pass);
    if(!isValid){
      return "Password must have at least one special character";
    }
    return null;
  }
}
