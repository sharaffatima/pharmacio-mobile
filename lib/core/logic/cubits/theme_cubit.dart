import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/shared_pref_keys.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/app_shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  Future<void> loadInitialTheme() async {
    final savedTheme = AppSharedPreferences().getBool(AppSharedPrefKeys.theme);
    emit(savedTheme ?? false);
  }

  Future<void> toggleTheme() async {
    final nextTheme = !state;
    await AppSharedPreferences().setBool(AppSharedPrefKeys.theme, nextTheme);
    emit(nextTheme);
  }
}
