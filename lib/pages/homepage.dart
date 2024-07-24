import 'package:cloud_firestore/cloud_firestore.dart';
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

   void onPress(String?docId){
    showDialog(context: context, builder:(context)=>AlertDialog(
     content: TextField(
      controller: controller,
     ),
     actions: [
      ElevatedButton(onPressed: (){
        if(docId==null){
        fireStoreService.addNote(controller.text);
        }
        else{
        fireStoreService.updateNote(docId, controller.text);
       
            }   
             controller.clear();

        Navigator.pop(context);   },
       child: Text('Save')),
       Icon(Icons.favorite,color:Colors.pinkAccent,)
     ],
    ));
  }
 
  @override
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
      floatingActionButton: FloatingActionButton(onPressed:()=> onPress,
      child: Icon(Icons.add),),
      body:StreamBuilder<QuerySnapshot>(
        stream:fireStoreService .getNotesStream(),
        builder:(context,snapshot){
          if(snapshot.hasData){

            List notesList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context,index){
                DocumentSnapshot document= notesList[index];
                String DocumentId= document.id;

                Map<String,dynamic> data = document.data() as Map<String,dynamic>;
                String noteText = data['note'];

                return ListTile(
                  title: Row(
                    children: [
                      Row(
                        children: [
                          Text(noteText),
                        ],
                      ),
                    ],
                  ),
                  trailing:Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       IconButton(onPressed: ()=>onPress(DocumentId),
                   icon: Icon(Icons.settings)),
                       IconButton(onPressed: ()=>fireStoreService.deleteNote(DocumentId),
                   icon: Icon(Icons.delete)),
                    ],
                  )
                );
                

            });
          }
          else{
            return Text('no Notes');
          }
        }
      ),
    );
  }
}