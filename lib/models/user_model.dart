class UserModel {
  final String id;
  final String name;
  final String email;
  final int age;

  UserModel({required this.id,required this.name,required this.email,required this.age});

  Map<String,dynamic> toMap()=>{'name':name,'email':email,'age':age};

  factory UserModel.fromMap(String id,Map<String,dynamic> map)=>UserModel(
    id:id,name:map['name']??'',email:map['email']??'',age:map['age']??0);
}
