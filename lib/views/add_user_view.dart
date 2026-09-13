import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../theme/neon_theme.dart';

class AddUserView extends StatelessWidget {
  AddUserView({super.key});
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final ageController=TextEditingController();
  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    final controller=Get.find<UserController>();
    return Scaffold(
      backgroundColor:AppColors.bg,
      body:SafeArea(child:NeonFrame(child:SingleChildScrollView(
        padding:const EdgeInsets.all(24),
        child:Form(key:formKey,child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
          Row(children:[
            IconButton(padding:EdgeInsets.zero,constraints:const BoxConstraints(),
              onPressed:()=>Get.back(),icon:const Icon(Icons.arrow_back,color:Colors.white)),
            const SizedBox(width:8),
            const Text('Add User',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.bold)),
          ]),
          const SizedBox(height:30),
          Center(child:AvatarCircle(initials:'+',size:80)),
          const SizedBox(height:30),
          const Text('Name',style:TextStyle(color:Colors.white,fontWeight:FontWeight.w600)),
          const SizedBox(height:8),
          TextFormField(controller:nameController,style:const TextStyle(color:Colors.white),
            validator:(v)=>(v==null||v.trim().isEmpty)?'Enter a name':null,
            decoration:InputDecoration(hintText:'Full name',hintStyle:const TextStyle(color:AppColors.hint),
              prefixIcon:const Icon(Icons.person_outline,color:AppColors.purple),filled:true,fillColor:AppColors.cardFill,
              border:OutlineInputBorder(borderRadius:BorderRadius.circular(26),borderSide:BorderSide.none))),
          const SizedBox(height:20),
          const Text('Email',style:TextStyle(color:Colors.white,fontWeight:FontWeight.w600)),
          const SizedBox(height:8),
          TextFormField(controller:emailController,keyboardType:TextInputType.emailAddress,style:const TextStyle(color:Colors.white),
            validator:(v)=>(v==null||!v.contains('@'))?'Enter a valid email':null,
            decoration:InputDecoration(hintText:'Email address',hintStyle:const TextStyle(color:AppColors.hint),
              prefixIcon:const Icon(Icons.email_outlined,color:AppColors.purple),filled:true,fillColor:AppColors.cardFill,
              border:OutlineInputBorder(borderRadius:BorderRadius.circular(26),borderSide:BorderSide.none))),
          const SizedBox(height:20),
          const Text('Age',style:TextStyle(color:Colors.white,fontWeight:FontWeight.w600)),
          const SizedBox(height:8),
          TextFormField(controller:ageController,keyboardType:TextInputType.number,style:const TextStyle(color:Colors.white),
            validator:(v)=>(v==null||int.tryParse(v)==null)?'Enter a valid age':null,
            decoration:InputDecoration(hintText:'Age',hintStyle:const TextStyle(color:AppColors.hint),
              prefixIcon:const Icon(Icons.calendar_today_outlined,color:AppColors.purple),filled:true,fillColor:AppColors.cardFill,
              border:OutlineInputBorder(borderRadius:BorderRadius.circular(26),borderSide:BorderSide.none))),
          const SizedBox(height:30),
          Obx(()=>GradientButton(text:'Add User',icon:Icons.person_add_alt,loading:controller.isSaving.value,
            onPressed:controller.isSaving.value?null:(){
              if(formKey.currentState!.validate()){
                controller.addUser(nameController.text.trim(),emailController.text.trim(),int.parse(ageController.text.trim()));
              }
            })),
          const SizedBox(height:14),
          OutlinedGhostButton(text:'Cancel',icon:Icons.close,onPressed:()=>Get.back()),
        ])),
      ))),
    );
  }
}
