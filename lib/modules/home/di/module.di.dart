import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/home/src/data/remote/services/product.service.dart';
import 'package:flutter_sbf/modules/home/src/data/repository/product.repository.dart';
import 'package:flutter_sbf/modules/home/src/presentation/home/home.viewmodel.dart';

Future<void> startHomeModules() async {
  // Services
  inject.registerFactory<ProductService>(() => ProductServiceImpl());

  // Repositories
  inject.registerFactory<ProductRepository>(() => ProductRepositoryImpl());

  // ViewModels
  inject.registerSingleton<HomeViewModel>(HomeViewModel());
}
