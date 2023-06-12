import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DefaultLayout extends ConsumerWidget {
  const DefaultLayout({
    Key? key,
    required this.body,
  }) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoApp'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: body,
            )
          ],
        ),
      ),
    );
  }
}
