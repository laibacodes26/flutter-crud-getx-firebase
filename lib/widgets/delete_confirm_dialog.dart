import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../models/user_model.dart';
import '../theme/neon_theme.dart';

class DeleteConfirmDialog extends StatelessWidget {
  final UserModel user;
  const DeleteConfirmDialog({super.key,required this.user});

  @override
  Widget build(BuildContext context){
    final controller=Get.find<UserController>();
    return Dialog(backgroundColor:Colors.transparent,
      child:Container(padding:const EdgeInsets.all(24),
        decoration:BoxDecoration(color:AppColors.bg,borderRadius:BorderRadius.circular(24),
          border:Border.all(color:AppColors.pink.withValues(alpha:0.5)),
          boxShadow:const [BoxShadow(color:Color(0x66FF4FD8),blurRadius:24,spreadRadius:1)]),
        child:Column(mainAxisSize:MainAxisSize.min,children:[
          Container(height:60,width:60,
            decoration:BoxDecoration(shape:BoxShape.circle,
              gradient:const LinearGradient(colors:[AppColors.pink,AppColors.purple]),
              boxShadow:const [BoxShadow(color:Color(0x99FF4FD8),blurRadius:18,spreadRadius:1)]),
            child:const Icon(Icons.priority_high_rounded,color:Colors.white,size:30)),
          const SizedBox(height:18),
          const Text('Delete User?',style:TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.bold)),
          const SizedBox(height:10),
          Text('Are you sure you want to delete ${user.name}? This action cannot be undone.',
            textAlign:TextAlign.center,style:const TextStyle(color:AppColors.subtitle,fontSize:14)),
          const SizedBox(height:24),
          Row(children:[
            Expanded(child:OutlinedGhostButton(text:'Cancel',onPressed:()=>Get.back())),
            const SizedBox(width:12),
            Expanded(child:GradientButton(text:'Delete',icon:Icons.delete_outline,gradient:AppColors.dangerGradient,
              onPressed:()=>controller.deleteUser(user.id))),
          ]),
        ])));
  }
}
