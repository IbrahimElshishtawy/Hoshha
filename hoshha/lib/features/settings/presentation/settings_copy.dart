import 'package:flutter/material.dart';

class SettingsCopy {
  SettingsCopy._({required this.isArabic});

  factory SettingsCopy.of(BuildContext context) {
    return SettingsCopy._(
      isArabic: Localizations.localeOf(context).languageCode == 'ar',
    );
  }

  final bool isArabic;

  String get screenTitle => isArabic ? 'الإعدادات' : 'Settings';
  String get appearanceSectionTitle => isArabic ? 'المظهر' : 'Appearance';
  String get languageSectionTitle => isArabic ? 'اللغة' : 'Language';
  String get appInfoSectionTitle => isArabic ? 'عن التطبيق' : 'App Info';
  String get dangerZoneSectionTitle => isArabic ? 'منطقة حساسة' : 'Danger Zone';

  String get themeSystem => isArabic ? 'حسب الجهاز' : 'System';
  String get themeLight => isArabic ? 'فاتح' : 'Light';
  String get themeDark => isArabic ? 'داكن' : 'Dark';

  String get languageArabic => isArabic ? 'العربية' : 'Arabic';
  String get languageEnglish => isArabic ? 'English' : 'English';
  String get usingDeviceLanguage =>
      isArabic ? 'مطبقة حسب لغة الجهاز' : 'Using device language';

  String get appNameLabel => isArabic ? 'اسم التطبيق' : 'App name';
  String get versionLabel => isArabic ? 'الإصدار' : 'Version';
  String get aboutLabel => isArabic ? 'نبذة سريعة' : 'About';
  String get aboutSubtitle => isArabic
      ? 'متابع مصاريف بشكل بسيط وفيه لمسة gamification.'
      : 'A simple gamified expense tracker.';

  String get appNameValue => isArabic ? 'حوشها' : 'Hoshha';
  String get appVersionFallback => '1.0.0+1';

  String get themeSaveError => isArabic
      ? 'حصلت مشكلة وإحنا بنغيّر الثيم'
      : 'Could not update the theme.';
  String get languageSaveError => isArabic
      ? 'حصلت مشكلة وإحنا بنغيّر اللغة'
      : 'Could not update the language.';

  String get resetTileTitle => isArabic ? 'مسح كل البيانات' : 'Reset all data';
  String get resetTileSubtitle => isArabic
      ? 'هيمسح المصاريف والميزانية والإحصائيات المحلية.'
      : 'This clears local expenses, budget, and stats.';
  String get resetDialogTitle =>
      isArabic ? 'تأكيد مسح البيانات' : 'Confirm reset';
  String get resetDialogMessage => isArabic
      ? 'الخطوة دي هتمسح كل بياناتك المحلية ومش هتقدر ترجّعها بعد التنفيذ.'
      : 'This will erase all local data and cannot be undone.';
  String get resetConfirmLabel => isArabic ? 'امسح البيانات' : 'Reset data';
  String get cancelLabel => isArabic ? 'إلغاء' : 'Cancel';
  String get resetSuccessMessage =>
      isArabic ? 'تم مسح البيانات بنجاح' : 'Data was reset successfully.';
  String get resetErrorMessage => isArabic
      ? 'حصلت مشكلة وإحنا بنمسح البيانات'
      : 'Could not reset local data.';
}
