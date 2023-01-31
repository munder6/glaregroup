import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/core/middleware/mymiddleware.dart';
import 'package:glaregroup/view/prodetailsTest.dart';
import 'package:glaregroup/view/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:glaregroup/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:glaregroup/view/screens/auth/forgetpassword/veryfiycodesignup.dart';
import 'package:glaregroup/view/screens/auth/signup.dart';
import 'package:glaregroup/view/screens/auth/success_signup.dart';
import 'package:glaregroup/view/screens/auth/forgetpassword/successresetpassword.dart';
import 'package:glaregroup/view/screens/auth/forgetpassword/veryfiycode.dart';
import 'package:glaregroup/view/screens/home.dart';
import 'package:glaregroup/view/screens/items.dart';
import 'package:glaregroup/view/screens/lang.dart';
import 'package:glaregroup/view/screens/myfavorite.dart';
import 'package:glaregroup/view/screens/onboarding.dart';
import 'package:glaregroup/view/screens/productdetails.dart';
import 'package:glaregroup/view/screens/testHome.dart';
import 'view/screens/auth/login.dart';
import 'package:get/get.dart';


List<GetPage<dynamic>>? routes = [

  GetPage(name: "/", page: () => const Language(),middlewares: [MyMiddleware()]),
  //,middlewares: [MyMiddleware()]
  //GetPage(name: "/", page: () => const ProductDetails() ),
  //


  //GetPage(name: "/", page: ()=> const TestView()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.ForgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.VeryfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.ResetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.successResetPassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.homeScreen, page: () => const Home()),
  GetPage(name: AppRoute.itemsScreen, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProDetailsTest()),
  GetPage(name: AppRoute.myFavorite, page: () => const MyFavorite()),
 // GetPage(name: AppRoute.myFavorite, page: () => const HomeTest()),

  
];
