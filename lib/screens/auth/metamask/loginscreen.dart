import 'package:flutter/material.dart';
import 'package:healtify/screens/auth/metamask/loginotifier.dart';
import 'package:healtify/screens/homescreen.dart';
import 'package:healtify/utils/assets/constants.dart';
import 'package:provider/provider.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  var loginNotifier = Notifier();

  @override
  void initState() {
    super.initState();
    loginNotifier.initializeState();
    
  }
   Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:  (context) => loginNotifier,
      child: MaterialApp(
        title: 'Flutter Demo',
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
                Image(image: AssetImage(Constant().metamask)),
               W3MConnectWalletButton(service: loginNotifier.w3mService),
               W3MNetworkSelectButton(service: loginNotifier.w3mService),
               W3MAccountButton(service: loginNotifier.w3mService),

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