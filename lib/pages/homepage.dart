import 'package:crud/services/firestore.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});
 

   

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  final FireStore fireStoreService= FireStore();


  final controller = TextEditingController();
  @override
   void onPress(){
    showDialog(context: context, builder:(context)=>AlertDialog(
     content: TextField(
      controller: controller,
     ),
     actions: [
      ElevatedButton(onPressed: (){
        fireStoreService.addNote(controller.text);

        controller.clear();

        Navigator.pop(context);
      },
       child: Text('Save')),
       Icon(Icons.favorite,color:Colors.pinkAccent,)
     ],
    ));
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TO-DO APP',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700
        ),
        
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      floatingActionButton: FloatingActionButton(onPressed:onPress,
      child: Icon(Icons.add),),
    );
  }
}