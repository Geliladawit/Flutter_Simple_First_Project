import 'package:flutter/material.dart';
import 'package:noteapp/student.dart';

void main() {
  runApp(const MyNoteApp());
}

class MyNoteApp extends StatefulWidget {
  const MyNoteApp({super.key});

  @override
  State<MyNoteApp> createState() => _MyNoteAppState();
}

class _MyNoteAppState extends State<MyNoteApp> {

  var listofstudents = [
    Student("Saron","Get married.",  "pic1.jpg"),
    Student("Samuel","Own a car.", "pic2.jpg"),
    Student("Caleb", "Move to London.","pic2.jpg"),
    Student("Rodas", "Own a house.", "pic1.jpg"),
    Student("Rediet", "Own a business.", "pic1.jpg",),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: const Text("Student List",style: TextStyle(color: Colors.black),
           ),
        ),
        drawer: Container(
           width: 300,
           color: const Color.fromARGB(255, 0, 0, 0),
           child: ListView(
             children: [
               DrawerHeader(
                   child: Column(
                     children: [
                       ClipOval(
                         child: Image.asset("assets/bdu.jpg",
                           width: 50,
                           height: 50,
                           fit: BoxFit.fill,
                         ),
                       ),
                       const Text("bdu@edu.et",
                       style: TextStyle(color: Colors.white),)
                     ],
                   ),
               ),
               ListTile(
                 leading: const Icon(Icons.account_circle_rounded),
                 title: const Text("Home",
                 style: TextStyle(color: Colors.white),),

                 trailing: const Icon(Icons.mobile_friendly),
                 onTap: () {
                   print('Home clicked');
                },
               ),
               const ListTile(
                 title: Text("About",
                 style: TextStyle(color: Colors.white),),
               ),
               const ListTile(
                 title: Text("Settings",
                 style: TextStyle(color: Colors.white),),
               ),
             ],
           ),
        ),
        body: ListView.builder(
          itemCount: listofstudents.length,
          itemBuilder: (context, index) {
              return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 4.0,
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "assets/${listofstudents[index].pic}",
                    width: 50,
                    height: 200, 
                    fit: BoxFit.cover, 
                  ),
              ),
              title: Text(
                listofstudents[index].studentname,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(listofstudents[index].plan),
              ),
              );
          },
        ),
      ),
    );
  }
}
