import 'package:lottie/lottie.dart';
import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/features/home/home_view_model.dart';
import 'package:note_app_final/features/home/widgets/add_note_icon.dart';
import 'package:note_app_final/features/home/widgets/notes_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Add your Notes'),
        centerTitle: true,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black38, size: 25.w),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon:  Icon(Icons.search, color: Colors.black38, size: 25.sp),
            onPressed: () {},
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.yellow.shade200,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/lottie/sticky_note.json',
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.contain,
                    repeat: true,
                    reverse: false,
                    animate: true,
                  ),
                  CustomText(
                    alignment: TextAlign.center,
                    text: 'Hello 👋',
                    color: Colors.black,
                    fontSize: 20.sp,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home,color: Colors.black12),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language,color: Colors.black12,),
              title: const Text('Change Language'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.restore_from_trash_rounded,color: Colors.black12,),
              title: const Text('Delete All Notes'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child:  ValueListenableBuilder(
          valueListenable: viewModel.notesNotifier,
          builder: (context,notes,_) {
            return SingleChildScrollView(child: NotesList(notes: notes));
          }
        )),
      floatingActionButton: AddNoteIcon(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


