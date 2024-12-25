// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/api/api_manager.dart' as _i237;
import 'features/main_layout/home/data/data_source/remote/category_remote_ds.dart'
    as _i868;
import 'features/main_layout/home/data/data_source/remote/category_remote_ds_impl.dart'
    as _i93;
import 'features/main_layout/home/data/repository/category_repo_impl.dart'
    as _i555;
import 'features/main_layout/home/domain/repository/category_repo.dart'
    as _i288;
import 'features/main_layout/home/domain/usecases/get_category_usecase.dart'
    as _i441;
import 'features/main_layout/home/presentation/bloc/home_bloc.dart' as _i123;

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
    gh.lazySingleton<_i237.ApiManager>(() => _i237.ApiManager());
    gh.factory<_i868.CategoryRemoteDs>(() => _i93.CategoryRemoteDsImpl());
    gh.factory<_i288.CategoryRepo>(
        () => _i555.CategoryRepoImpl(gh<_i868.CategoryRemoteDs>()));
    gh.factory<_i441.GetCategoryUsecase>(
        () => _i441.GetCategoryUsecase(gh<_i288.CategoryRepo>()));
    gh.factory<_i123.HomeBloc>(
        () => _i123.HomeBloc(gh<_i441.GetCategoryUsecase>()));
    return this;
  }
}
