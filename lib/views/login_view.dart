import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text("data",style: TextStyle(color: Colors.white),)
              // ElevatedButton(onPressed: (){}, child: Icon())
            ],
          )
          // Image.asset("images/wakeup.png")
        ],
      ),
    );
  }
}
