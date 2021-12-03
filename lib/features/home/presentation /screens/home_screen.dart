import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/navigator/navigator.dart';
import 'package:hospital_doctor/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hospital_doctor/injection_container.dart';

class HomeScreen extends StatefulWidget with NavigatedScreen {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

  @override
  String get routeName => 'home_screen';
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('home'),
            TextButton(
              child: const Text('Sign out'),
              onPressed: () => sl<AuthBloc>().add(AuthEvent.signOut()),
            ),
          ],
        ),
      ),
    );
  }
}
