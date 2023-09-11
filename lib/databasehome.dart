

import 'dart:developer';

import 'package:first/databaseuihelper.dart';
import 'package:first/fetchdata.dart';
import 'package:flutter/material.dart';

import 'dbhelper.dart';

void main(){
  runApp(DemodatabaseApp());
}
class DemodatabaseApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Database App',
      home: DatabaseApp(),
    );
  }

}
class DatabaseApp extends StatefulWidget {
  const DatabaseApp({super.key});

  @override
  State<DatabaseApp> createState() => _DatabaseAppState();
}

class _DatabaseAppState extends State<DatabaseApp> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController usenamecontroller=TextEditingController();
  void addData(String email,String password,String username)async{


    if(email==""&& password==""&& username=="" ){
      Uihelperdatabase.CustomDialogue(context,'Enter required fields');
    }
    else{
      Dbhelper().addData(email, password,username);
      log('Data inserted');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Fetchdata()));

    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Uihelperdatabase.CustomTextfield(emailcontroller, 'Email', Icons.email),
          Uihelperdatabase.CustomTextfield(passwordcontroller, 'password', Icons.password),
          Uihelperdatabase.CustomTextfield(usenamecontroller, 'username', Icons.person),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            addData(
                emailcontroller.text.toString(),
                passwordcontroller.text.toString(),
              usenamecontroller.text.toString(),

            );


          },
              child: Text('Save'))
        ],
      ) ,
    );
  }
}
