import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/modules/core/data/prefs/shared_prefs_helper.dart';
import 'package:weather_app/modules/core/di/di.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final SharedHelper sharedPreferenceService;
  LanguageCubit(this.sharedPreferenceService) : super(LanguageSupportInitial());

  Future<void> getLocale() async {
    emit(LanguageSupportLoading());
    var locale = await sharedPreferenceService.getString(languageKey);
    if (locale == null) {
      emit(const LanguageSupportLoaded('', false));
    } else {
      emit(LanguageSupportLoaded(locale, true));
    }
  }

  Future<void> changeLocale(String val) async {
    emit(LanguageSupportLoading());
    await inject.isReady<SharedPreferences>();
    await sharedPreferenceService.saveString(languageKey, val);
    emit(LanguageSupportLoaded(val, true));
  }
}
