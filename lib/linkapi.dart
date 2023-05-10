class AppLink {

  //======================== MainApi =========================//

  //static const String server = "https://glaregroup.site/glaregroupapi";
  static const String server = "https://glare.cu.ma/glaregroupapi";
  //static const String imageStatic = "https://glaregroup.site/glaregroupapi/upload";
  static const String imageStatic = "https://glare.cu.ma/glaregroupapi/upload";

  //======================== Image =========================//

  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";


  //======================== items =========================//

  static const String items = "$server/items/items.php";


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

//======================== Cart =========================//

  static const String addCart = "$server/cart/add.php";
  static const String deleteCart = "$server/cart/delete.php";
  static const String cartView = "$server/cart/view.php";
  static const String cartGetCountItems = "$server/cart/getcountitems.php";

//======================== Search =========================//

  static const String search = "$server/items/search.php";

//======================== Address =========================//

  static const String addressAdd = "$server/address/add.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressView = "$server/address/view.php";


  //======================== Coupon =========================//

  static const String checkCoupon = "$server/coupon/checkcoupon.php";



  //======================== checkout =========================//


  static const String checkout = "$server/orders/checkout.php";



  //======================== Orders =========================//
  static const String orderPending = "$server/orders/pending.php";
  static const String orderArchive = "$server/orders/archive.php";
  static const String ordersDetails = "$server/orders/details.php";
  static const String ordersDelete = "$server/orders/delete.php";

//======================== Notifications =========================//


  static const String notification = "$server/notification.php";

//======================== Offers =========================//


  static const String offers = "$server/offers.php";


//======================== Rating =========================//


  static const String rating = "$server/rating.php";




}