import 'package:flutter/material.dart';
import 'package:frontend/presentation_layer/ui/pages/homepage.dart';
import 'package:frontend/presentation_layer/ui/pages/loginPage.dart';
import 'package:frontend/routes/routeName.dart';

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
              const Loginpage(),
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