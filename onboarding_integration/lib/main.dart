import 'package:flutter/material.dart';
import 'package:onboarding_integration/page/onboarding.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> initUniLinks() async {
    try {
      _sub = linkStream.listen((String? link) {
        if (link != null) {
          // Handle the deep link URL
          // Parse the link and navigate to the appropriate page
          print('Received link: $link');
          // For example, navigate based on the link
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OnboardingGenerateRTA(), // Update this based on your logic
            ),
          );
        }
      }, onError: (err) {
        // Handle errors
        print('Error receiving deep link: $err');
      });
    } on FormatException {
      // Handle invalid link
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Onboardinge Authentication'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const OnboardingGenerateRTA(), 
    );
  }
}
