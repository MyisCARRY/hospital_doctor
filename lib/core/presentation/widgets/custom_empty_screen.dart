import 'package:flutter/material.dart';

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
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
