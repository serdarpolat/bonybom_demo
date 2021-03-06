import 'package:bonybom_app/pages/auth/auth.dart';
import 'package:bonybom_app/pages/auth/login.dart';
import 'package:bonybom_app/pages/auth/opening.dart';
import 'package:bonybom_app/source/providers.dart';
import 'package:bonybom_app/source/response_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthPage()),
      ChangeNotifierProvider(create: (_) => CategoryNotifier()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),
      home: Auth(),
    );
  }
}
