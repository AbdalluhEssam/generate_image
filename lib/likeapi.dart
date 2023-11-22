class AppLink {
//================================== Hosting ===============================//
  static const String serverLink = "https://ieee-osb.onrender.com";
//================================== Auth ===============================//
  static const String signUp = "$serverLink/users/signup";
  static const String verifyCodeSignUp = "$serverLink/users/verify";
  static const String reSend = "$serverLink/users/login";
  static const String login = "$serverLink/users/login";
  static const String editUser = "$serverLink/users/updateUser";
//================================== Forget Password ===============================//
  static const String checkEmail = "$serverLink/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPass ="$serverLink/forgetpassword/verfiycode.php";
  static const String resetPassword ="$serverLink/forgetpassword/resetpassword.php";
//================================== Home ===============================//
  static const String homePage = "$serverLink/courses/active";
//================================== Courses ===============================//
  static const String coursesGetData = "$serverLink/courses/active";
  static const String coursesAddData = "$serverLink/courses/register";
  static const String coursesSearch = "$serverLink/courses/search";
//================================== Events ===============================//
  static const String eventsGetData = "$serverLink/users/events";
  static const String eventsGetById = "$serverLink/users/event";
//================================== Open AI ===============================//
  static const String apiImage = "https://api.openai.com/v1/images/generations";
  static const String apiChat = "https://api.openai.com/v1/chat/completions";
  static const String apiImageKey = "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";
//================================== END ===============================//
}
