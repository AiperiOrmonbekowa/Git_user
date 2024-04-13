
import 'package:flutter/material.dart';
import 'package:git_hub_users/pages/user_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
 localizationsDelegates: const[
 DefaultMaterialLocalizations.delegate,
 DefaultWidgetsLocalizations.delegate
  ],
  supportedLocales:const [
    Locale('ar'), // Arabic
    Locale('en'), // English
    Locale('es'), // Spanish
  ],
      home: const UserList(),
    );
  }
}

