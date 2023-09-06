import 'package:flutter/material.dart';
import 'package:twitch_best_practices/core/base/view/i_base_view.dart';
import 'package:twitch_best_practices/speed_code/login/viewModel/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return IBaseView(
      viewModel: LoginViewModel(),
      builder: (LoginViewModel viewModel) => Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * .2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(onChanged: viewModel.changeEmail),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(onChanged: viewModel.changePassword),
                ),
                ElevatedButton(
                  onPressed: () => viewModel.login(),
                  child: const Text('Giriş'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
