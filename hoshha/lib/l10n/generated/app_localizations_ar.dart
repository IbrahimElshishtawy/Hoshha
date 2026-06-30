// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'حوشة';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get register => 'إنشاء حساب';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get forgotPassword => 'هل نسيت كلمة المرور؟';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get signIn => 'دخول';

  @override
  String get signUp => 'تسجيل';

  @override
  String get orSignInWith => 'أو سجل دخولك بواسطة';

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get invalidEmail => 'البريد الإلكتروني غير صالح';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordTooShort => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
}
