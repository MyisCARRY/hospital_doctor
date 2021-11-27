import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/navigator/navigator.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_register.dart';
import 'package:hospital_doctor/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hospital_doctor/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:hospital_doctor/injection_container.dart';

class SignUpScreen extends StatefulWidget with NavigatedScreen {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();

  @override
  String get routeName => 'sign_up_screen';
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('sign up screen'),
          const SizedBox(height: 16.0),
          TextButton(
            child: const Text('Sign up'),
            onPressed: () => sl<AuthBloc>().add(AuthEvent.signUp(UserRegister.empty())),
          ),
          const SizedBox(height: 16.0),
          TextButton(
            child: const Text('Sign in'),
            onPressed: () => const SignInScreen().setAsBaseScreen(),
          ),
        ],
      ),
    );
  }
}
