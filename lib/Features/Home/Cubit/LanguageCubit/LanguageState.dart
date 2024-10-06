part of 'LanguageCubit.dart';
@immutable
sealed class LanguageState {}

final class LanguageInitial extends LanguageState {}
final class LanguageChanged extends LanguageState {
  final String type;
  LanguageChanged(this.type);
}