import 'package:first/databaseuihelper.dart';
import 'package:first/dbhelper.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key});


  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  TextEditingController idcontroller=TextEditingController();
  TextEditingController titlecontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
Uihelperdatabase.CustomTextfield(idcontroller, 'id', Icons.insert_drive_file),
          Uihelperdatabase.CustomTextfield(titlecontroller, 'Title', Icons.title),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            Dbhelper().update(titlecontroller, idcontroller);

          }, child: Text('Update'))
        ],
      ),
    );
  }
}
