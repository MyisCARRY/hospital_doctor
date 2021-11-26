import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/error/failures.dart';
import 'package:hospital_doctor/core/style/colors.dart';
import 'package:hospital_doctor/core/style/duration.dart';
import 'package:hospital_doctor/core/style/text_styles.dart';

abstract class Notifications {
  static void neutral({
    required String description,
    Color backgroundColor = CustomColors.black,
    VoidCallback? onTap,
  }) =>
      BotToast.showNotification(
        title: (_) => Text(
          description,
          style: roboto.s16.whiteColor,
          textAlign: TextAlign.center,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: backgroundColor.withOpacity(0.8),
        contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
        borderRadius: 18.0,
        duration: Durations.notificationDuration,
        onTap: onTap,
      );

  static void error({
    required Failure failure,
    Color backgroundColor = CustomColors.black,
  }) =>
      neutral(
        description: failure.errorMessage,
        backgroundColor: backgroundColor,
      );
}
