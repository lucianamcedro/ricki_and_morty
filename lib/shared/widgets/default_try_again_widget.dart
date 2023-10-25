import 'package:flutter/material.dart';

class DefaultTryAgainWidget extends StatelessWidget {
  const DefaultTryAgainWidget({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Text(
            'Ops, somehing wrong happend',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'Try Again',
            ),
          ),
        ],
      ),
    );
  }
}
