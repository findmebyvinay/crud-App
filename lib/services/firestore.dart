import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore{
//create note
final CollectionReference notes = FirebaseFirestore.instance.collection('notes');
//read note

Stream<QuerySnapshot>getNotesStream(){
  final notesStream = notes.orderBy('timestamp',descending: true).snapshots();

  return notesStream;

}

Future<void>addNote(String note){
return notes.add({
  'note':note,
  'timestamp':Timestamp.now()
}
);
}
//save note
Future<void> updateNote(String docId,String newNote){
  return notes.doc(docId).update({
    'note':newNote,
    'timestamp':Timestamp.now()
  });
}

//delete note
Future<void> deleteNote(String docId){
return notes.doc(docId).delete();
}

}