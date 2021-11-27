import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/navigator/navigator.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_login.dart';
import 'package:hospital_doctor/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hospital_doctor/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:hospital_doctor/injection_container.dart';

class SignInScreen extends StatefulWidget with NavigatedScreen {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();

  @override
  String get routeName => 'sign_in_screen';
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('sign in screen'),
          const SizedBox(height: 16.0),
          TextButton(
            child: const Text('Sign in'),
            onPressed: () => sl<AuthBloc>().add(AuthEvent.signIn(UserLogin.empty())),
          ),
          const SizedBox(height: 16.0),
          TextButton(
            child: const Text('Sign up'),
            onPressed: () => const SignUpScreen().setAsBaseScreen(),
          ),
        ],
      ),
    );
  }
}
