import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final CollectionReference _users=FirebaseFirestore.instance.collection('users');

  Stream<List<UserModel>> streamUsers()=>_users.orderBy('name').snapshots().map(
    (snap)=>snap.docs.map((d)=>UserModel.fromMap(d.id,d.data() as Map<String,dynamic>)).toList());

  Future<void> addUser(UserModel user)=>_users.add(user.toMap());

  Future<void> updateUser(String id,Map<String,dynamic> data)=>_users.doc(id).update(data);

  Future<void> deleteUser(String id)=>_users.doc(id).delete();
}
