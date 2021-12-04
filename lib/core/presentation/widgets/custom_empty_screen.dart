import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/style/text_styles.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({
    this.text,
    Key? key,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text ?? "EMPTY",
            style: roboto.s18.w500.blueColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
