import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'LanguageState.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  dynamic typeLanguage;
  void changeLanguage(dynamic typeLanguage) {
    emit(LanguageChanged(typeLanguage));
  }
}
