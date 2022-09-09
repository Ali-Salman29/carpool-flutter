import 'package:carpool/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash_screen";

  void showErrorDialog(context, String message, [String upperMessage = "An error Message"]) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(upperMessage, style: const TextStyle(color: kTextColor),),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            child: Text("okay"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
