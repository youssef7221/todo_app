import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/models/tasksDm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/screens/models/usermodel.dart';
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
    return getTasksCollection().where('uid', isEqualTo:FirebaseAuth.instance.currentUser!.uid)
        .where('date', isEqualTo:DateUtils.dateOnly(date).microsecondsSinceEpoch).snapshots();
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
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance.collection("Users").withConverter<UserModel>(
        fromFirestore: (snapshot, _) {
          return UserModel.fromjson(snapshot.data()!);
        }, toFirestore: (value, _){
      return value.tojson() ;
    });
  }
  static Future<void> addUserCollection(UserModel user){
    var collections = getUsersCollection();
    var Doc = collections.doc(user.id);
   return Doc.set(user);
  }
  static Future<void> createUser(String name , int age,String email , String password,Function onSuccess , Function onError) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(name: name, email: email, age: age, id: credential.user!.uid);
      FirebaseFunctions.addUserCollection(userModel);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
      }
    } catch (e) {
      print(e);
    }
  }
  static Future<UserModel?> readUser(String id) async{
    DocumentSnapshot<UserModel> userDoc = await getUsersCollection().doc(id).get();
    return userDoc.data();
  }
static void loginUser(String email , String password ,Function onSuccess , Function onError) async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    );
    onSuccess();
  } on FirebaseAuthException catch (e) {
   if (e.code == "INVALID_LOGIN_CREDENTIALS")
     {
       onError("Invalid Email Or Password");
     }
  }


}
}