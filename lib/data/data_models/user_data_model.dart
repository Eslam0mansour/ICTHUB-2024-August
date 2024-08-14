class UserDataModel {
  final String name;
  final String phoneNumber;
  final String id;
  final Function() onTab;

  UserDataModel({
    required this.name,
    required this.phoneNumber,
    required this.id,
    required this.onTab,
  });
}
