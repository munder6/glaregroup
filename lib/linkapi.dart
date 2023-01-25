class AppLink {

  //======================== MainApi =========================//

  static const String server = "http://glaregroup.site/glaregroupapi";
  //static const String server = "http://glaregroup.epizy.com/glaregroupapi/";
  static const String imageStatic = "http://glaregroup.site/glaregroupapi/upload";

  //======================== Image =========================//

  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
  static const String items = "$server/items/items.php";


  //======================== Test =========================//

  static const String test = "$server/test.php";


  //======================== Auth =========================//

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifyCodeSignup = "$server/auth/verfiycode.php";
  static const String resendVerifyCode = "$server/auth/resendcode.php";

  //======================== Reset Password =========================//


  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String verfiyCodeResetPassword = "$server/forgetpassword/verfiycode.php";
  static const String resetPassword = "$server/forgetpassword/resetpassword.php";



//======================== Home =========================//

  static const String homepage = "$server/home.php";



//======================== Favorite =========================//

 static const String addFavorite = "$server/favorite/add.php";
 static const String deleteFavorite = "$server/favorite/remove.php";
 static const String favoriteView = "$server/favorite/view.php";
 static const String deleteFromFavorite = "$server/favorite/deletefromfavorite.php";





}