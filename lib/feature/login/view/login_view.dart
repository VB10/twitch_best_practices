import 'package:flutter/material.dart';
import 'package:twitch_best_practices/core/base/view/base_stateless.dart';
import 'package:twitch_best_practices/feature/login/loading_state.dart';
import 'package:twitch_best_practices/feature/login/project_general.dart';
import 'package:twitch_best_practices/feature/login/viewModel/login_viewmodel.dart';

extension MediaQueryExtension on BuildContext {
  Size get sizeOf => MediaQuery.sizeOf(this);
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with BaseState<LoginView, LoginViewModel>, ViewState {
  @override
  final LoginViewModel viewModel = LoginViewModel();

  @override
  void onInitialize() {}

  @override
  Widget customBuild(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: context.sizeOf.height * .2),
              Padding(
                padding: ProjectLoginPadding.high.symmetricVertical,
                child: TextField(onChanged: viewModel.changeEmail),
              ),
              Padding(
                padding: ProjectLoginPadding.high.symmetricVertical,
                child: TextField(onChanged: viewModel.changePassword),
              ),
              ElevatedButton(
                onPressed: viewModel.login,
                child: const Text(ProjectGeneral.loginTitle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
