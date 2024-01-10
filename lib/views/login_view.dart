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
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.5,
            width:  MediaQuery.sizeOf(context).width*1,
            child: Image.asset("assets/images/wakeup.png",fit: BoxFit.fitWidth,))
            ],
          )
        ],
      ),
    );
  }
}
