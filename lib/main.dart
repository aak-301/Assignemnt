import 'package:design/router.dart';
import 'package:design/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;

  void init(BuildContext context) async {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    init(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Assignment',
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const Scaffold(
          body: Center(
            child: Onboarding(),
          ),
        ));
  }
}
