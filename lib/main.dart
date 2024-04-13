import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:git_hub_users/app/app.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
 Future.delayed(const Duration(seconds: 5));
  FlutterNativeSplash.remove();
 
  runApp(const MyApp());
}



