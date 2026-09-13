import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/user_controller.dart';
import 'routes/app_routes.dart';
import 'theme/neon_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(UserController());
  runApp(const Day22App());
}

class Day22App extends StatelessWidget {
  const Day22App({super.key});
  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Day 22 - Firestore CRUD',
      initialRoute:AppRoutes.home,
      getPages:AppRoutes.pages,
      theme:ThemeData(
        brightness:Brightness.dark,
        scaffoldBackgroundColor:AppColors.bg,
        colorScheme:ColorScheme.fromSeed(seedColor:AppColors.purple,brightness:Brightness.dark),
        useMaterial3:true),
    );
  }
}
