import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSplashFinishedProvider = StateProvider<bool>((ref) => false);
final currentPageProvider = StateProvider<int>((ref) => 0);
final obscureTextProvider = StateProvider<bool>((ref) => true);
final rememberMeProvider = StateProvider<bool>((ref) => false);
final termsProvider = StateProvider<bool>((ref) => false);
final pageControllerProvider = Provider<PageController>((ref) {
  final controller = PageController();
  ref.onDispose(() => controller.dispose());
  return controller;
});
