import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget
{
  const FloatingButton({super.key, required this.onTap, required this.icon});

  final void Function() onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    //GestureDetector can have onTap, onPress etc but does not have any effects part (feedback)
      // if we want feedback also with functionality we use InkWell it also works if child in Ink
      // Ink is like Container only just when using InkWell we use Ink Widget as child
    return  InkWell(
      // https://chatgpt.com/share/67205ccb-7fb0-8002-b041-474c79f99623  -> how onTap: works
        onTap: onTap,
        splashColor: const Color.fromARGB(255, 120, 88, 151),
        // splashFactory: InkRipple.splashFactory, // for ripple effect on part where clicked 
        borderRadius: BorderRadius.circular(15), // this radius is of ripple which is coming on button when pressed 
        child: Ink(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 106, 67, 145),
            borderRadius: BorderRadius.circular(15)
          ),
          child: icon,
        ),
      );
  }
  
}