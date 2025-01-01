import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PixelArtDialog extends StatefulWidget {
  const PixelArtDialog({super.key, required this.currentColor});

  final Color currentColor;

  @override
  State<PixelArtDialog> createState() => _PixelArtDialogState();
}

class _PixelArtDialogState extends State<PixelArtDialog> {

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
            ColorPicker(
              pickerColor: widget.currentColor,
              onColorChanged: (Color value)
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