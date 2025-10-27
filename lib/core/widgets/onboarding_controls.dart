import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/colors_manager.dart';

class OnboardingControls extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnboardingControls({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back
          IconButton(
            onPressed: currentIndex == 0 ? null : onBack,
            icon: Icon(
              Icons.arrow_back_ios,
              color: currentIndex == 0
                  ? Colors.grey
                  : ColorsManager.blue,
            ),
          ),

          // Dots
          Row(
            children: List.generate(
              totalPages,
                  (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 3.w),
                width: currentIndex == index ? 14.w : 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? ColorsManager.blue
                      : ColorsManager.blue.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),

          // Next
          IconButton(
            onPressed: onNext,
            icon: Icon(Icons.arrow_forward_ios),
            color: ColorsManager.blue,
          ),
        ],
      ),
    );
  }
}
