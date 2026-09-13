import 'package:get/get.dart';
import '../views/home_view.dart';
import '../views/add_user_view.dart';
import '../views/edit_user_view.dart';

class AppRoutes {
  static const home='/home';
  static const addUser='/add-user';
  static const editUser='/edit-user';

  static final pages=[
    GetPage(name:home,page:()=>const HomeView()),
    GetPage(name:addUser,page:()=>AddUserView()),
    GetPage(name:editUser,page:()=>EditUserView()),
  ];
}
