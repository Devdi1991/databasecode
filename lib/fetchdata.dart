import 'package:first/updatedata.dart';
import 'package:flutter/material.dart';
import 'package:first/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'dbhelper.dart';

class Fetchdata extends StatefulWidget {
  const Fetchdata({super.key});

  @override
  State<Fetchdata> createState() => _FetchdataState();
}

class _FetchdataState extends State<Fetchdata> {
  List<Map<String,dynamic>>arrNotes=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllData();
  }
  void getAllData()async{
    arrNotes= await Dbhelper().fetchData();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetchdata'),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return ListTile(
          leading: CircleAvatar(
            child: Text("${arrNotes[index][Dbhelper().columnid]}"),
          ),
          title: Text("${arrNotes[index][Dbhelper().columntitle]}"),
          subtitle: Text("${arrNotes[index][Dbhelper().columndescription]}"),
          trailing: SingleChildScrollView(
            child: Column(
              children: [
              Text("${arrNotes[index][Dbhelper().columnusername]}"
                ,style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 1,),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateData()));
              }, icon: Icon(Icons.edit)),
            ],),
          )
        );

      },itemCount: arrNotes.length,
      ),
    );
  }
}