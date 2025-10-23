import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/features/home/home_view_model.dart';
import 'package:note_app_final/features/home/widgets/add_note_icon.dart';
import 'package:note_app_final/features/home/widgets/notes_list.dart';
import 'package:note_app_final/features/home/widgets/home_drawer.dart';
import 'package:note_app_final/widgets/search_field.dart';
import 'package:note_app_final/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = Provider.of<HomeViewModel>(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: viewModel.isSearching 
          ? SearchField(
              hintText: l10n.searchHint,
              onChanged: viewModel.updateSearchQuery,
              onClear: viewModel.stopSearch,
            )
          : CustomText(text: l10n.appTitle),
        centerTitle: true,
        elevation: 0,
        leading: viewModel.isSearching 
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black38, size: 25.w),
              onPressed: viewModel.stopSearch,
            )
          : Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu, color: Colors.black38, size: 25.w),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
        actions: [
          if (!viewModel.isSearching)
            IconButton(
              icon: Icon(Icons.search, color: Colors.black38, size: 25.sp),
              onPressed: viewModel.startSearch,
            ),
        ],
      ),

      drawer: HomeDrawer(viewModel: viewModel),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Consumer<HomeViewModel>(
          builder: (context, viewModel, _) {
            final notes = viewModel.isSearching ? viewModel.filteredNotes : viewModel.notes;
            if (viewModel.isSearching && notes.isEmpty && viewModel.searchQuery.isNotEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 64.w,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      l10n.noSearchResults,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
            return SingleChildScrollView(child: NotesList(notes: notes));
          },
        ),
      ),
      floatingActionButton: AddNoteIcon(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
