import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WarningHelper {
  showBar({required String msg, Color? color, required BuildContext context}) {
    final myBar = SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
      backgroundColor: color ?? Colors.red,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(myBar);
  }

  showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      },
    );
  }

  static void flushBarErrorMessage(
    BuildContext context,
    String message,
  ) async {
    await Flushbar(
      message: message,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.all(10),
      icon: const Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      forwardAnimationCurve: Curves.ease,
      shouldIconPulse: false,
    ).show(context);
  }

 
}
