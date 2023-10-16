import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/models/tasksDm.dart';

class FirebaseFunctions {
  static CollectionReference<TasksDm> getTasksCollection() {
    return FirebaseFirestore.instance.collection("Tasks").withConverter<TasksDm>(
        fromFirestore: (snapshot, _) {
       return TasksDm.fromjson(snapshot.data()!);
        }, toFirestore: (value, _){
         return value.tojson() ;
        });
  }

  static Future<void> addtask(TasksDm tasksDm){
  var collections = getTasksCollection();
  var docs = collections.doc();
  tasksDm.id = docs.id;
  return docs.set(tasksDm);
  }

  static Stream<QuerySnapshot<TasksDm>> gettasks(DateTime date){
    return getTasksCollection().where('date', isEqualTo:DateUtils.dateOnly(date).microsecondsSinceEpoch).snapshots();
  }

  static Future<void> deleteTask(TasksDm tasksDm){
    DocumentReference docRef = getTasksCollection().doc(tasksDm.id);
    return docRef.delete();
  }

  static void updateIsdone(TasksDm tasksDm , bool isDone){
    getTasksCollection().doc(tasksDm.id).update({'isDone': isDone });
  }

  static Future<void> updateTask(TasksDm tasksDm)
  {
    return getTasksCollection().doc(tasksDm.id).update({
      'title' : tasksDm.title,
      'description' : tasksDm.description,
      'date' : tasksDm.date
    });
  }
}