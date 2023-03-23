part of 'langauge_cubit.dart';

@immutable
abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageSupportInitial extends LanguageState {}

class LanguageSupportLoading extends LanguageState {}

class LanguageSupportLoaded extends LanguageState {
  final String language;
  final bool hasCustomLanguage;

  const LanguageSupportLoaded(this.language, this.hasCustomLanguage);

  @override
  List<Object> get props => [language];
}
