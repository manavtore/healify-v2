import 'package:flutter/material.dart';
import 'package:healify/domain_layer/routes/routename.dart';
import 'package:healify/presentation/ui/pages/homepage.dart';
import 'package:healify/presentation/ui/pages/loginPage.dart';
import 'package:healify/presentation/ui/pages/profilepage.dart';
import 'package:healify/presentation/ui/pages/searchScreen.dart';
import 'package:healify/presentation/ui/pages/settingspage.dart';

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
              const Settingspage(),
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