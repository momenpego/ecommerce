import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Network/network_checker.dart';
import 'package:ecommerce_app/features/Category/data/datasources/category_remote_data.dart';
import 'package:ecommerce_app/features/Category/data/repositories/category_rep_imp.dart';
import 'package:ecommerce_app/features/Category/domain/repositories/category_rep.dart';
import 'package:ecommerce_app/features/Category/domain/usecases/add_cart_category_usecase.dart';
import 'package:ecommerce_app/features/Category/domain/usecases/add_fav_category_usecase.dart';
import 'package:ecommerce_app/features/Category/domain/usecases/get_category_usecase.dart';
import 'package:ecommerce_app/features/Category/domain/usecases/get_item_category_usecase.dart';
import 'package:ecommerce_app/features/Category/presentation/bloc/category_bloc.dart';
import 'package:ecommerce_app/features/Home/data/datasources/home_remote_data.dart';
import 'package:ecommerce_app/features/Home/data/repositories/home_repo_imp.dart';
import 'package:ecommerce_app/features/Home/domain/repositories/home_repo.dart';
import 'package:ecommerce_app/features/Home/domain/usecases/add_cart_usecase.dart';
import 'package:ecommerce_app/features/Home/domain/usecases/add_fav_usecase.dart';
import 'package:ecommerce_app/features/Home/domain/usecases/get_home_data_usecase.dart';
import 'package:ecommerce_app/features/Home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_app/features/SignIn/data/datasources/localdata_source.dart';
import 'package:ecommerce_app/features/SignIn/data/repositories/login_repoimp.dart';
import 'package:ecommerce_app/features/SignIn/domain/repositories/login_repo.dart';
import 'package:ecommerce_app/features/SignIn/domain/usecases/login_usecase.dart';
import 'package:ecommerce_app/features/SignIn/presentation/bloc/signin_bloc.dart';
import 'package:ecommerce_app/features/SignUp/data/datasources/sign_up_remote_data.dart';
import 'package:ecommerce_app/features/SignUp/data/repositories/sign_up_repoimp.dart';
import 'package:ecommerce_app/features/SignUp/domain/repositories/sign_up_rep.dart';
import 'package:ecommerce_app/features/SignUp/domain/usecases/sign_up_usecase.dart';
import 'package:ecommerce_app/features/SignUp/presentation/bloc/signup_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> injectAll() async {
  final sharedPreferences = await SharedPreferences.getInstance();

//! ======================================================> External

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<NetWorkChecker>(
      () => NetWorkCheckerImp(connectionChecker: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

//! ======================================================> Data Sources

  sl.registerLazySingleton<LogInRemoteDataSource>(
      () => LogInRemoteDataSourceImp());
  sl.registerLazySingleton<SignUpRemoteDataSource>(
      () => SignUpRemoteDataSourceImp());
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImp(sharedPreferences: sl()));

  sl.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImp(sharedPreferences: sl()));
//! ======================================================> Repositories

  sl.registerLazySingleton<LogInRepositorie>(() =>
      LogInRepositorieImp(logInRemoteDataSource: sl(), netWorkChecker: sl()));
  sl.registerLazySingleton<SignUpRepositorie>(() =>
      SignUpRepositorieImp(netWorkChecker: sl(), signUpRemoteDataSource: sl()));
  sl.registerLazySingleton<HomeRepositorie>(
      () => HomeRepositorieImp(netWorkChecker: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<CategoryRepositorie>(() =>
      CategoryRepositorieImp(netWorkChecker: sl(), remoteDataSource: sl()));
//! ======================================================> UseCases
  //!---LogIn
  sl.registerLazySingleton(() => LogInUseCase(repositorie: sl()));
  //!--SignUp
  sl.registerLazySingleton(() => SignUpUseCase(repositorie: sl()));
  //!--- Home
  sl.registerLazySingleton(() => GetHomeDataUseCase(repositorie: sl()));
  sl.registerLazySingleton(() => AddOrDeleteCartUseCase(repositorie: sl()));
  sl.registerLazySingleton(() => AddOrDeleteFavoriteUseCase(repositorie: sl()));

  //!---category
  sl.registerLazySingleton(() => GetAllCategoryUseCase(repositorie: sl()));
  sl.registerLazySingleton(() => GetCategoryItemUseCase(repositorie: sl()));
  sl.registerLazySingleton(
      () => AddOrDeleteCatergoryItemFavoriteUseCase(repositorie: sl()));
  sl.registerLazySingleton(
      () => AddOrDeleteCatergoryItemCartUseCase(repositorie: sl()));
//! ======================================================> Blocs

  sl.registerFactory(() => SigninBloc(logInUseCase: sl()));
  sl.registerFactory(() => SignupBloc(signUp: sl()));
  sl.registerFactory(() => HomeBloc(
      addOrDeleteCart: sl(), addOrDeleteFavorite: sl(), getHomeData: sl()));
  sl.registerFactory(() => CategoryBloc(
      addOrDeleteCatergoryItemCart: sl(),
      addOrDeleteCatergoryItemFavorite: sl(),
      getAllCategory: sl(),
      getCategoryItem: sl()));
}
