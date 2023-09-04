import 'package:flutter/material.dart';
import 'package:twitch_best_practices/isar_db/features/user_model.dart';
import 'package:twitch_best_practices/isar_db/features/user_view_model.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> with UserViewModel {
  final model = User(name: 'mysCod3r', team: 'HWA');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isar DB Management'),
      ),
      body: ValueListenableBuilder(
        valueListenable: item,
        builder: (_, user, __) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _LoggedInUser(item: user),
                _Button(
                  onPressed: () => user == null ? login(model) : logout(),
                  title: user == null ? 'Login' : 'Logout',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({required this.onPressed, required this.title});
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

class _LoggedInUser extends StatelessWidget {
  const _LoggedInUser({required this.item});
  final User? item;

  @override
  Widget build(BuildContext context) {
    return item == null
        ? const SizedBox.shrink()
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item!.name),
                Text(item!.team),
              ],
            ),
          );
  }
}
