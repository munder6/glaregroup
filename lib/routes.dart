import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/core/middleware/mymiddleware.dart';
import 'package:glaregroup/view/address/add.dart';
import 'package:glaregroup/view/address/adddetails.dart';
import 'package:glaregroup/view/address/view.dart';
import 'package:glaregroup/view/prodetailsTest.dart';
import 'package:glaregroup/view/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:glaregroup/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:glaregroup/view/screens/auth/forgetpassword/veryfiycodesignup.dart';
import 'package:glaregroup/view/screens/auth/signup.dart';
import 'package:glaregroup/view/screens/auth/success_signup.dart';
import 'package:glaregroup/view/screens/auth/forgetpassword/successresetpassword.dart';
import 'package:glaregroup/view/screens/auth/forgetpassword/veryfiycode.dart';
import 'package:glaregroup/view/screens/cart.dart';
import 'package:glaregroup/view/screens/checkout.dart';
import 'package:glaregroup/view/screens/home.dart';
import 'package:glaregroup/view/screens/items.dart';
import 'package:glaregroup/view/screens/lang.dart';
import 'package:glaregroup/view/screens/myfavorite.dart';
import 'package:glaregroup/view/screens/offersscreen.dart';
import 'package:glaregroup/view/screens/onboarding.dart';
import 'package:glaregroup/view/screens/orders/orderdetails.dart';
import 'package:glaregroup/view/screens/orders/ordersarchive.dart';
import 'package:glaregroup/view/screens/orders/orderspinding.dart';
import 'view/screens/auth/login.dart';
import 'package:get/get.dart';


List<GetPage<dynamic>>? routes = [

  GetPage(name: "/", page: () => const Language(),middlewares: [MyMiddleware()]),
  //,middlewares: [MyMiddleware()]
  // GetPage(name: "/", page: () => const ProDetailsTest() ),
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
  GetPage(name: AppRoute.productdetails, page: () =>  const ProDetailsTest()),
  GetPage(name: AppRoute.myFavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addressAdd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.addressAddDetails, page: () => const AddressAddDetails()),
  GetPage(name: AppRoute.checkout, page: () => const CheckOutScreen()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchiveScreen()),
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersPendingScreen()),
  GetPage(name: AppRoute.chooseLang, page: () => const Language()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrderDetails()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchiveScreen()),
  GetPage(name: AppRoute.offersScreen, page: () => const OffersScreen()),

  
];
