import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
 

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
   void onPress(){
    showDialog(context: context, builder:(context)=>AlertDialog(
     content: TextField(),
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