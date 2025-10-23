import 'package:lottie/lottie.dart';
import 'package:note_app_final/common_imports.dart';
import 'package:note_app_final/core/language_provider.dart';
import 'package:note_app_final/features/home/home_view_model.dart';
import 'package:note_app_final/l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeDrawer({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Drawer(
      width: 330.w,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        children: [
          Column(
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
            ],
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(l10n.home),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(
              l10n.changeLanguage,
              overflow: TextOverflow.visible,
              maxLines: 1,
            ),
            trailing: Text(
              languageProvider.currentLanguageName,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              viewModel.toggleLanguage(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.restore_from_trash_rounded),
            title: Text(l10n.deleteAllNotes),
            onTap: () {
              Navigator.pop(context);
              _showDeleteAllConfirmation(context, viewModel);
            },
          ),
        ],
      ),
    );
  }

  void _showDeleteAllConfirmation(BuildContext context, HomeViewModel viewModel) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(l10n.deleteAllNotesTitle),
          content: Text(l10n.deleteAllNotesMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await viewModel.deleteAllNotesWithFeedback(context);
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text(l10n.deleteAll),
            ),
          ],
        );
      },
    );
  }
}
