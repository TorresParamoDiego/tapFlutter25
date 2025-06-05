class UserModel {
  int? idUser;
  String? userName;
  String? passName;

  UserModel({
   this.idUser,
   this.userName,
   this.passName, 
  });

  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(
      idUser: map['idUser'],
      userName: map['userName'],
      passName: map['passName']
    );
  }
}