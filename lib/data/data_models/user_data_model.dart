class UserDataModel {
  final String email;
  final String uid;
  final String name;
  final String phoneNumber;

  UserDataModel({
    required this.email,
    required this.uid,
    required this.name,
    required this.phoneNumber,
  });

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      email: map['mail'],
      uid: map['uid'],
      name: map['name'],
      phoneNumber: map['phone'],
    );
  }
}
