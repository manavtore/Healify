import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healtify/screens/loginscreen.dart';
import 'package:healtify/utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        
        home: MaterialApp(
          initialRoute: '/login',
          routes: {
            '/': (context) => loginpage(), // If you want a default route
          StatRoutes.loginRoute: (context) => loginpage(), 
          },
        ),
      ),
    );
  }
}

