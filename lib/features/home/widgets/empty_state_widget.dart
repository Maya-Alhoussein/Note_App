import 'package:lottie/lottie.dart';
import 'package:note_app_final/common_imports.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/Empty_State.json',
            width: 200.w,
            height: 200.h,
            fit: BoxFit.contain,
            repeat: true,
            reverse: false,
            animate: true,
          ),
          Text(
            'No notes yet. Tap the "+" to add your first note!',
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
