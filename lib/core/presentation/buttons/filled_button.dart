import 'package:any_animated_button/any_animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/style/border_radiuses.dart';
import 'package:hospital_doctor/core/style/colors.dart';
import 'package:hospital_doctor/core/style/dimens.dart';
import 'package:hospital_doctor/core/style/text_styles.dart';

class FilledButton extends CustomAnyAnimatedButton {
  FilledButton({
    required this.text,
    required this.onTap,
    this.enabled = true,
    this.bloc,
  });

  @override
  final AnyAnimatedButtonBloc? bloc;
  final String text;
  final VoidCallback onTap;
  final bool enabled;

  @override
  AnyAnimatedButtonParams get defaultParams => AnyAnimatedButtonParams(
        width: double.infinity,
        height: Dimens.buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadiuses.all18,
          color: enabled ? CustomColors.blue : CustomColors.grey,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: enabled ? onTap : null,
            borderRadius: BorderRadiuses.all18,
            splashColor: CustomColors.lightBlue,
            highlightColor: Colors.transparent,
            child: Center(
              child: Text(text, style: roboto.s22.w700.whiteColor),
            ),
          ),
        ),
      );
}
