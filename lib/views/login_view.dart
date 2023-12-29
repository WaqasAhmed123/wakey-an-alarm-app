import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("images/wakeup.png",height: MediaQuery.sizeOf(context).height*0.5,)
        ],
      ),
    );
  }
}
