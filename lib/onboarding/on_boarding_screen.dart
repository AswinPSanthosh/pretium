import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/auth_screens/login.dart';
import 'package:pretium/onboarding/on_boarding_page_data.dart';
import 'package:pretium/onboarding/on_boarding_pages.dart';
import 'package:pretium/providers.dart';

class OnboardingPageModel {
  final IconData icon;
  final String title;
  final String description;

  OnboardingPageModel({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class OnboardingScreen extends ConsumerWidget {
  final double scaleFactor;

  const OnboardingScreen({super.key, required this.scaleFactor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(pageControllerProvider);
    final currentPage = ref.watch(currentPageProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(scaleFactor * 0.12),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginPage(scaleFactor: scaleFactor)),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: scaleFactor * 0.12,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (int page) {
                  ref.read(currentPageProvider.notifier).state = page;
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  final page = onboardingPagesList[index];
                  return OnboardingPage(
                    icon: page.icon,
                    scaleFactor: scaleFactor,
                    title: page.title,
                    description: page.description,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: scaleFactor * 0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    width: index == currentPage
                        ? scaleFactor * 0.16
                        : scaleFactor * 0.05,
                    height: scaleFactor * 0.05,
                    margin:
                        EdgeInsets.symmetric(horizontal: scaleFactor * 0.025),
                    decoration: BoxDecoration(
                      color: index == currentPage
                          ? Color(0xFF0B6766)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(scaleFactor * 0.025),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(scaleFactor * 0.16),
              child: SizedBox(
                width: double.infinity,
                height: scaleFactor * 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentPage < 2) {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginPage(scaleFactor: scaleFactor)),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0B6766),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(scaleFactor * 0.05),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: scaleFactor * 0.15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
