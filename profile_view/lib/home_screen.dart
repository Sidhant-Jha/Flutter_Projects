import 'package:flutter/material.dart';
import 'package:profile_view/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.read<UserProvider>();
    return Scaffold(
      appBar:  AppBar(
        title: Text('User Profile'),
      ),
      body: context.watch<UserProvider>().isLoading ? Center(child: const CircularProgressIndicator(),) :
      ListView.builder(
        itemCount: userProvider.users.length,
        itemBuilder: (context, index)
        {
          final user = userProvider.users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.picture),
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userProvider.fetchUser();
        },
        child: Icon(Icons.download),
      ),
    );
  }
}