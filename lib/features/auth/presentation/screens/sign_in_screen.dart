import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_doctor/core/helper/validators.dart';
import 'package:hospital_doctor/core/navigator/navigator.dart';
import 'package:hospital_doctor/core/presentation/buttons/filled_button.dart';
import 'package:hospital_doctor/core/presentation/widgets/textfields/basic_outlined_textfield.dart';
import 'package:hospital_doctor/core/style/paddings.dart';
import 'package:hospital_doctor/core/style/text_styles.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_login.dart';
import 'package:hospital_doctor/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hospital_doctor/features/auth/presentation/blocs/sign_in_form_bloc/sign_in_form_bloc.dart';
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
  late final TextEditingController _loginController;
  late final TextEditingController _passwordController;
  late final SignInFormBloc _signInFormBloc;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _signInFormBloc = sl();
    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _signInFormBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Paddings.horizontal24,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox(height: 16.0)),
                Text('Doctor app', style: roboto.s36.w700.blueColor),
                const SizedBox(height: 142.0),
                BasicOutlinedTextfield(
                  controller: _loginController,
                  hint: 'Login',
                  validator: LoginValidator.errorMessage,
                  onChanged: (value) => _signInFormBloc.add(SignInFormEvent.changeLogin(value)),
                ),
                const SizedBox(height: 16.0),
                BasicOutlinedTextfield(
                  controller: _passwordController,
                  hint: 'Hasło',
                  validator: PasswordValidator.errorMessage,
                  onChanged: (value) => _signInFormBloc.add(SignInFormEvent.changePassword(value)),
                ),
                const Expanded(child: SizedBox(height: 16.0)),
                BlocBuilder(
                  bloc: _signInFormBloc,
                  builder: (BuildContext context, SignInFormState state) {
                    return FilledButton(
                      text: 'Sign in',
                      enabled: state.valid,
                      onTap: () => _onSignInTap(state.user),
                    );
                  },
                ),
                const SizedBox(height: 16.0),
                FilledButton(
                  text: 'Sign up',
                  onTap: () => const SignUpScreen().setAsBaseScreen(),
                ),
                const SizedBox(height: 22.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSignInTap(UserLogin user) {
    if (_formKey.currentState?.validate() ?? false) {
      sl<AuthBloc>().add(AuthEvent.signIn(UserLogin.empty()));
    }
  }
}
