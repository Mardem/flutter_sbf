import 'package:flutter_sbf/core/di/inject.dart';
import 'package:flutter_sbf/modules/home/src/presentation/home/home.viewmodel.dart';

Future<void> startHomeModules() async {
  // Interactors

  // Repositories

  // ViewModels
  inject.registerSingleton<HomeViewModel>(HomeViewModel());

  // Services
}
