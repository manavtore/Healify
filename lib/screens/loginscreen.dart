import 'package:flutter/material.dart';
import 'package:healtify/utils/assets/constants.dart';


class loginpage extends StatelessWidget {
  const loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage(Constant().metamask)),
            ElevatedButton(
              onPressed: () {
                // Navigator.pushNamed(context, '/home');
              },
              child: const Text(
                'Login with MetaMask'

                ),
            ),
          ],
      ),
    )
    );
  }
}