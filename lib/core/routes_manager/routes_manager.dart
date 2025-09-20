import 'package:evently_app/features/auth/login/login.dart';
import 'package:evently_app/features/auth/register/register.dart';
import 'package:flutter/cupertino.dart';

abstract class RoutesManager {
  static const String register = '/register';
  static const String login = '/login';

  static Route? router (RouteSettings settings){
    switch (settings.name){
      case register : {
        return CupertinoPageRoute(builder: (context)=> Register());
      }
      case login : {
        return CupertinoPageRoute(builder: (context)=> Login());
      }
    }
  }
}