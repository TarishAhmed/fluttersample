import 'package:common/dimens/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/viewmodels/auth_view_model.dart';
import 'package:sample_app/widgets/in_progress_message.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onLogin;

  const LoginScreen({Key? key, required this.onLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: authViewModel.logingIn
            ? InProgressMessage(progressName: "Login", screenName: "LoginScreen")
            : ElevatedButton(
                onPressed: () async {
                  final authViewModel = context.read<AuthViewModel>();
                  final result = await authViewModel.login();
                  if (result == true) {
                    onLogin();
                  } else {
                    authViewModel.logingIn = false;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.SIZE_SPACING_MEDIUM),
                  child: Text('Log in'),
                ),
              ),
      ),
    );
  }
}
