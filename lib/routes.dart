import 'package:ecommerce/core/middleware/middleware.dart';
import 'package:ecommerce/view/address/add.dart';
import 'package:ecommerce/view/address/add_details.dart';
import 'package:ecommerce/view/address/view.dart';
import 'package:ecommerce/view/screen/cart.dart';
import 'package:ecommerce/view/screen/homescreen.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forget_password.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verify_password.dart';
import 'package:ecommerce/view/screen/auth/verify_signup.dart';
import 'package:ecommerce/view/screen/getstarted.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/productdetails.dart';
import 'package:ecommerce/view/screen/settings.dart';

import 'package:get/get.dart';

import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const WelcomeScreen(), middlewares: [
    MiddleWare(),
  ]),
  // GetPage(name: "/", page: () => const Cart()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoardingScreen()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.login, page: ()=> const Login()),
  GetPage(name: AppRoute.forgetPassword, page: ()=> const ForgetPassword()),
  GetPage(name: AppRoute.verifyPassword, page: ()=> const VerifyPassword()),
  GetPage(name: AppRoute.resetPassword, page: ()=> const ResetPassword()),
  GetPage(name: AppRoute.verifySignup, page: ()=> const VerifySignup()),
  GetPage(name: AppRoute.home, page: ()=> const HomeScreen()),
  GetPage(name: AppRoute.items, page: ()=> const Items()),
  GetPage(name: AppRoute.productDetails, page: ()=> const ProductDetails()),
  GetPage(name: AppRoute.settings, page: ()=> const Settings()),
  GetPage(name: AppRoute.cart, page: ()=> const Cart()),
  GetPage(name: AppRoute.addressView, page: ()=> const AddressView()),
  GetPage(name: AppRoute.addressAdd, page: ()=> const AddressAdd()),
  GetPage(name: AppRoute.addressAddDetails, page: ()=> const AddressAddDetails()),
];
