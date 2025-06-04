import 'package:e_commerce_app/data/datasources/auth_data_source.dart';
import 'package:e_commerce_app/data/datasources/product_data_source.dart';
import 'package:e_commerce_app/data/datasources_imp/auth_data_source_imp.dart';
import 'package:e_commerce_app/data/datasources_imp/products_data_source_imp.dart';
import 'package:e_commerce_app/data/repositoies/auth_repository_imp.dart';
import 'package:e_commerce_app/data/repositoies/product_repository_imp.dart';
import 'package:e_commerce_app/domain/repository/auth_repository.dart';
import 'package:e_commerce_app/domain/repository/product_repository.dart';
import 'package:e_commerce_app/domain/usecase/auth/login_usecase.dart';
import 'package:e_commerce_app/domain/usecase/product/fetch_productby_category_usecase.dart';
import 'package:e_commerce_app/domain/usecase/product/get_products_usecase.dart';
import 'package:e_commerce_app/domain/usecase/product/sort_category_product_usecase.dart';
import 'package:e_commerce_app/domain/usecase/product/sort_products_usecase.dart';
import 'package:e_commerce_app/presentation/bloc/auth/auth_controller.dart';
import 'package:e_commerce_app/presentation/bloc/products/products_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class SetUpServiceLocator {
  static void inject() {
    _injectDataSources();
    _injectRepositories();
    _injectUseCases();
    _injectControllers();
  }

  static void _injectDataSources() {
    sl.registerLazySingleton<AuthDatasource>(() => AuthDataSourceImp());
    sl.registerLazySingleton<ProductDataSource>(() => ProductsDataSourceImp());
  }

  static void _injectRepositories() {
    sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImp(productDataSource: sl()),
    );
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(authDatasource: sl()),
    );
  }

  static void _injectUseCases() {
    sl.registerLazySingleton(() => GetProductsUsecase(productRepository: sl()));
    sl.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(authRepository: sl()),
    );
    sl.registerLazySingleton(
      () => FetchProductbyCategoryUsecase(productRepository: sl()),
    );
    sl.registerLazySingleton<SortCategoryProductUsecase>(
      () => SortCategoryProductUsecase(productRepository: sl()),
    );
    sl.registerLazySingleton<SortProductsUsecase>(
      () => SortProductsUsecase(productRepository: sl()),
    );
  }

  static void _injectControllers() {
    sl.registerLazySingleton(() => AuthController(loginUseCase: sl()));
    sl.registerLazySingleton(
      () => ProductsController(
        getProductsUsecase: sl(),
        fetchProductbyCategoryUsecase: sl(),
        sortCategoryProductUsecase: sl(),
        sortProductsUsecase: sl(),
      ),
    );
  }
}
