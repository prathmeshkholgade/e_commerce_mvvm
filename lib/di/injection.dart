import 'package:e_commerce_app/data/datasources/auth_data_source.dart';
import 'package:e_commerce_app/data/datasources/product_data_source.dart';
import 'package:e_commerce_app/data/datasources_imp/auth_data_source_imp.dart';
import 'package:e_commerce_app/data/datasources_imp/products_data_source_imp.dart';
import 'package:e_commerce_app/data/repositoies/auth_repository_imp.dart';
import 'package:e_commerce_app/data/repositoies/product_repository_imp.dart';
import 'package:e_commerce_app/domain/repository/auth_repository.dart';
import 'package:e_commerce_app/domain/repository/product_repository.dart';
import 'package:e_commerce_app/domain/usecase/auth/login_usecase.dart';
import 'package:e_commerce_app/domain/usecase/product/get_products_usecase.dart';
import 'package:e_commerce_app/presentation/bloc/auth/auth_controller.dart';
import 'package:e_commerce_app/presentation/bloc/products/products_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  // data sorce
  sl.registerLazySingleton<ProductDataSource>(() => ProductsDataSourceImp());
  // repo
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImp(productDataSource: sl()),
  );
  // use case
  sl.registerLazySingleton(() => GetProductsUsecase(productRepository: sl()));
  // controller
  sl.registerLazySingleton(() => ProductsController(getProductsUsecase: sl()));

  // all of this for user or authentication (auth)
  // data source
  sl.registerLazySingleton<AuthDatasource>(() => AuthDataSourceImp());
  // repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(authDatasource: sl()),
  );
  // usecase
  sl.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(authRepository: sl()),
  );
  // getx controller
  sl.registerLazySingleton(() => AuthController(loginUseCase: sl()));
}
