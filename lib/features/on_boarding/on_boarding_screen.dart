import 'package:flutter/material.dart';
import 'package:note_app_final/features/home/home_screen.dart';
import 'package:note_app_final/features/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:note_app_final/widgets/custom_text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => HomeViewModel(),
              child: const HomeScreen(),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CustomText(text: 'Notes app')),
    );
  }
}
