import 'package:flutter/material.dart';

class AppColors {
  static const bg=Color(0xFF07020F);
  static const cardFill=Color(0xFF120B22);
  static const purple=Color(0xFF9B5CFF);
  static const pink=Color(0xFFFF4FD8);
  static const hint=Color(0xFF7A6C99);
  static const subtitle=Color(0xFFA79BC4);
  static const accentGradient=[Color(0xFFFF4FD8),Color(0xFF8B5CF6)];
  static const buttonGradient=[Color(0xFF9B2FF7),Color(0xFF4361EE)];
  static const dangerGradient=[Color(0xFFFF4FD8),Color(0xFFC2185B)];
  static const frameGradient=[Color(0xFFFF4FD8),Color(0xFF8B5CF6),Color(0xFF4361EE)];
}

class NeonFrame extends StatelessWidget {
  final Widget child;
  const NeonFrame({super.key,required this.child});
  @override
  Widget build(BuildContext context)=>Container(
    margin:const EdgeInsets.all(10),
    decoration:BoxDecoration(
      borderRadius:BorderRadius.circular(32),
      gradient:const LinearGradient(colors:AppColors.frameGradient,begin:Alignment.topLeft,end:Alignment.bottomRight),
      boxShadow:const [BoxShadow(color:Color(0x668B5CF6),blurRadius:30,spreadRadius:2)]),
    child:Container(
      margin:const EdgeInsets.all(2),
      decoration:BoxDecoration(color:AppColors.bg,borderRadius:BorderRadius.circular(30)),
      child:child));
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const GradientText(this.text,{super.key,required this.style});
  @override
  Widget build(BuildContext context)=>ShaderMask(
    shaderCallback:(bounds)=>const LinearGradient(colors:AppColors.accentGradient).createShader(bounds),
    child:Text(text,style:style.copyWith(color:Colors.white)));
}

class AvatarCircle extends StatelessWidget {
  final String initials;
  final double size;
  final Widget? badge;
  const AvatarCircle({super.key,required this.initials,this.size=52,this.badge});
  @override
  Widget build(BuildContext context)=>SizedBox(height:size,width:size,child:Stack(clipBehavior:Clip.none,children:[
    Container(height:size,width:size,
      decoration:BoxDecoration(shape:BoxShape.circle,
        gradient:const LinearGradient(colors:AppColors.accentGradient,begin:Alignment.topLeft,end:Alignment.bottomRight),
        boxShadow:const [BoxShadow(color:Color(0x99B026FF),blurRadius:18,spreadRadius:1)]),
      child:Center(child:Text(initials,style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:size*0.32)))),
    if(badge!=null) Positioned(bottom:-2,right:-2,child:badge!),
  ]));
}

class NeonField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  const NeonField({super.key,required this.controller,required this.hint,required this.icon,this.keyboardType,this.onChanged});
  @override
  Widget build(BuildContext context)=>Container(
    decoration:BoxDecoration(color:AppColors.cardFill,borderRadius:BorderRadius.circular(26),
      border:Border.all(color:AppColors.purple.withValues(alpha:0.45),width:1.2)),
    child:TextField(controller:controller,keyboardType:keyboardType,onChanged:onChanged,
      style:const TextStyle(color:Colors.white),
      decoration:InputDecoration(hintText:hint,hintStyle:TextStyle(color:AppColors.hint),
        prefixIcon:Icon(icon,color:AppColors.purple),
        border:InputBorder.none,contentPadding:const EdgeInsets.symmetric(vertical:16))));
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool loading;
  final IconData? icon;
  final List<Color> gradient;
  const GradientButton({super.key,required this.text,required this.onPressed,this.loading=false,this.icon=Icons.check,
    this.gradient=AppColors.buttonGradient});
  @override
  Widget build(BuildContext context)=>Container(
    height:54,
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(28),
      gradient:LinearGradient(colors:gradient,begin:Alignment.centerLeft,end:Alignment.centerRight),
      boxShadow:const [BoxShadow(color:Color(0x996C2BD9),blurRadius:18,spreadRadius:1)]),
    child:Material(color:Colors.transparent,child:InkWell(borderRadius:BorderRadius.circular(28),
      onTap:onPressed,
      child:Center(child:loading?const SizedBox(height:22,width:22,child:CircularProgressIndicator(strokeWidth:2,color:Colors.white))
        :Row(mainAxisAlignment:MainAxisAlignment.center,children:[
          if(icon!=null)...[Icon(icon,color:Colors.white,size:19),const SizedBox(width:8)],
          Text(text,style:const TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.bold))])))));
}

class OutlinedGhostButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color borderColor;
  final Color textColor;
  const OutlinedGhostButton({super.key,required this.text,required this.onPressed,this.icon,
    this.borderColor=AppColors.purple,this.textColor=Colors.white});
  @override
  Widget build(BuildContext context)=>Container(
    height:50,
    decoration:BoxDecoration(borderRadius:BorderRadius.circular(26),
      border:Border.all(color:borderColor.withValues(alpha:0.6))),
    child:Material(color:Colors.transparent,child:InkWell(borderRadius:BorderRadius.circular(26),
      onTap:onPressed,
      child:Center(child:Row(mainAxisAlignment:MainAxisAlignment.center,children:[
        if(icon!=null)...[Icon(icon,color:textColor,size:18),const SizedBox(width:8)],
        Text(text,style:TextStyle(color:textColor,fontSize:15,fontWeight:FontWeight.w600))])))));
}
