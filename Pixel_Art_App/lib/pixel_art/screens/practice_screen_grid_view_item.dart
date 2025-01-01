import 'package:flutter/material.dart';
import 'package:pixel_art/pixel_art/model/pixel_art_model.dart';

class PracticeScreenGridViewItem extends StatelessWidget {
  const PracticeScreenGridViewItem({
    super.key,
    required this.model,
    required this.onTap,
  });

  final VoidCallback onTap;
  final PixelArtModel model;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // onPanStart:  onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: getColor(),
        ),
        // child: Center(child: Text("${index}")),
        
      ),
    );
  }

   Color? getColor() {
    if (model.color == null) {
      return model.expected?.withOpacity(0.2);
    }
    return model.color;
  }
}