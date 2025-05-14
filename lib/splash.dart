import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/onboarding/on_boarding_screen.dart';
import 'package:pretium/providers.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size screenSize = MediaQuery.of(context).size;
    double scaleFactor = screenSize.width * 0.3;
    final bool isSplashFinished = ref.watch(isSplashFinishedProvider);

    if (!isSplashFinished) {
      Future.delayed(Duration(seconds: 3), () {
        ref.read(isSplashFinishedProvider.notifier).state = true;
      });
    }

    if (isSplashFinished) {
      Future.microtask(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (_) => OnboardingScreen(
                    scaleFactor: scaleFactor,
                  )),
        );
      });
    }

    return Scaffold(
      backgroundColor: Color(0xFF0B6766),
      body: Center(
        child: Image.asset(
          'pretium_finance_logo.jpeg',
          height: scaleFactor,
          width: scaleFactor,
        ),
      ),
    );
  }
}
