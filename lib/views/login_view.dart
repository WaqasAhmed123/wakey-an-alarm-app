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
            Image.asset(
              "images/wakeup_pic.png",
              height: MediaQuery.sizeOf(context).height * 0.4,
              fit: BoxFit.fill,
              // )
            ),
            const Text("data")
          ],
        ),
      ),
    );
  }
}
