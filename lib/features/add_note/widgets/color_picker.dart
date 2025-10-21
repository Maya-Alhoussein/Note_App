import 'package:note_app_final/common_imports.dart';

class ColorPickerWidget extends StatelessWidget {
  final Color selectedColor;
  final List<Color> availableColors;
  final ValueChanged<Color> onColorSelected;

  const ColorPickerWidget({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
    required this.availableColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Color:',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),

          ...availableColors.map((color) {
            return GestureDetector(
              onTap: () => onColorSelected(color),
              child: CircleAvatar(
                radius: 18.w,
                backgroundColor: color,
                child: selectedColor == color
                    ? Icon(Icons.check, color: Colors.black, size: 18.w)
                    : null,
              ),
            );
          }),
        ],
      ),
    );
  }
}
