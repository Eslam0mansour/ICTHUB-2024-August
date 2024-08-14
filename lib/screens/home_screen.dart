import 'package:flutter/material.dart';
import 'package:new_8/data/data_models/user_data_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<UserDataModel> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.grey[400],
                title: Text(items[index].name),
                subtitle: Text(items[index].phoneNumber),
                trailing: Text(items[index].id),
                onTap: items[index].onTab,
              ),
            );
          },
        ),
      ),
    );
  }
}
