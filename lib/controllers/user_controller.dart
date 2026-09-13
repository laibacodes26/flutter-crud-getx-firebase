import 'dart:async';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class UserController extends GetxController {
  final UserService _service=UserService();
  final users=<UserModel>[].obs;
  final searchQuery=''.obs;
  final isSaving=false.obs;
  StreamSubscription<List<UserModel>>? _sub;

  @override
  void onInit(){
    super.onInit();
    _sub=_service.streamUsers().listen((data)=>users.value=data);
  }

  List<UserModel> get filteredUsers{
    if(searchQuery.value.isEmpty) return users;
    final q=searchQuery.value.toLowerCase();
    return users.where((u)=>u.name.toLowerCase().contains(q)||u.email.toLowerCase().contains(q)).toList();
  }

  Future<void> addUser(String name,String email,int age) async {
    isSaving.value=true;
    try{
      await _service.addUser(UserModel(id:'',name:name,email:email,age:age));
      Get.back();
      Get.snackbar('Success','User added successfully',snackPosition:SnackPosition.BOTTOM);
    }catch(e){
      Get.snackbar('Error','Failed to add user: $e',snackPosition:SnackPosition.BOTTOM);
    }finally{
      isSaving.value=false;
    }
  }

  Future<void> updateUser(String id,String name,String email,int age) async {
    isSaving.value=true;
    try{
      await _service.updateUser(id,{'name':name,'email':email,'age':age});
      Get.back();
      Get.snackbar('Success','User updated successfully',snackPosition:SnackPosition.BOTTOM);
    }catch(e){
      Get.snackbar('Error','Failed to update user: $e',snackPosition:SnackPosition.BOTTOM);
    }finally{
      isSaving.value=false;
    }
  }

  Future<void> deleteUser(String id) async {
    try{
      await _service.deleteUser(id);
      Get.back();
      Get.snackbar('Deleted','User deleted successfully',snackPosition:SnackPosition.BOTTOM);
    }catch(e){
      Get.snackbar('Error','Failed to delete user: $e',snackPosition:SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose(){
    _sub?.cancel();
    super.onClose();
  }
}
