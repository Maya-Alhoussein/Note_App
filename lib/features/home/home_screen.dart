import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/features/home/home_view_model.dart';
import 'package:note_app_final/features/home/widgets/add_note_icon.dart';
import 'package:note_app_final/features/home/widgets/notes_list.dart';
import 'package:note_app_final/features/home/widgets/home_drawer.dart';
import 'package:note_app_final/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = Provider.of<HomeViewModel>(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: l10n.appTitle),
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
            icon: Icon(Icons.search, color: Colors.black38, size: 25.sp),
            onPressed: () {},
          ),
        ],
      ),

      drawer: HomeDrawer(viewModel: viewModel),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ValueListenableBuilder(
          valueListenable: viewModel.notesNotifier,
          builder: (context, notes, _) {
            return SingleChildScrollView(child: NotesList(notes: notes));
          },
        ),
      ),
      floatingActionButton: AddNoteIcon(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
