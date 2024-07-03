class UserModel {
  final String? displayName;
  final String? email;
  final String? profilePic;
  final String? userId;

  UserModel({
    required this.userId,
    required this.email,
    required this.displayName,
    required this.profilePic,
  });

  factory UserModel.fromJson(Map<dynamic,String> json) {
    return UserModel(
    userId: json['user_id'] ?? '',
    email: json['email'] ?? '',
    displayName: json['display_name'] ?? '',
    profilePic: json['profile_pic'] ?? ''
  );}

  Map<String,dynamic> toJson(UserModel user){
    return {
      'user_id' : user.userId,
      'email' : user.email,
      'display_name' : user.displayName,
      'profile_pic' : user.profilePic
    };
  }

}