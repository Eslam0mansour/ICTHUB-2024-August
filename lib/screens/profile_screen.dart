import 'package:flutter/material.dart';
import 'package:new_8/data/data_source/profile_data_source.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    if (ProfileDataSource.user == null) {
      ProfileDataSource.getUserFromFireStore().then((value) {
        setState(() {});
      });
    } else {
      print('data is already loaded before');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserTile(
            text: 'Name',
            value: ProfileDataSource.user?.name,
            icon: Icons.person,
          ),
          UserTile(
            text: 'Email',
            value: ProfileDataSource.user?.email,
            icon: Icons.email,
          ),
          UserTile(
            text: 'Phone',
            value: ProfileDataSource.user?.phoneNumber,
            icon: Icons.phone,
          ),
          UserTile(
            text: 'uid',
            value: ProfileDataSource.user?.uid,
            icon: Icons.location_on,
          ),
        ],
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final String text;
  final String? value;
  final IconData icon;

  const UserTile(
      {super.key, required this.text, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(text),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle: Text(value ?? 'loading...'),
        leading: Icon(icon),
      ),
    );
  }
}
