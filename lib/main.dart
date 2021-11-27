import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hospital_doctor/app_config.dart';
import 'package:hospital_doctor/core/navigator/navigator.dart';
import 'package:hospital_doctor/core/presentation/widgets/notifications.dart';
import 'package:hospital_doctor/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hospital_doctor/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:hospital_doctor/features/home/presentation%20/screens/home_screen.dart';
import 'package:hospital_doctor/generated/l10n.dart';
import 'package:hospital_doctor/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer().init();
  sl<AppConfig>();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = sl();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _authBloc.add(AuthEvent.checkStatus());
    });

    super.initState();
  }

  @override
  void dispose() {
    _authBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener(
          bloc: _authBloc,
          listener: (BuildContext context, AuthState state) {
            state.map(
              authenticated: (_) => const HomeScreen().setAsBaseScreen(),
              unauthenticated: (_) => const SignInScreen().setAsBaseScreen(),
              error: (state) {
                Notifications.error(failure: state.failure);
                const SignInScreen().setAsBaseScreen();
              },
            );
          },
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: CustomNavigator.router.generator,
        navigatorKey: CustomNavigator.navigatorKey,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        navigatorObservers: [BotToastNavigatorObserver()],
        builder: BotToastInit(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        home: const SizedBox(),
      ),
    );
  }
}
