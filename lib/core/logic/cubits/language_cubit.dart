import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/shared_pref_keys.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/app_shared_preferences.dart';

class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super('en');

  Future<void> loadInitialLanguage() async {
    final savedLanguage = AppSharedPreferences().getString(
      AppSharedPrefKeys.language,
    );
    if (savedLanguage == 'ar' || savedLanguage == 'en') {
      emit(savedLanguage!);
    } else {
      emit('en');
    }
  }

  Future<void> toggleLanguage() async {
    final nextLanguage = state == 'en' ? 'ar' : 'en';
    await AppSharedPreferences().setString(
      AppSharedPrefKeys.language,
      nextLanguage,
    );
    emit(nextLanguage);
  }
}
