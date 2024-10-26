import 'package:flutter/material.dart';
import 'package:healify/domain_layer/routes/routename.dart';
import 'package:healify/presentation/pages/homepage.dart';
import 'package:healify/presentation/pages/loginPage.dart';
import 'package:healify/presentation/pages/profilepage.dart';
import 'package:healify/presentation/pages/searchScreen.dart';
import 'package:healify/presentation/pages/settingspage.dart';
import 'package:healify/presentation/pages/signUpScreen.dart';

class Routes{
  
  static Route<dynamic> generateRoute(RouteSettings settings){
     switch(settings.name){
       case Routename.home:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );

        case Routename.login:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );

        case Routename.profile:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Profilepage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
        case Routename.settings:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SettingsPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
        case Routename.search:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SearchScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
        case Routename.signup:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SignUpScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );


        default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
     }
   
    
  }
}