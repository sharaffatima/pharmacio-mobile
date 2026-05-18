class AppStrings {
  static String currentLanguage = 'en';

  static bool get _isArabic => currentLanguage == 'ar';

  static String get title => _isArabic ? 'العنوان' : 'Title';
  static String get appTitle => _isArabic
      ? 'تطبيق Pharmacio للصيادلة'
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
  static String get noItemsFound =>
      _isArabic ? 'لا توجد عناصر' : 'No items found';
  static String get recently => _isArabic ? 'مؤخرًا' : 'Recently';
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
  static String get somethingWentWrong =>
      _isArabic ? 'حدث خطأ ما' : 'Something went wrong';
  static String get pdfOpenRequiresRestart => _isArabic
      ? 'تم تنزيل الملف، يرجى إعادة تشغيل التطبيق لفتح الملف'
      : 'File downloaded. Please restart the app to open it.';
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

  // navigation and home labels
  static String get home => _isArabic ? 'الرئيسية' : 'Home';
  static String get profile => _isArabic ? 'الملف الشخصي' : 'Profile';
  static String get scanUploadTitle =>
      _isArabic ? 'مسح / رفع' : 'Scan / Upload';
  static String get scanUploadSubtitle => _isArabic
      ? 'ارفع العروض بالكاميرا أو الملفات'
      : 'Upload offers via camera or files';
  static String get warehouseName =>
      _isArabic ? 'اسم المستودع' : 'Warehouse Name';
  static String get enterWarehouseName =>
      _isArabic ? 'أدخل اسم المستودع' : 'Enter warehouse name';
  static String get selectedPrefix => _isArabic ? 'تم التحديد: ' : 'Selected: ';
  static String get statusPrefix => _isArabic ? 'الحالة: ' : 'Status: ';
  static String get checkStatus =>
      _isArabic ? 'تحقق من الحالة' : 'Check Status';

  // camera scan
  static String get cameraScan => _isArabic ? 'مسح بالكاميرا' : 'Camera Scan';
  static String get cameraScanSubtitle => _isArabic
      ? 'امسح المستندات باستخدام كاميرا جهازك'
      : 'Scan documents using your device camera';
  static String get startCamera => _isArabic ? 'ابدأ الكاميرا' : 'Start Camera';
  static String get confirmAndUpload =>
      _isArabic ? 'تأكيد ورفع' : 'Confirm and Upload';
  static String get tipsForBestResults =>
      _isArabic ? 'نصائح لأفضل نتيجة:' : 'Tips for best results:';
  static String get tipGoodLighting =>
      _isArabic ? 'تأكد من وجود إضاءة جيدة' : 'Ensure good lighting';
  static String get tipHoldSteady =>
      _isArabic ? 'حافظ على ثبات الكاميرا' : 'Hold camera steady';
  static String get tipCaptureWholeDocument => _isArabic
      ? 'التقط المستند كاملًا داخل الإطار'
      : 'Capture entire document in frame';
  static String get tipAvoidShadows =>
      _isArabic ? 'تجنب الظلال والانعكاس' : 'Avoid shadows and glare';

  // scan uploads
  static String get recentUploads =>
      _isArabic ? 'الملفات المرفوعة مؤخرًا' : 'Recent Uploads';
  static String get itemsCountSuffix => _isArabic ? 'عنصر' : 'items';
  static String get quickActions =>
      _isArabic ? 'إجراءات سريعة' : 'Quick Actions';
  static String get quickActionsSubtitle =>
      _isArabic ? 'مسح أو رفع العروض بسرعة' : 'Fast scan or upload offers';
  static String get welcomeBack =>
      _isArabic ? 'مرحبًا بعودتك!' : 'Welcome Back!';
  static String get pharmacist => _isArabic ? 'صيدلي' : 'pharmacist';
  static String get scanCamera => _isArabic ? 'مسح بالكاميرا' : 'Scan Camera';
  static String get recentActivity =>
      _isArabic ? 'النشاطات الأخيرة' : 'Recent Activity';
  static String get newProposalGenerated =>
      _isArabic ? 'تم إنشاء مقترح جديد' : 'New proposal generated';
  static String get twelveHour => _isArabic ? '12 ساعة' : '12 hour';
  static String get lowStockLabel => _isArabic ? 'مخزون منخفض' : 'low stock';
  static String get activityAlerts =>
      _isArabic ? 'تنبيهات النشاط' : 'Activity Alerts';
  static String get strengthExample => _isArabic ? 'مثل 500mg' : 'e.g. 500mg';
  static String get imageFormats =>
      _isArabic ? 'JPG, PNG, إلخ' : 'JPG, PNG, etc.';
  static String get pdfDocuments => _isArabic ? 'مستندات PDF/Excel' : 'PDF/Excel documents';
  static String get spreadsheetFormats =>
      _isArabic ? 'XLSX, XLS, CSV' : 'XLSX, XLS, CSV';

  // auth
  static String get createAccount =>
      _isArabic ? 'إنشاء حساب' : 'Create Account';
  static String get userName => _isArabic ? 'اسم المستخدم' : 'User name';
  static String get enterUserName =>
      _isArabic ? 'أدخل اسم المستخدم' : 'Enter your username';
  static String get password => _isArabic ? 'كلمة المرور' : 'Password';
  static String get enterPassword =>
      _isArabic ? 'أدخل كلمة المرور' : 'Enter your password';
  static String get confirmPassword =>
      _isArabic ? 'تأكيد كلمة المرور' : 'Confirm Password';
  static String get reEnterPassword =>
      _isArabic ? 'أعد إدخال كلمة المرور' : 'Re-enter your password';
  static String get login => _isArabic ? 'تسجيل الدخول' : 'Log in';
  static String get register => _isArabic ? 'تسجيل' : 'Register';
  static String get haveNoAccount =>
      _isArabic ? 'ليس لديك حساب؟ ' : "Don't have an account? ";
  static String get haveAccount =>
      _isArabic ? 'لديك حساب بالفعل؟ ' : 'Already have an account? ';
  static String get pharmacistPortal =>
      _isArabic ? 'بوابة الصيدلي' : 'Pharmacist Portal';
  static String get changePasswordTitle =>
      _isArabic ? 'تغيير كلمة المرور' : 'Change Password';
  static String get changePasswordSubtitle =>
      _isArabic ? 'تحديث كلمة مرور الحساب' : 'Update your account password';
  static String get updatePassword =>
      _isArabic ? 'تحديث كلمة المرور' : 'Update Password';
  static String get passwordUpdateHint => _isArabic
      ? 'يرجى إدخال كلمة المرور الحالية واختيار كلمة جديدة.'
      : 'Please enter your current password and choose a new one.';
  static String get currentPassword =>
      _isArabic ? 'كلمة المرور الحالية' : 'Current Password';
  static String get enterCurrentPassword =>
      _isArabic ? 'أدخل كلمة المرور الحالية' : 'Enter current password';
  static String get newPassword =>
      _isArabic ? 'كلمة المرور الجديدة' : 'New Password';
  static String get enterNewPassword =>
      _isArabic ? 'أدخل كلمة المرور الجديدة' : 'Enter new password';
  static String get confirmNewPassword =>
      _isArabic ? 'تأكيد كلمة المرور الجديدة' : 'Confirm New Password';
  static String get reEnterNewPassword =>
      _isArabic ? 'أعد إدخال كلمة المرور الجديدة' : 'Re-enter new password';

  // sales
  static String get recordSale => _isArabic ? 'تسجيل بيع' : 'Record Sale';
  static String get recordSaleSubtitle =>
      _isArabic ? 'إنشاء سجل بيع جديد' : 'Create a new sale record';
  static String get selectInventory =>
      _isArabic ? 'اختر صنف من المخزون' : 'Select Inventory';
  static String get noInventoryToSell => _isArabic
      ? 'لا يوجد مخزون متاح للبيع.'
      : 'No inventory available to sell.';
  static String get inventoryRequired =>
      _isArabic ? 'اختر عنصرًا من المخزون.' : 'Select an inventory.';
  static String get quantitySold =>
      _isArabic ? 'الكمية المباعة' : 'Quantity Sold';
  static String get unitPrice => _isArabic ? 'سعر الوحدة' : 'Unit Price';
  static String get soldAtIso =>
      _isArabic ? 'وقت البيع (ISO 8601)' : 'Sold At (ISO 8601)';
  static String get requiredField => _isArabic ? 'مطلوب' : 'Required';
  static String get saleSuccess =>
      _isArabic ? 'تم تسجيل البيع بنجاح!' : 'Sale recorded successfully!';
  static String get inventoryErrorPrefix =>
      _isArabic ? 'خطأ في تحميل المخزون: ' : 'Error loading inventory: ';
  static String get qtyShort => _isArabic ? 'الكمية' : 'Qty';

  // notifications
  static String get alertsTitle => _isArabic ? 'التنبيهات' : 'Alerts';
  static String get alertsSubtitle => _isArabic
      ? 'مراقبة تنبيهات وإشعارات النظام'
      : 'Monitor system alerts and notifications';
  static String get criticalLowStock =>
      _isArabic ? 'انخفاض حرج في المخزون' : 'Critical Low Stock';
  static String get criticalLowStockMessage => _isArabic
      ? 'وصل Aspirin 500mg إلى مستوى مخزون حرج (المتبقي 5 وحدات)'
      : 'Aspirin 500mg has reached critical stock level (5 units remaining)';
  static String get fiveHoursAgo => _isArabic ? 'منذ 5 ساعات' : '5 hours';
  static String get warning => _isArabic ? 'تحذير' : 'Warning';
  static String get acknowledge => _isArabic ? 'تأكيد' : 'Acknowledge';
  static String get unread => _isArabic ? 'غير مقروء' : 'Unread';
  static String get all => _isArabic ? 'الكل' : 'All';
  static String get total => _isArabic ? 'الإجمالي' : 'Total';
  static String get noNotifications =>
      _isArabic ? 'لا توجد إشعارات' : 'No notifications found';
  static String get notificationsRetryHint => _isArabic
      ? 'جرّب تغيير الفلتر أو أعد المحاولة لاحقًا.'
      : 'Try changing the filter or check again later.';
  static String get read => _isArabic ? 'مقروء' : 'Read';
  static String get markAsRead => _isArabic ? 'وضع كمقروء' : 'Mark as read';
  static String get justNow => _isArabic ? 'الآن' : 'Just now';
  static String get minAgo => _isArabic ? 'دقيقة مضت' : 'min ago';
  static String get hourAgo => _isArabic ? 'ساعة مضت' : 'hour ago';
  static String get dayAgo => _isArabic ? 'يوم مضى' : 'day ago';

  // proposal
  static String get proposalDetails =>
      _isArabic ? 'تفاصيل المقترح' : 'Proposal Details';
  static String get proposalId => _isArabic ? 'رقم المقترح' : 'Proposal ID';
  static String get idPrefix => _isArabic ? 'المعرّف: ' : 'ID: ';
  static String get noProposalDetailsYet => _isArabic
      ? 'لا توجد تفاصيل إضافية حاليًا.'
      : 'No further details available yet.';
  static String get approve => _isArabic ? 'قبول' : 'Approve';
  static String get reject => _isArabic ? 'رفض' : 'Reject';
  static String get items => _isArabic ? 'العناصر' : 'Items';
  static String get itemsSuffix => _isArabic ? 'عنصر' : 'items';
  static String get totalCost => _isArabic ? 'التكلفة الإجمالية' : 'Total cost';
  static String get compare => _isArabic ? 'مقارنة' : 'Compare';
  static String get extraction => _isArabic ? 'استخراج' : 'Extraction';
  static String get generateProposal =>
      _isArabic ? 'توليد مقترح' : 'Generate Proposal';
  static String get proposalGeneratedSuccess => _isArabic
      ? 'تم توليد المقترح بنجاح!'
      : 'Proposal generated successfully!';
  static String get comparisonSuccess =>
      _isArabic ? 'تمت المقارنة بنجاح!' : 'Comparison successful!';
  static String get noAvailableOffers =>
      _isArabic ? 'لا توجد عروض متاحة.' : 'No available offers.';
  static String get itemsAndScoreLabel => _isArabic
      ? 'العناصر: {items} | التقييم: {score}'
      : 'Items: {items} | Score: {score}';
  static String get proposalApprovedPrefix =>
      _isArabic ? 'تم قبول المقترح: ' : 'Proposal Approved: ';
  static String get proposalRejectedPrefix =>
      _isArabic ? 'تم رفض المقترح: ' : 'Proposal Rejected: ';

  // inventory create/adjust
  static String get addItem => _isArabic ? 'إضافة صنف' : 'Add Item';
  static String get addItemSubtitle =>
      _isArabic ? 'إضافة عنصر جديد للمخزون' : 'Add a new inventory item';
  static String get newInventoryItem =>
      _isArabic ? 'عنصر مخزون جديد' : 'New Inventory Item';
  static String get productName => _isArabic ? 'اسم المنتج' : 'Product Name';
  static String get enterProductName =>
      _isArabic ? 'أدخل اسم المنتج' : 'Enter product name';
  static String get strength => _isArabic ? 'التركيز' : 'Strength';
  static String get quantityOnHand =>
      _isArabic ? 'الكمية المتوفرة' : 'Quantity on Hand';
  static String get minThreshold =>
      _isArabic ? 'الحد الأدنى' : 'Minimum Threshold';
  static String get enterQuantity =>
      _isArabic ? 'أدخل الكمية' : 'Enter quantity';
  static String get enterMinThreshold =>
      _isArabic ? 'أدخل الحد الأدنى' : 'Enter min threshold';
  static String get productRequired =>
      _isArabic ? 'اسم المنتج مطلوب' : 'Product name is required';
  static String get addedSuccessfullySuffix =>
      _isArabic ? 'تمت إضافته بنجاح!' : ' added successfully!';
  static String get adjustInventory =>
      _isArabic ? 'تعديل المخزون' : 'Adjust Inventory';
  static String get adjustmentLabel => _isArabic
      ? 'التعديل (استخدم قيمة سالبة للنقص)'
      : 'Adjustment (use negative for decrease)';
  static String get adjustmentHint =>
      _isArabic ? 'مثل -5 أو 10' : 'e.g. -5 or 10';
  static String get reason => _isArabic ? 'السبب' : 'Reason';
  static String get reasonHint =>
      _isArabic ? 'مثل وحدات تالفة' : 'e.g. Damaged units';
  static String get adjustmentRequired =>
      _isArabic ? 'قيمة التعديل مطلوبة' : 'Adjustment value is required';

  // POS
  static String get pos => _isArabic ? 'نقطة البيع' : 'POS';
  static String get posSubtitle =>
      _isArabic ? 'إدارة المبيعات والمعاملات' : 'Manage sales and transactions';
  static String get checkout => _isArabic ? 'الدفع' : 'Checkout';
  static String get posTransactions => _isArabic ? 'المعاملات' : 'Transactions';
  static String get discountPercentage =>
      _isArabic ? 'الخصم (%)' : 'Discount (%)';
  static String get posSubtotalLabel =>
      _isArabic ? 'المجموع الجزئي' : 'Subtotal';
  static String get posTotalLabel => _isArabic ? 'الإجمالي' : 'Total';
  static String get posTotalPaid => _isArabic ? 'إجمالي المدفوع' : 'Total Paid';
  static String get addPayment => _isArabic ? 'إضافة دفعة' : 'Add Payment';
  static String get paymentMethod =>
      _isArabic ? 'طريقة الدفع' : 'Payment Method';
  static String get amountPaidLabel =>
      _isArabic ? 'المبلغ المدفوع' : 'Amount Paid';
  static String get cash => _isArabic ? 'نقدي' : 'Cash';
  static String get card => _isArabic ? 'بطاقة' : 'Card';
  static String get insuranceMethod => _isArabic ? 'تأمين' : 'Insurance';
  static String get checkoutSuccess =>
      _isArabic ? 'تمت عملية الدفع بنجاح!' : 'Checkout completed!';
  static String get paymentMismatch => _isArabic
      ? 'مجموع المدفوعات يجب أن يساوي الإجمالي'
      : 'Payments total must equal the order total';
  static String get paymentAmountRequired =>
      _isArabic ? 'أدخل مبلغ صحيح > 0' : 'Enter a valid amount > 0';
  static String get receiptNumber =>
      _isArabic ? 'رقم الإيصال: ' : 'Receipt #: ';
  static String get cashierLabel => _isArabic ? 'الكاشير' : 'Cashier';
  static String get statusLabel => _isArabic ? 'الحالة' : 'Status';
  static String get itemsSection => _isArabic ? 'المنتجات' : 'Items';
  static String get paymentsSection => _isArabic ? 'طرق الدفع' : 'Payments';
  static String get refund => _isArabic ? 'استرداد' : 'Refund';
  static String get refundConfirmTitle =>
      _isArabic ? 'تأكيد الاسترداد' : 'Confirm Refund';
  static String get refundConfirmMessage => _isArabic
      ? 'هل أنت متأكد من استرداد هذه المعاملة؟'
      : 'Are you sure you want to refund this transaction?';
  static String get refundSuccess =>
      _isArabic ? 'تم الاسترداد بنجاح!' : 'Refund successful!';
  static String get alreadyRefunded => _isArabic
      ? 'تم استرداد هذه المعاملة مسبقًا'
      : 'Transaction already refunded';
  static String get noTransactions =>
      _isArabic ? 'لا توجد معاملات' : 'No transactions found';
  static String get transactionDetails =>
      _isArabic ? 'تفاصيل المعاملة' : 'Transaction Details';
  static String get posStatusCompleted => _isArabic ? 'مكتمل' : 'Completed';
  static String get posStatusRefunded => _isArabic ? 'مسترد' : 'Refunded';

  // Proposal PDF Export / Selection
  static String get downloadPdf => _isArabic ? 'تنزيل PDF' : 'Download PDF';
  static String get selectToDownload =>
      _isArabic ? 'اختر المقترحات للتنزيل' : 'Select proposals to download';
  static String get selectedCountSuffix => _isArabic ? 'محدد' : 'selected';
  static String get pdfDownloadSuccess => _isArabic
      ? 'تم تنزيل ملف PDF في مجلد التنزيلات'
      : 'PDF saved to the Downloads folder';
  static String get noProposalSelected =>
      _isArabic ? 'اختر مقترحًا على الأقل' : 'Select at least one proposal';

  // camera/upload
  static String get camera => _isArabic ? 'الكاميرا' : 'Camera';
  static String get captureFailedPrefix =>
      _isArabic ? 'فشل الالتقاط: ' : 'Capture failed: ';
  static String get uploadFile => _isArabic ? 'رفع ملف' : 'Upload File';
  static String get uploadFileSubtitle => _isArabic
      ? 'ارفع ملفات PDF أو Excel أو صور'
      : 'Upload PDF, Excel, or Image files';
  static String get uploadImage => _isArabic ? 'رفع صورة' : 'Upload Image';
  static String get uploadPdf => _isArabic ? 'رفع PDF/Excel' : 'Upload PDF/Excel';
  static String get uploadExcel => _isArabic ? 'رفع Excel' : 'Upload Excel';
  static String get filePickingNotAvailable => _isArabic
      ? 'اختيار الملفات غير متاح على هذه المنصة/النسخة.'
      : 'File picking is not available on this platform/build.';
  static String get failedToPickFilePrefix =>
      _isArabic ? 'فشل اختيار الملف: ' : 'Failed to pick file: ';
  static String get filesAddedSuffix =>
      _isArabic ? ' ملفات تمت إضافتها' : ' files added';
  static String get uploadAllFiles =>
      _isArabic ? 'رفع جميع الملفات' : 'Upload All Files';
  static String get uploading => _isArabic ? 'جارٍ الرفع...' : 'Uploading...';
  static String get supportedFormats =>
      _isArabic ? 'الصيغ المدعومة:' : 'Supported formats:';
  static String get images => _isArabic ? 'الصور:' : 'Images:';
  static String get documents => _isArabic ? 'المستندات:' : 'Documents:';
  static String get spreadsheets => _isArabic ? 'الجداول:' : 'Spreadsheets:';
  static String get maxFileSize =>
      _isArabic ? 'الحد الأقصى لحجم الملف: 10 MB' : 'Maximum file size: 10 MB';
}
