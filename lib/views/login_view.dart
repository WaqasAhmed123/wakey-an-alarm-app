import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(
            "Add_Screen.jpg",
            fit: BoxFit.fill,
            // )
          )
        ],
      ),
    );
  }
}
