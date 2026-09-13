import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../routes/app_routes.dart';
import '../theme/neon_theme.dart';
import '../widgets/user_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context){
    final controller=Get.find<UserController>();
    final searchController=TextEditingController();
    return Scaffold(
      backgroundColor:AppColors.bg,
      body:SafeArea(child:NeonFrame(child:Padding(
        padding:const EdgeInsets.all(20),
        child:Column(children:[
          Row(children:[
            Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
              RichText(text:TextSpan(children:[
                const TextSpan(text:'User',style:TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.bold)),
                WidgetSpan(alignment:PlaceholderAlignment.baseline,baseline:TextBaseline.alphabetic,
                  child:GradientText('s',style:const TextStyle(fontSize:28,fontWeight:FontWeight.bold))),
              ])),
              const SizedBox(height:4),
              const Text('Manage your Firestore users',style:TextStyle(color:AppColors.subtitle,fontSize:13)),
            ])),
            const AvatarCircle(initials:'U',size:44),
          ]),
          const SizedBox(height:18),
          NeonField(controller:searchController,hint:'Search users...',icon:Icons.search,
            keyboardType:TextInputType.text,onChanged:(v)=>controller.searchQuery.value=v),
          const SizedBox(height:18),
          Expanded(child:Obx((){
            controller.searchQuery.value;
            final list=controller.filteredUsers;
            if(list.isEmpty){
              return const Center(child:Text('No users yet',style:TextStyle(color:AppColors.subtitle)));
            }
            return ListView.builder(itemCount:list.length,
              itemBuilder:(_,i)=>UserCard(user:list[i]));
          })),
        ]),
      ))),
      floatingActionButton:FloatingActionButton(
        backgroundColor:AppColors.purple,
        onPressed:()=>Get.toNamed(AppRoutes.addUser),
        child:const Icon(Icons.add,color:Colors.white)),
    );
  }
}
