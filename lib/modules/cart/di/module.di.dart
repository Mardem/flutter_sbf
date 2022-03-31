import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/cart/src/presentation/home/cart.viewmodel.dart';

Future<void> startCartModules() async {
  // Interactors

  // Repositories

  // ViewModels
  inject.registerSingleton<CartViewModel>(CartViewModel());

  // Services
}
