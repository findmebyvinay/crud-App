import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore{
//create note
final CollectionReference notes = FirebaseFirestore.instance.collection('notes');
//read note

Future<void>addNote(String note){
return notes.add({
  'note':note,
  'timestamp':Timestamp.now()
}
);
}
//save note

//delete note


}