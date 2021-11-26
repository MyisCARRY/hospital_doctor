import 'dart:io';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:fimber/fimber.dart';

enum Configs {
  local,
  development,
  production,
  staging,
}

abstract class AppConfig {
  AppConfig._({
    required this.apiHostName,
    required this.googleApiKeyAndroid,
    required this.googleApiKeyIos,
  });

  final String apiHostName;
  final String googleApiKeyAndroid;
  final String googleApiKeyIos;
  static const String apiVersion = '1.0';

  String get api => 'https://$apiHostName/$apiVersion';

  String get googleApiKey => Platform.isIOS ? googleApiKeyIos : googleApiKeyAndroid;

  static AppConfig get init => _getForFlavor;

  static AppConfig get _getForFlavor {
    final flavor = EnumToString.fromString(
      Configs.values,
      const String.fromEnvironment('flavor', defaultValue: 'production'),
    );
    switch (flavor) {
      case Configs.development:
        Fimber.plantTree(DebugTree());
        Fimber.d('debug mode');
        return DevConfig();
      case Configs.staging:
        Fimber.plantTree(DebugTree());
        Fimber.d('staging mode');
        return StagingConfig();
      case Configs.production:
        Fimber.d('release mode');
        return ProdConfig();
      default:
        throw UnimplementedError();
    }
  }
}

class DevConfig extends AppConfig {
  DevConfig()
      : super._(
          apiHostName: 'api.dev.circleup.ai/api',
          googleApiKeyAndroid: 'AIzaSyCQzK-SQgtfZ1KO7Tw2ot8osry_5AXeZbY',
          googleApiKeyIos: 'AIzaSyD2sBAHg30BApA-fSZNN3QinZbX1QWpXXA',
        );
}

class StagingConfig extends AppConfig {
  StagingConfig()
      : super._(
          apiHostName: 'api.stage.circleup.ai/api',
          googleApiKeyAndroid: 'AIzaSyCy5kCmMZUSZeMVVQ0YdAL-4-12vJVHS_g',
          googleApiKeyIos: 'AIzaSyB8rQZlHnE1L0UMs5wa21Q4tFYPq6OK9dA',
        );
}

class ProdConfig extends AppConfig {
  ProdConfig()
      : super._(
          apiHostName: 'api.prod.circleup.ai/api',
          // TODO(Piotr): add prod api address
          googleApiKeyAndroid: 'AIzaSyC0mC_TviHxL8UI9ms3keeXELngBkzzpXU',
          // TODO(Piotr): add protection for api key on google cloud platform
          googleApiKeyIos: 'AIzaSyAUBEDp0sVkaPldi71fOAuRpl6TuCyCGD0',
        );
}
