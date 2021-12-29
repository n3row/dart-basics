import 'package:flutter/material.dart';

class SubscriptionsPage extends StatelessWidget {
  final int totalFollowClicks;
  final VoidCallback onClick;

  const SubscriptionsPage(
      {Key? key, required this.totalFollowClicks, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${this.totalFollowClicks}"),
            TextButton(
              onPressed: () {
                onClick();
              },
              child: Text("FOLLOW"),
            ),
          ],
        ),
      ),
    ]);
  }
}
