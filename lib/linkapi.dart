class AppLink {
  static const String server = 'http://10.0.2.2/ecommerce';
  static const String imageStatic = 'http://10.0.2.2/ecommerce/upload';

  // Image
  static const String imageCategories = '$imageStatic/categories';
  static const String imageItems = '$imageStatic/items';
  static const String test = '$server/test.php';

  // Auth
  static const String signup = '$server/auth/signup.php';
  static const String login = '$server/auth/login.php';
  static const String verifyCode = '$server/auth/verifycode.php';
  static const String googleLogin = '$server/auth/googlelogin.php';

  //Forget Password
  static const String checkEmail = '$server/forgetpassword/checkemail.php';
  static const String verifyPass = '$server/forgetpassword/verifycode.php';
  static const String resetPassword = '$server/forgetpassword/resetpassword.php';
  static const String resendCode = '$server/forgetpassword/resendcode.php';


  //Home
  static const String home = '$server/home.php';
  static const String items = '$server/items/items.php';
  static const String itemsFromSubCategory = '$server/items/items_subcategory.php';
  static const String subCat = '$server/subcategories/subcategory.php';

  // Cart
  static const String cartAdd = '$server/cart/add.php';
  static const String cartDelete = '$server/cart/delete.php';
  static const String cartView = '$server/cart/view.php';
  static const String cartGetCountItems = '$server/cart/getcountitems.php';

  // Search
  static const String search = '$server/search/search.php';

  //Address
  static const String addressAdd = '$server/address/add.php';
  static const String addressDelete = '$server/address/delete.php';
  static const String addressView = '$server/address/view.php';
  static const String addressEdit = '$server/address/edit.php';

  //Coupon
  static const String checkCoupon = '$server/coupon/checkcoupon.php';






}