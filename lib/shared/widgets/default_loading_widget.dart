import 'package:flutter/material.dart';

class DefaultLoadingWidget extends StatelessWidget {
  const DefaultLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 80,
        width: 80,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
