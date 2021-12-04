import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/style/colors.dart';

class AddFAB extends StatelessWidget {
  const AddFAB({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: CustomColors.lightBlue,
        highlightColor: Colors.transparent,
      ),
      child: FloatingActionButton(
        backgroundColor: CustomColors.blue,
        onPressed: onTap,
        child: const Icon(
          Icons.add,
          size: 40.0,
          color: CustomColors.white,
        ),
      ),
    );
  }
}
