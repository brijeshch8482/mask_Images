import 'package:flutter/material.dart';
import 'package:flutter_celebrare/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'MyTheme.dart';
import 'mainscreen_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => IdNotifier())
  ] , child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      debugShowCheckedModeBanner: false,

      initialRoute: "/",
      routes: {
        "/":(context) => HomePage()
      },


    );
  }
}


