import 'package:evently_app/features/auth/login/login.dart';
import 'package:evently_app/features/auth/register/register.dart';
import 'package:evently_app/features/main_layout/main_layout.dart';
import 'package:evently_app/features/onboarding_screens/intro_screen.dart';
import 'package:evently_app/features/onboarding_screens/onboarding_screens.dart';
import 'package:evently_app/features/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../features/create_event/create_event.dart';

abstract class RoutesManager {
  static const String splashScreen = '/splashScreen';
  static const String introScreen = '/introScreen';
  static const String onBoarding = '/onBoarding';
  static const String register = '/register';
  static const String login = '/login';
  static const String mainLayout = '/mainLayout';
  static const String createEvent = '/createEvent';

  static Route? router (RouteSettings settings){
    switch (settings.name){
      case splashScreen : {
        return CupertinoPageRoute(builder: (context)=> SplashScreen());
      }
      case introScreen : {
        return CupertinoPageRoute(builder: (context)=> IntroScreen());
      }
      case onBoarding : {
        return CupertinoPageRoute(builder: (context)=> OnboardingScreen());
      }
      case register : {
        return CupertinoPageRoute(builder: (context)=> Register());
      }
      case login : {
        return CupertinoPageRoute(builder: (context)=> Login());
      }
      case mainLayout : {
        return CupertinoPageRoute(builder: (context)=> MainLayout());
      }
      case createEvent : {
        return CupertinoPageRoute(builder: (context)=> CreateEvent());
      }
    }
  }
}