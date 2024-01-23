import 'package:cats_task/data/source/local/database/cats_datbase.dart';
import 'package:cats_task/presentation/screens/facts_screen/facts_screen.dart';
import 'package:flutter/material.dart';

import 'di/app_di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CatsDatabase.init();
  setup();
  runApp(const MyApp());
}

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
      home: const FactScreen(),
    );
  }
}
