import 'package:flutter/material.dart';
import 'onboarding_step1.dart';
import 'onboarding_step2.dart';
import 'onboarding_step3.dart'; // هننشئ الملف ده دلوقتي

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({super.key});

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  final PageController _pageController = PageController();

  // وظيفة السكيب الجديدة: تنقله للسكرين اللي بعدها
  void _onSkip() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _onNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _onBack() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(), // مسموح بالسحب بالإيد برضه لو حابة
        children: [
          OnboardingStep1(onNext: _onNext, onSkip: _onSkip),
          OnboardingStep2(onNext: _onNext, onBack: _onBack, onSkip: _onSkip),
          OnboardingStep3(onBack: _onBack), // آخر سكرين مفيهاش سكيب غالباً أو السكيب بيقفل
        ],
      ),
    );
  }
}