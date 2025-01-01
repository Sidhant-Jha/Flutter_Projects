import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pixel_art/global/extension/color_hex_extension.dart';
import 'package:pixel_art/pixel_art/model/pixel_art_model.dart';
import 'package:pixel_art/pixel_art/service/pixel_art_image.dart';

const drawScreenSize = 55;
const practiceScreenSize = 13;
class PixelArtViewModel extends ChangeNotifier
{
  List<PixelArtModel> list = List.generate(drawScreenSize*drawScreenSize, (index) => PixelArtModel());

  List<PixelArtModel> listSquirrel = List.generate(practiceScreenSize*practiceScreenSize, (index) => PixelArtModel(
    expected:  HexColor.fromHex(PixelArtImage.brownBird[index]),
  ));

  List<PixelArtModel> listBird = List.generate(practiceScreenSize*practiceScreenSize, (index) => PixelArtModel(
    expected: HexColor.fromHex(PixelArtImage.pinkBird[index]),
  ));

  List<PixelArtModel> listDog = List.generate(practiceScreenSize*practiceScreenSize, (index) => PixelArtModel(
    expected: HexColor.fromHex(PixelArtImage.dog[index]),
  ));


  Color selectedColor = Color.fromARGB(255, 235, 192, 255);

  Color selectedColorPractice = Colors.white;

  // Color selectedColorPractice = Colors.white;



  void changeSelected(Color? color)
  {
    if(color != null)
      selectedColor = color;

    notifyListeners();
  }


  void changeSelectedPractice(Color? color)
  {
    if(color != null)
      selectedColorPractice = color;

    notifyListeners();
  }

  void clearScreen(List<PixelArtModel> list)
  {
    for (PixelArtModel model in list)
    {
      model.color = null;
    }
    notifyListeners();
  }

  void clearPracticeScreen() {
    
  for (PixelArtModel e in listBird) {
    print("Before clear: ${e.expected}, ${e.color}");
    e.color = null;
    print("After clear: ${e.expected}, ${e.color}");
  }
  for (PixelArtModel e in listSquirrel) {
    e.color = null;
  }
  for (PixelArtModel e in listDog) {
    e.color = null;
  }
  notifyListeners();
}



  void paintPixelEventDraw(int index,  List<PixelArtModel> list)
  {
    list[index] = PixelArtModel(color: selectedColor);
    notifyListeners();
  }

 //
  void paintPixelEventPractice(int index,  List<PixelArtModel> list)
  {
    list[index] = PixelArtModel(color: selectedColorPractice);
    notifyListeners();
  }
  
}