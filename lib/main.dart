import 'package:flutter/material.dart';
import "src/app.dart";
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptiosn.currentPlatform,
  );
  runApp(const MyApp());
}


