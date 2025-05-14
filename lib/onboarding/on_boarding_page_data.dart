import 'package:flutter/material.dart';

class OnboardingPageData {
  final IconData icon;
  final String title;
  final String description;

  OnboardingPageData({
    required this.icon,
    required this.title,
    required this.description,
  });
}

final onboardingPagesList = [
  OnboardingPageData(
    icon: Icons.credit_card,
    title: 'Direct Pay',
    description: 'Pay with crypto across Africa effortlessly',
  ),
  OnboardingPageData(
    icon: Icons.account_balance_wallet,
    title: 'Accept Payments',
    description: 'Accept stablecoin payments hastle-free',
  ),
  OnboardingPageData(
    icon: Icons.receipt_long_outlined,
    title: 'Pay Bills',
    description: 'Pay for utility services and earn rewards',
  ),
];
