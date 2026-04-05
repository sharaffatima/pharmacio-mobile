class AppStrings {
  static String currentLanguage = 'en';

  static bool get _isArabic => currentLanguage == 'ar';

  static String get title => _isArabic ? 'العنوان' : 'Title';
  static String get appTitle => _isArabic
      ? 'تطبيق فارماتشيو للصيادلة'
      : 'Pharmacio Pharmacist Mobile App';
  static String get settingsTitle => _isArabic ? 'الإعدادات' : 'Settings';
  static String get save => _isArabic ? 'حفظ' : 'Save';
  static String get cancel => _isArabic ? 'إلغاء' : 'Cancel';
  static String get retry => _isArabic ? 'إعادة المحاولة' : 'Retry';
  static String get logout => _isArabic ? 'تسجيل الخروج' : 'Logout';
  static String get logoutLoading =>
      _isArabic ? 'جارٍ تسجيل الخروج...' : 'Logging out...';
  static String get logoutConfirmTitle => _isArabic ? 'تسجيل الخروج' : 'Logout';
  static String get logoutConfirmMessage => _isArabic
      ? 'هل أنت متأكد أنك تريد تسجيل الخروج؟'
      : 'Are you sure you want to logout?';
  static String get themeMode => _isArabic ? 'الوضع الليلي' : 'Dark mode';
  static String get language => _isArabic ? 'اللغة' : 'Language';
  static String get english => _isArabic ? 'الإنجليزية' : 'English';
  static String get arabic => _isArabic ? 'العربية' : 'Arabic';
  static String get on => _isArabic ? 'مفعّل' : 'ON';
  static String get off => _isArabic ? 'غير مفعّل' : 'OFF';

  // inventory screen
  static String get inventoryTitle => _isArabic ? 'المخزون' : 'Inventory';
  static String get inventorySubTitle => _isArabic
      ? 'تتبع وإدارة مستويات المخزون'
      : 'Track and manage stock levels';
  static String get proposaltitle => _isArabic ? 'الإجمالي' : 'Total';
  static String get inStock => _isArabic ? 'متوفر' : 'In stock';
  static String get low => _isArabic ? 'منخفض' : 'Low';
  static String get out => _isArabic ? 'غير متوفر' : 'Out';
  static String get searchTitle =>
      _isArabic ? 'ابحث عن العناصر...' : 'Search items...';
  static String get currentStock =>
      _isArabic ? 'المخزون الحالي:' : 'Current stock:';
  static String get minStock =>
      _isArabic ? 'الحد الأدنى للمخزون:' : 'Min stock :';
  static String get boxes => _isArabic ? 'علب' : 'boxes';
  static String get lastUpdated => _isArabic ? 'آخر تحديث :' : 'Last updated :';

  // proposal screen
  static String get proposalTitle => _isArabic ? 'العروض' : 'Proposal';
  static String get proposalSubTitle => _isArabic
      ? 'تجديد وإدارة عروض الشراء'
      : 'Renew and manage purchase proposals';
  static String get availableOffers =>
      _isArabic ? 'العروض المتاحة' : 'Available Offers';
  static String get proposals => _isArabic ? 'المقترحات' : 'Proposals';
  static String get pending => _isArabic ? 'قيد الانتظار' : 'Pending';
  static String get approved => _isArabic ? 'مقبول' : 'Approved';
  static String get rejected => _isArabic ? 'مرفوض' : 'Rejected';
  static String get noProposalsFound =>
      _isArabic ? 'لا توجد مقترحات.' : 'No proposals found.';
  static String get proposalPrefix => _isArabic ? 'مقترح' : 'Proposal';

  // profile screen
  static String get profileTitle =>
      _isArabic ? 'الملف الشخصي والإعدادات' : 'Profile & Settings';
  static String get profileSubTitle =>
      _isArabic ? 'إدارة معلومات حسابك' : 'Manage your account information';
  static String get accountInformation =>
      _isArabic ? 'معلومات الحساب' : 'Account Information';
  static String get appInformation =>
      _isArabic ? 'معلومات التطبيق' : 'App Information';
  static String get changePassword =>
      _isArabic ? 'تغيير كلمة المرور' : 'Change Password';
  static String get version => _isArabic ? 'الإصدار' : 'Version';
  static String get profileLastUpdated =>
      _isArabic ? 'آخر تحديث' : 'Last Updated';
  static String get appVersionValue => '1.0.0';
  static String get profileLastUpdatedValue => 'Feb 3, 2026';
  static String get email => _isArabic ? 'البريد الإلكتروني' : 'Email';
  static String get role => _isArabic ? 'الدور' : 'Role';
  static String get userId => _isArabic ? 'معرّف المستخدم' : 'User ID';
  static String get phone => _isArabic ? 'الهاتف' : 'Phone';
  static String get notProvided => _isArabic ? 'غير متوفر' : 'Not provided';
  static String get notAvailable => _isArabic ? 'غير متاح' : 'N/A';
  static String get user => _isArabic ? 'مستخدم' : 'User';
}
