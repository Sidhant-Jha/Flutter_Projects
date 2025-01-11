import 'package:flutter/material.dart';
import 'package:profile_view/view/detail_screen.dart';
import 'package:profile_view/view_model/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.read<UserProvider>();
    return Scaffold(
      appBar:  AppBar(
        title: Text('Books'),
        actions: [
          PopupMenuButton(
            position: PopupMenuPosition.under,
            itemBuilder: (context) => [PopupMenuItem(
              onTap: () 
              {
                context.read<UserProvider>().sortListOfUser();
              },
              child: Text('Sort by Size')
            ),
            PopupMenuItem(
              onTap: () 
              {
                context.read<UserProvider>().fetchUser();
              },
              child: Text('Remove Sort')
            )
            ]
          ),
        ],
      ),
      body: context.watch<UserProvider>().isLoading ? const Center(child: CircularProgressIndicator(),) :
      ListView.builder(
        itemCount: userProvider.users.length,
        itemBuilder: (context, index)
        {
          final user = userProvider.users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.picture),
            ),
            title: Text(user.title),
            subtitle: Text(user.subtitle),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChangeNotifierProvider.value(
                value: context.read<UserProvider>(),
                child: DetailScreen(user: user))));
            },
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