import 'dart:ui';

import 'package:flutter/material.dart';

class Components {

  
  void responseSnackbar(
      {required BuildContext context,
      required String message,
      required bool isError}) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      // margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      content: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                message,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 2),
    ));
  }

}
