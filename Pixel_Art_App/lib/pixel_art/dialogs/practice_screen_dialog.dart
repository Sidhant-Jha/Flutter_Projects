import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class PracticeScreenDialog extends StatefulWidget {
  const PracticeScreenDialog({super.key, required this.currentColor});

  final Color currentColor;

  @override
  State<PracticeScreenDialog> createState() => _PracticeScreenDialogState();
}

class _PracticeScreenDialogState extends State<PracticeScreenDialog> {

  late Color selectColor;

  @override
  void initState() {
    super.initState();
    selectColor = widget.currentColor;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Pick a Color"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            MaterialColorPicker(
              selectedColor: widget.currentColor,
              onColorChange: (Color value)
              {
                selectColor = value;
              },
            ),
            SizedBox(height: 20,),
            FilledButton(
              onPressed: ()=> Navigator.of(context).pop(selectColor),
              child: Text("Select")
            )
          ],
        ),
      ),
    );
  }
}