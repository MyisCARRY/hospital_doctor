import 'package:any_animated_button/any_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/helper/validators.dart';
import 'package:hospital_doctor/core/navigator/navigator.dart';
import 'package:hospital_doctor/core/presentation/buttons/filled_button.dart';
import 'package:hospital_doctor/core/presentation/buttons/reverted_button.dart';
import 'package:hospital_doctor/core/presentation/widgets/notifications.dart';
import 'package:hospital_doctor/core/presentation/widgets/scroll_extend_widget.dart';
import 'package:hospital_doctor/core/presentation/widgets/textfields/basic_outlined_textfield.dart';
import 'package:hospital_doctor/core/style/colors.dart';
import 'package:hospital_doctor/core/style/paddings.dart';
import 'package:hospital_doctor/core/style/text_styles.dart';
import 'package:hospital_doctor/features/auth/domain/entities/token.dart';
import 'package:hospital_doctor/features/auth/domain/entities/user_register.dart';
import 'package:hospital_doctor/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hospital_doctor/features/auth/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:hospital_doctor/features/auth/presentation/blocs/sign_up_form_bloc/sign_up_form_bloc.dart';
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
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _loginController;
  late final TextEditingController _passwordController;

  late final SignUpFormBloc _signUpFormBloc;
  late final SignUpBloc _signUpBloc;

  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();

    _signUpFormBloc = sl();
    _signUpBloc = sl();

    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _loginController.dispose();
    _passwordController.dispose();

    _signUpFormBloc.close();
    _signUpBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        AnyAnimatedButtonBlocListener<UserRegister, Token, Failure>(
          bloc: _signUpBloc,
          onErrorStart: (failure) => Notifications.error(failure: failure),
          onSuccessEnd: (data) => sl<AuthBloc>().add(AuthEvent.signIn(data)),
        ),
      ],
      child: Scaffold(
        backgroundColor: CustomColors.white,
        body: SafeArea(
          child: Padding(
            padding: Paddings.horizontal24,
            child: Form(
              key: _formKey,
              child: ScrollExtendedWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80.0),
                    Text('Doctor app', style: roboto.s36.w700.blueColor),
                    const SizedBox(height: 120.0),
                    BasicOutlinedTextfield(
                      controller: _firstNameController,
                      hint: 'Imię',
                      validator: FirstNameValidator().errorMessage,
                      onChanged: (value) => _signUpFormBloc.add(SignUpFormEvent.changeFirstName(value)),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16.0),
                    BasicOutlinedTextfield(
                      controller: _lastNameController,
                      hint: 'Nazwisko',
                      validator: LastNameValidator().errorMessage,
                      onChanged: (value) => _signUpFormBloc.add(SignUpFormEvent.changeLastName(value)),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16.0),
                    BasicOutlinedTextfield(
                      controller: _loginController,
                      hint: 'Login',
                      validator: LoginValidator().errorMessage,
                      onChanged: (value) => _signUpFormBloc.add(SignUpFormEvent.changeLogin(value)),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16.0),
                    BasicOutlinedTextfield(
                      controller: _passwordController,
                      hint: 'Password',
                      obscure: true,
                      showObscureSwitch: true,
                      validator: PasswordValidator().errorMessage,
                      onChanged: (value) => _signUpFormBloc.add(SignUpFormEvent.changePassword(value)),
                    ),
                    const Expanded(child: SizedBox(height: 16.0)),
                    BlocBuilder(
                      bloc: _signUpFormBloc,
                      builder: (BuildContext context, SignUpFormState state) {
                        return FilledButton(
                          text: 'Sign up',
                          bloc: _signUpBloc,
                          enabled: state.valid,
                          onTap: () => _onSignInTap(state.user),
                        );
                      },
                    ),
                    const SizedBox(height: 16.0),
                    RevertedButton(
                      text: 'Sign in',
                      onTap: () => const SignInScreen().setAsBaseScreen(),
                    ),
                    const SizedBox(height: 22.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSignInTap(UserRegister user) {
    if (_formKey.currentState?.validate() ?? false) {
      _signUpBloc.add(TriggerAnyAnimatedButtonEvent(user));
    }
  }
}
