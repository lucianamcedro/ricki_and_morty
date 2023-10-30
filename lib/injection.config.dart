// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:estudo_rick_xp_flutter/characters/data/repository/character_repository.dart'
    as _i11;
import 'package:estudo_rick_xp_flutter/characters/data/repository/character_repository_imp.dart'
    as _i12;
import 'package:estudo_rick_xp_flutter/characters/data/service/character_service.dart'
    as _i8;
import 'package:estudo_rick_xp_flutter/characters/domain/character_interator.dart'
    as _i13;
import 'package:estudo_rick_xp_flutter/characters/domain/character_interator_imp.dart'
    as _i14;
import 'package:estudo_rick_xp_flutter/characters/presentation/bloc/character_bloc.dart'
    as _i15;
import 'package:estudo_rick_xp_flutter/detail/data/details_repository.dart'
    as _i9;
import 'package:estudo_rick_xp_flutter/detail/data/service/character_details_service.dart'
    as _i7;
import 'package:estudo_rick_xp_flutter/detail/presentation/bloc/character_details_bloc.dart'
    as _i10;
import 'package:estudo_rick_xp_flutter/network/network_module.dart' as _i16;
import 'package:estudo_rick_xp_flutter/preferences/preferences_module.dart'
    as _i17;
import 'package:estudo_rick_xp_flutter/shared/theme/data/app_theme_repository.dart'
    as _i5;
import 'package:estudo_rick_xp_flutter/shared/theme/data/cubit/theme_cubit.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  final preferencesModule = _$PreferencesModule();
  gh.factory<_i3.Interceptor>(
    () => networkModule.providePrettyLogger(),
    instanceName: 'PrettyLogger',
  );
  await gh.singletonAsync<_i4.SharedPreferences>(
    () => preferencesModule.sharedPrefs,
    preResolve: true,
  );
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i5.AppThemeRepository>(
      () => _i5.AppThemeRepositoryImp(gh<_i4.SharedPreferences>()));
  gh.factory<_i3.Dio>(() => networkModule.providerDio(
        gh<String>(instanceName: 'BaseUrl'),
        gh<_i3.Interceptor>(instanceName: 'PrettyLogger'),
      ));
  gh.factory<_i6.ThemeCubit>(
      () => _i6.ThemeCubit(gh<_i5.AppThemeRepository>()));
  gh.factory<_i7.CharacterDetailsService>(
      () => _i7.CharacterDetailsServiceImpl(gh<_i3.Dio>()));
  gh.factory<_i8.CharacterService>(
      () => _i8.CharacterServiceImp(gh<_i3.Dio>()));
  gh.factory<_i9.DetailsRepository>(
      () => _i9.DetailsRepositoryImpl(gh<_i7.CharacterDetailsService>()));
  gh.factory<_i10.CharacterDetailsBloc>(
      () => _i10.CharacterDetailsBloc(gh<_i9.DetailsRepository>()));
  gh.factory<_i11.CharacterRepository>(
      () => _i12.CharacterRepositoryImp(service: gh<_i8.CharacterService>()));
  gh.factory<_i13.CharacterInterator>(() =>
      _i14.CharacterInteratorImp(repository: gh<_i11.CharacterRepository>()));
  gh.factory<_i15.CharacterBloc>(
      () => _i15.CharacterBloc(gh<_i13.CharacterInterator>()));
  return getIt;
}

class _$NetworkModule extends _i16.NetworkModule {}

class _$PreferencesModule extends _i17.PreferencesModule {}
