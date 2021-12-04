import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_doctor/core/helper/images.dart';
import 'package:hospital_doctor/core/helper/widget_ext.dart';
import 'package:hospital_doctor/core/style/colors.dart';
import 'package:hospital_doctor/core/style/paddings.dart';
import 'package:hospital_doctor/core/style/text_styles.dart';

class TitleAppBar extends AppBar {
  TitleAppBar(
    BuildContext context, {
    required String title,
    bool showLeading = true,
    List<Widget>? actions,
    double elevation = 0,
    bool centerTitle = true,
    PreferredSizeWidget? bottom,
  }) : super(
          backgroundColor: CustomColors.white,
          elevation: elevation,
          centerTitle: centerTitle,
          title: Padding(
            padding: Paddings.horizontal24,
            child: Text(
              title,
              style: roboto.s22.w900.blueColor,
            ),
          ),
          actions: actions,
          leading: showLeading
              ? InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SvgPicture.asset(
                      SvgIcons.backArrow,
                      color: CustomColors.blue,
                    ),
                  ),
                ).noSplash()
              : null,
          bottom: bottom,
        );
}
