import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todoapp/modules/common/defaultLayout.dart';

class HomeView extends ConsumerWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DefaultLayout(
      body: Placeholder(),
    );
  }
}
