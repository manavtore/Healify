import 'package:flutter/material.dart';
import 'package:healtify/screens/auth/metamask/loginscreen.dart';
import 'package:healtify/utils/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        
        home: MaterialApp(
          initialRoute: '/login',
          routes: {
            '/': (context) => const Loginpage(), 
          StatRoutes.loginRoute: (context) => const Loginpage(), 

          },
        ),
      );
  }
}

