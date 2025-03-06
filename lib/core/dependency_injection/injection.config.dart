// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:finnhub_news/application/blocs/network_info/network_info_bloc.dart'
    as _i3;
import 'package:finnhub_news/application/blocs/news_impl/news_impl_bloc.dart'
    as _i638;
import 'package:finnhub_news/core/shared/utilities/network_info.dart' as _i343;
import 'package:finnhub_news/data/api/news_api.dart' as _i843;
import 'package:finnhub_news/data/repository/news_repository.dart' as _i294;
import 'package:finnhub_news/data/storage_services/secure_storage.dart'
    as _i636;
import 'package:finnhub_news/domain/i_news_repository/i_news_repository.dart'
    as _i89;
import 'package:finnhub_news/infrastructure/di/injectable_module.dart'
    as _i1026;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:uuid/uuid.dart' as _i706;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i706.Uuid>(() => injectableModule.uuid);
    gh.lazySingleton<_i895.Connectivity>(() => injectableModule.connectivity);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => injectableModule.internetConnectionChecker);
    gh.lazySingleton<_i343.NetworkInfoImpl>(() => injectableModule.networkInfo);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => injectableModule.storage);
    gh.lazySingleton<_i636.SecureStorage>(() => injectableModule.secureStorage);
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio);
    gh.lazySingleton<_i843.NewsApiServiceClient>(
        () => injectableModule.newsApiServiceClient);
    gh.lazySingleton<_i294.NewsRepositoryImpl>(
        () => injectableModule.newsRepository);
    gh.lazySingleton<_i343.NetworkInfo>(() => _i343.NetworkInfoImpl(
          connectivity: gh<_i895.Connectivity>(),
          internetConnectionChecker: gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i3.NetworkInfoBloc>(() => _i3.NetworkInfoBloc(
          networkInfo: gh<_i343.NetworkInfo>(),
          connectivity: gh<_i895.Connectivity>(),
        ));
    gh.lazySingleton<_i89.INewsRepository>(
        () => _i294.NewsRepositoryImpl(gh<_i843.NewsApiServiceClient>()));
    gh.factory<_i638.NewsImplBloc>(
        () => _i638.NewsImplBloc(iNewsRepository: gh<_i89.INewsRepository>()));
    return this;
  }
}

class _$InjectableModule extends _i1026.InjectableModule {}
