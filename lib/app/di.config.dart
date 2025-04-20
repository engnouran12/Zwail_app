// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/common/data/repository_impl/preferences_repository_impl.dart'
    as _i497;
import '../core/common/domain/repository/preferences_repository.dart' as _i553;
import '../core/common/presentation/locale/notifier/locale_notifier.dart'
    as _i801;
import '../core/helpers/dialog_helper.dart' as _i613;
import '../core/network/interceptors/custom_interceptor.dart' as _i578;
import '../core/network/interceptors/mock_interceptor.dart' as _i363;
import '../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i719;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i570;
import '../features/auth/domain/repositories/auth_repository.dart' as _i869;
import '../features/auth/domain/usecases/forgot_password_usecase.dart' as _i532;
import '../features/auth/domain/usecases/get_user_usecase.dart' as _i728;
import '../features/auth/domain/usecases/login_usecase.dart' as _i406;
import '../features/auth/domain/usecases/register_usecase.dart' as _i819;
import '../features/auth/domain/usecases/verify_email_usecase.dart' as _i792;
import '../features/auth/presentation/cubit/auth_cubit.dart' as _i70;
import '../features/course/data/datasources/course_remote_data_source.dart'
    as _i1002;
import '../features/course/data/repositories/course_repository_impl.dart'
    as _i673;
import '../features/course/domain/repositories/course_repository.dart' as _i269;
import '../features/course/domain/usecases/get_all_categories_usecase.dart'
    as _i758;
import '../features/course/domain/usecases/get_category_details_usecase.dart'
    as _i311;
import '../features/course/domain/usecases/get_course_details_usecase.dart'
    as _i500;
import '../features/course/domain/usecases/get_courses_filtered_usecase.dart'
    as _i243;
import '../features/course/presentation/categories/cubit/categories_cubit.dart'
    as _i267;
import '../features/course/presentation/course_details/cubit/course_details_cubit.dart'
    as _i547;
import '../features/course/presentation/courses_list/cubit/courses_cubit.dart'
    as _i649;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i363.MockInterceptor>(() => _i363.MockInterceptor());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i649.CoursesCubit>(() => _i649.CoursesCubit());
    gh.factory<_i547.CourseDetailsCubit>(() => _i547.CourseDetailsCubit());
    gh.lazySingleton<_i613.DialogManager>(() => _i613.DialogManager());
    gh.lazySingleton<_i70.AuthCubit>(() => _i70.AuthCubit());
    gh.lazySingleton<_i267.CategoriesCubit>(() => _i267.CategoriesCubit());
    gh.factory<_i1002.CourseRemoteDataSource>(
        () => _i1002.CourseRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.factory<_i553.PreferencesRepository>(
        () => _i497.PreferencesRepositoryImpl(gh<_i460.SharedPreferences>()));
    gh.singleton<_i801.LocaleCubit>(
        () => _i801.LocaleCubit(gh<_i553.PreferencesRepository>()));
    gh.lazySingleton<_i719.AuthRemoteDataSource>(
        () => _i719.AuthRemoteDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i869.AuthRepository>(() => _i570.AuthRepositoryImpl(
          gh<_i553.PreferencesRepository>(),
          authRemoteDataSource: gh<_i719.AuthRemoteDataSource>(),
        ));
    gh.factory<_i532.ForgotPasswordUsecase>(
        () => _i532.ForgotPasswordUsecase(gh<_i869.AuthRepository>()));
    gh.factory<_i819.SignUpUsecase>(
        () => _i819.SignUpUsecase(gh<_i869.AuthRepository>()));
    gh.factory<_i406.LoginUsecase>(
        () => _i406.LoginUsecase(gh<_i869.AuthRepository>()));
    gh.factory<_i728.GetUserUsecase>(
        () => _i728.GetUserUsecase(gh<_i869.AuthRepository>()));
    gh.factory<_i792.VerifyEmailUsecase>(
        () => _i792.VerifyEmailUsecase(gh<_i869.AuthRepository>()));
    gh.lazySingleton<_i269.CourseRepository>(() => _i673.CourseRepositoryImpl(
        courseRemoteDataSource: gh<_i1002.CourseRemoteDataSource>()));
    gh.factory<_i311.GetCategoryDetailsUsecase>(
        () => _i311.GetCategoryDetailsUsecase(gh<_i269.CourseRepository>()));
    gh.factory<_i758.GetAllCategoriesUsecase>(
        () => _i758.GetAllCategoriesUsecase(gh<_i269.CourseRepository>()));
    gh.factory<_i243.GetCoursesFilteredUsecase>(
        () => _i243.GetCoursesFilteredUsecase(gh<_i269.CourseRepository>()));
    gh.factory<_i500.GetCourseDetailsUsecase>(
        () => _i500.GetCourseDetailsUsecase(gh<_i269.CourseRepository>()));
    gh.factory<_i578.CustomInterceptor>(
        () => _i578.CustomInterceptor(gh<_i553.PreferencesRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i913.RegisterModule {}
