import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper{
  var table='note';
  var columnid='note_id';
  var columntitle='note_title';
  var columndescription='note_description';
  var columnusername="note_username";



  Future<Database> opendb()async{
    var directory= await getApplicationDocumentsDirectory();
    await directory.create(recursive: true);
    var path =directory.path+"notesdb.db";
    return await openDatabase(path,version: 1,
      onCreate: (db, version) {
        db.execute("create table $table($columnid integer primary key autoincrement,"
            " $columntitle text,"
            " $columndescription text,$columnusername text)");

      },
    );


  }
  addData(String email, String password,String username)async{
    var db= await opendb();
    db.insert(table,
        {
          columntitle:email,
          columndescription:password,
          columnusername:username,

        }
    );

  }
  Future<List<Map<String,dynamic>>>fetchData()async{
    var db=await opendb();
    return db.query(table);
  }
  Future<int>update(change,id)async{
    final db=await opendb();
    return db.update(table,{
      columntitle:change
    },where: "$columnid=?",whereArgs: ["$id=?"]);
  }


}