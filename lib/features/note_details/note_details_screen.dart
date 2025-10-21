import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/data/models/note/note.dart';

class NoteDetailsScreen extends StatelessWidget {
  final Note note;
  const NoteDetailsScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: note.color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: CustomText(text : note.title,fontSize: 20.sp),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
        child: SingleChildScrollView(child: CustomText(text: note.content,alignment: TextAlign.center,fontSize: 16.sp,overflow: TextOverflow.visible,)),
      ),
    );
  }
}
