import 'package:estudo_rick_xp_flutter/shared/theme/data/app_theme_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeCubit extends Cubit<String> {
  ThemeCubit(this._repository) : super(_repository.theme ?? '');

  final AppThemeRepository _repository;

  void changeTheme(String themeNome) {
    _repository.changeTheme(themeNome);
    emit(themeNome);
  }
}
