import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/helper/widget_ext.dart';
import 'package:hospital_doctor/core/style/border_radiuses.dart';
import 'package:hospital_doctor/core/style/colors.dart';
import 'package:hospital_doctor/core/style/paddings.dart';
import 'package:hospital_doctor/core/style/text_styles.dart';

abstract class Dialogs {
  static void ok(
    BuildContext context, {
    required String text,
    required VoidCallback onOk,
    Color backgroundColor = CustomColors.white,
  }) =>
      showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadiuses.all8),
          child: InkWell(
            onTap: () {
              Navigator.of(context).maybePop().then((value) => onOk());
            },
            child: Padding(
              padding: Paddings.horizontal48,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 40.0),
                  Text(
                    text,
                    style: roboto.s22.w400.blackColor,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 82.0),
                ],
              ),
            ),
          ).noSplash(),
        ),
      );
}
