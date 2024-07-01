import 'package:flutter/material.dart';
import 'package:healtify/auth/metamask/loginotifier.dart';
import 'package:healtify/screens/homescreen.dart';
import 'package:provider/provider.dart';

class EditProfileDetails extends StatefulWidget {
  const EditProfileDetails({super.key});

  @override
  State<EditProfileDetails> createState() => _EditProfileDetailsState();
}

class _EditProfileDetailsState extends State<EditProfileDetails> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  var loginNotifier = Notifier();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:  (context) => loginNotifier,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Healtify'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
               ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homescreen()),
                  );
                },
                child: const Text('Go to Home Screen'),
              ),
              ]
              
            ),
          ),
        )
      ),
    );
  }
}