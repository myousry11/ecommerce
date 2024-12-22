import 'package:get/get.dart';

class MyTranslation extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    "ar" : {
      // Get Started Screen
      "1" : "أختر اللغة",
      "2" : "أهلاً بك في متجر جيم!",
      "3" : "منزل لعشاق الموضة",
      "4" : "البدء",
      // OnBoarding Screen
      "5" : "اكتشف شيئاً جديداً",
      "6" : "اكتشف أحدث صيحات الموضة \n التي تناسبك. استكشف عروضنا الخاصة \n واعثر على الملابس العصرية المثالية.",
      "7" : "تحديث الزي العصري",
      "8" : "حدد علامة تجارية واحدة مفضلة لديك \n ووصف ما يجعل هذه العلامة التجارية رائعة \n أو لماذا تحب هذه العلامة التجارية.",
      "9" : "الدفع السهل & الآمن",
      "10" : "طريقة دفع سهلة وآمنة. \n موثوق بها من قبل عملائنا \n من جميع أنحاء العالم.",
      "11" : "تتبع طلبك",
      "12" : "تم استخدام أفضل متابعة \n لتتبع طلبك. ستعرف مكان وجود \n منتجك في الوقت الحالي.",
      "13" : "متابعة",
      "14" : "تخطي",
      // Login Screen
      "15" : "تسجيل الدخول \nإلى حسابك",
      "16" : "البريد الإلكتروني",
      "17" : "أدخل بريدك الإلكتروني",
      "18" : "كلمة المرور",
      "19" : "أدخل كلمة المرور الخاصة بك",
      "20": "هل نسيت كلمة المرور؟",
      "21" : "تسجيل الدخول",
      "22" : "ليس لديك حساب؟",
      "23" : "التسجيل",
      "24" : "أو",

      //SignUp Screen
      "25" : "إنشاء\nحسابك",
      "26" : "أسم المستخدم",
      "27" : "أدخل أسم السمتخدم",
      "28" : "الهاتف",
      "29" : "أدخل هاتفك" ,
      "30" : "أعد إدخال كلمة المرور" ,
      "31" : "هل لديك حساب بالفعل؟",
      "42" : "تم إنشاء الحساب بنجاح",
      //Forget Password Screen
      "32" : "أدخل البريد الإلكتروني المرتبط بحسابك\nوسنرسل لك بريدًا إلكترونيًا يحتوي على تعليمات\nلإعادة تعيين كلمة المرور الخاصة بك",
      "33" : "إرسال",
      //Verification Screen
      "34" : "رمز التحقق",
      "35" : "الرجاء إدخال رمز التحقق\nالذي أرسلناه إلى عنوان بريدك الإلكتروني" ,
      "36" : "تحقق",
      //Reset password
      "37" : "إنشاء كلمة مرور جديدة",
      "38" : "يجب أن تكون كلمة المرور الجديدة مختلفة\nعن كلمة المرور التي استخدمتها سابقًا",
      "39" : "تأكيد",
      "40" : "تم تغيير كلمة المرور الخاصة بك",
      "41" : "مرحبًا بك مرة أخرى! اكتشف الآن!",
      //Validator Function

      "43" : "لا يمكن أن يكون فارغًا",
      "44" : "لا يمكن أن يكون أصغر من",
      "45" : "لا يمكن أن يكون أكبر من",
      "46" : "غير صالح",
      "47" : "غير مطابقة",
      "48" : "البريد الإلكتروني موجود بالفعل.",
      "49" : "يبدو أن هذا البريد الإلكتروني مرتبط بحساب آخر.\nيرجى استخدام بريد إلكتروني مختلف.",
      "50" : "رجوع",
    },
    "en" : {
      // Get Started Screen
      "1" : "Select Language",
      "2" : "Welcome to GemStore!",
      "3" : "The home for a fashionista",
      "4" : "Get Started",
      // OnBoarding Screen
      "5" : "Discover Something New",
      "6" : "Discover the latest fashion arrivals \n just for you. Explore our special offers \n and find the perfect fashion apparel.",
      "7" : "Update Trendy Outfit",
      "8" : "Identify one favorite brand \n and describe what makes the brand great \n or why you like the brand.",
      "9" : "Easy & Safe Payment" ,
      "10" : "Easy Checkout & Safe Payment method. \n   Trusted by our Customers \n from all over the world.",
      "11" : "Track Your Order",
      "12" : "Best Tracker has been used for \n Track your order. You'll know where your \n product is at the moment.",
      "13" : "Continue",
      "14" : "Skip",
      // Login Screen
      "15" : "Log into \nyour account",
      "16" : "Email",
      "17" : "Enter your email",
      "18" : "Password",
      "19" : "Enter your password",
      "20" : "Forget Password?",
      "21" : "LOG IN",
      "22" : "Don't have an account?",
      "23" : "SIGN UP",
      "24" : "OR" ,

      // SignUp Screen
      "25" : "Create\nyour account",
      "26" : "Username",
      "27" : "Enter your username",
      "28" : "Phone",
      "29" : "Enter your phone",
      "30" : "Re-Enter password ",
      "31" : "Already have account?",
      "42" : "Account created successfully",

      //Forget Password Screen
      "32" : "Enter email associated with your account\nand we’ll send and email with instructions to reset your password",
      "33" : "Send",
      //Verification Screen
      "34": "Verification code",
      "35" : "Please enter the verification code\nwe sent to your email address",
      "36" : "Verify",
      //Reset password
      "37" : "Create new password" ,
      "38" : "Your new password must be different\nfrom previously used password",
      "39" : "Confirm",
      "40" : "Your password has been changed",
      "41" : "Welcome back! Discover now!",

      //Validator Function
      "43" : "can't be empty",
      "44" : "can't be less than",
      "45" : "can't be greater than",
      "46" : "not valid",
      "47" : "don't match",

      //Verify Sign up
      "48" : "Email already exists.",
      "49" : "It appears that this email is associated with another account.\nPlease use a different email.",
      "50" : "Back"

    },
  };

}