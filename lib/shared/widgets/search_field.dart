import 'package:note_app_final/common_imports.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final VoidCallback? onClear;

  const SearchField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black54),
        suffixIcon: onClear != null
            ? IconButton(
                icon: Icon(Icons.clear, color: Colors.black54),
                onPressed: onClear,
              )
            : null,
      ),
      style: TextStyle(color: Colors.black),
      onChanged: onChanged,
    );
  }
}
