import 'package:flutter/material.dart';
import 'package:hospital_doctor/core/presentation/widgets/custom_error_widget.dart';

class CustomErrorScreen extends StatelessWidget {
  const CustomErrorScreen({
    Key? key,
    this.onRefresh,
  }) : super(key: key);
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomErrorWidget(
          onRefresh: onRefresh,
        ),
      ),
    );
  }
}
