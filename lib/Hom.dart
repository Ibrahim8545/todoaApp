
import 'package:flutter/material.dart';
import 'package:todo_app/componets/componets.dart';
import 'package:todo_app/modules/archivedTasks/archivedtasks.dart';
import 'package:todo_app/modules/doneTask/doneTasks.dart';
import 'package:todo_app/modules/NewTasks/newTask.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  int current1=0;
   var database;
   var ScaffoldKey=GlobalKey<ScaffoldState>();
   bool show=false;
   IconData? fabIcon=Icons.edit;
   var titleController=TextEditingController();
  // ignore: non_constant_identifier_names
  List<Widget>screens=
  [
    NewTasksScreen(),
    doneTaskScreens(),
    archivedScreen(),
  ];
    List<String>titles=
  [
    'Task',
    'DoneTasks',
    'ArchiveTasks',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createToDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          titles[current1],
        )
      ),
      body: screens[current1],
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          try{
             if(show==true)
          {
            Navigator.pop(context);
            show=false;
            setState(() {
              fabIcon= Icons.edit;
            });
          }
          else
          {
             ScaffoldKey.currentState?.showBottomSheet(
          (context) =>Container(
         width: 20.0,
         height: 25.0,
            
          ),

         );
         show=true;
         setState(() {
           fabIcon=Icons.add;
         });

          }
          }
          catch(error){
            print('error${error.toString()}');
          }
         
        },
        child: Icon(
        fabIcon,
        ),
        ),
      bottomNavigationBar:BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
        currentIndex: current1, 
         onTap: (index)
         {
          setState(() {
              current1=index;
          });
        
         },

         items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.menu),
           label: 'Tasks'
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'check',
          ),
         BottomNavigationBarItem(
            icon: Icon(
              Icons.archive_outlined,
            ),
            label: 'Acchived'
          ),
        ]
        ),
    );
    
  }
     void createToDatabase()async
     {
        database=await openDatabase
       (
         'path.dp',
      version: 1,
      onCreate: (Database  ,int version)
      {
        print('create database');
        Database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, date TEXT,time TEXT,status TEXT)').then((value) {
          print('table created');
        }).catchError((error)
        {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen:(database)
      {
        print('database oprnmed');
      }
       );
     }
     void insertToDatabase()
     {
      database.transaction((txn) async {
    try {
      int value = await txn.rawInsert(
          'insert into tasks(title,date,time,status) values ("first","17/10","17:35","ibrahim")');
      print('$value inserted successfully');
    } catch (error) {
      print('Error when inserting: ${error.toString()}');
    }
  });
      return null;
     }
  
}
Future<String>getname() async
  {
    return('ibrahim mostafa');

  }