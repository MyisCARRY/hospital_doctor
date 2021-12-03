import 'package:enum_to_string/enum_to_string.dart';
import 'package:fimber/fimber.dart';

enum Configs {
  local,
  development,
  production,
  staging,
}

abstract class AppConfig {
  AppConfig._(this.apiHostName);

  final String apiHostName;

  String get api => 'https://$apiHostName';

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
      default:
        throw UnimplementedError();
    }
  }
}

class DevConfig extends AppConfig {
  DevConfig() : super._('hospitalapi.azurewebsites.net');
}
