import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              // ElevatedButton(onPressed: (){}, child: Icon())
              // FittedBox(
              // child:
              Image.asset(
                "assets/images/wakeup.png",
                fit: BoxFit.fill,
                // )
              )
            ],
          )
        ],
      ),
    );
  }
}
