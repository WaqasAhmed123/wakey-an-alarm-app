import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Image(image: AssetImage("wakeup.png"))
            Image.asset(
              // "images/wakeup.png",
              // "assets/wakeup_pic.png",
              "images/wakeup_pic.png",
              // "Add_Screen.jpg",
              fit: BoxFit.fill,
              // )
            )
          ],
        ),
      ),
    );
  }
}
