import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
    this.onRefresh,
  }) : super(key: key);
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("ERROR"),
          TextButton(
            onPressed: onRefresh,
            child: const Text("REFRESH"),
          ),
        ],
      ),
    );
  }
}
