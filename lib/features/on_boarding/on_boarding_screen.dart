import 'package:lottie/lottie.dart';
import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/features/home/home_screen.dart';
import 'package:note_app_final/features/home/home_view_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
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
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///todo : fix the issue of the lottie animation
              Lottie.asset(
             'assets/lottie/Notes.json', 
             width: 200.w,
             height: 200.h,
             fit: BoxFit.contain,
             repeat: true, 
             reverse: false, 
             animate: true,
           ),
          CustomText(text: 'Notes app',fontSize: 50.sp,fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}
