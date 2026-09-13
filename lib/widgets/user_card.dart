import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../routes/app_routes.dart';
import '../theme/neon_theme.dart';
import 'delete_confirm_dialog.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  const UserCard({super.key,required this.user});

  String get initials{
    final parts=user.name.trim().split(RegExp(r'\s+'));
    if(parts.isEmpty||parts.first.isEmpty) return '?';
    return parts.length>1?'${parts.first[0]}${parts.last[0]}'.toUpperCase():parts.first[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context)=>Container(
    margin:const EdgeInsets.only(bottom:12),
    padding:const EdgeInsets.all(14),
    decoration:BoxDecoration(color:AppColors.cardFill,borderRadius:BorderRadius.circular(18),
      border:Border.all(color:AppColors.purple.withValues(alpha:0.35))),
    child:Row(children:[
      AvatarCircle(initials:initials,size:48),
      const SizedBox(width:14),
      Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        Text(user.name,style:const TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold)),
        const SizedBox(height:2),
        Text(user.email,style:const TextStyle(color:AppColors.subtitle,fontSize:13)),
        const SizedBox(height:4),
        Row(children:[
          const Icon(Icons.person_outline,size:14,color:AppColors.hint),
          const SizedBox(width:4),
          Text('Age: ${user.age}',style:const TextStyle(color:AppColors.hint,fontSize:12)),
        ]),
      ])),
      Column(mainAxisSize:MainAxisSize.min,children:[
        IconButton(onPressed:()=>Get.toNamed(AppRoutes.editUser,arguments:user),
          icon:const Icon(Icons.edit_outlined,color:AppColors.purple,size:20)),
        IconButton(onPressed:()=>Get.dialog(DeleteConfirmDialog(user:user)),
          icon:const Icon(Icons.delete_outline,color:AppColors.pink,size:20)),
      ]),
    ]));
}
