// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:estudo_rick_xp_flutter/characters/data/repository/character_repository.dart'
    as _i5;
import 'package:estudo_rick_xp_flutter/characters/data/repository/character_repository_imp.dart'
    as _i6;
import 'package:estudo_rick_xp_flutter/characters/data/service/character_service.dart'
    as _i4;
import 'package:estudo_rick_xp_flutter/characters/domain/character_interator.dart'
    as _i7;
import 'package:estudo_rick_xp_flutter/characters/domain/character_interator_imp.dart'
    as _i8;
import 'package:estudo_rick_xp_flutter/characters/presentation/bloc/character_bloc.dart'
    as _i9;
import 'package:estudo_rick_xp_flutter/network/network_module.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.factory<_i3.Interceptor>(
    () => networkModule.providePrettyLogger(),
    instanceName: 'PrettyLogger',
  );
  gh.factory<String>(
    () => networkModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i3.Dio>(() => networkModule.providerDio(
        gh<String>(instanceName: 'BaseUrl'),
        gh<_i3.Interceptor>(instanceName: 'PrettyLogger'),
      ));
  gh.factory<_i4.CharacterService>(
      () => _i4.CharacterServiceImp(gh<_i3.Dio>()));
  gh.factory<_i5.CharacterRepository>(
      () => _i6.CharacterRepositoryImp(service: gh<_i4.CharacterService>()));
  gh.factory<_i7.CharacterInterator>(() =>
      _i8.CharacterInteratorImp(repository: gh<_i5.CharacterRepository>()));
  gh.factory<_i9.CharacterBloc>(
      () => _i9.CharacterBloc(gh<_i7.CharacterInterator>()));
  return getIt;
}

class _$NetworkModule extends _i10.NetworkModule {}
