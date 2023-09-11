import 'package:flutter/material.dart';

class Uihelperdatabase{
  static CustomTextfield(TextEditingController controller,
      String text,
      IconData iconData){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24)
            )
        ),
      ),
    );

  }
  static CustomDialogue(BuildContext context,String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);},
              child: Text('Ok')
          )
        ],
      );
    });

  }
}