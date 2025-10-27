import 'package:evently_app/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/widgets/onboarding_controls.dart';
import '../../core/widgets/onboarding_item.dart';
import '../../core/resources/assets_manager.dart';
import '../../core/resources/colors_manager.dart';
import '../main_layout/main_layout.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<OnBoardingModel> pages = [
    OnBoardingModel(
      image: ImageAssets.onBoarding1,
      title: "Find Events That Inspire You",
      description:
      "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone.",
    ),
    OnBoardingModel(
      image: ImageAssets.onBoarding2,
      title: "Effortless Event Planning",
      description:
      "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites to managing RSVPs, we’ve got you covered.",
    ),
    OnBoardingModel(
      image: ImageAssets.onBoarding3,
      title: "Connect with Friends & Share Moments",
      description:
      "Make every event memorable by sharing the experience with others. Capture and share the excitement with your network.",
    ),
  ];

  void nextPage() {
    if (currentIndex == pages.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  MainLayout()),
      );
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void backPage() {
    if (currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteBlue,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) =>
                    OnboardingItem(model: pages[index]),
              ),
            ),
            OnboardingControls(
              currentIndex: currentIndex,
              totalPages: pages.length,
              onNext: nextPage,
              onBack: backPage,
            ),
          ],
        ),
      ),
    );
  }
}
