import 'package:flutter/material.dart';
import 'package:healtify/auth/controller/authcontroller.dart';
import 'package:provider/provider.dart';

class emailauth extends StatefulWidget {
  const emailauth({super.key});

  @override
  State<emailauth> createState() => _emailauthState();
}

class _emailauthState extends State<emailauth> {
  emailNotifier emailnotifer = emailNotifier();

  var email = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
   
    return ChangeNotifierProvider(create:  (context) => emailnotifer,
     child: Scaffold(
      body: Container(
         padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: double.infinity,
          child:SingleChildScrollView(
            child:  Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: password,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      emailnotifer.signIn(email.text, password.text);
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      emailnotifer.signUp(email.text, password.text);
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
      ),
     ), 

    );
  }
}