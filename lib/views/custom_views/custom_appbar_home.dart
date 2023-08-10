import 'package:flutter/material.dart';

import '../../res/values/strings.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.account_circle_rounded),
            Text(AppString.instance.appName)
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black54
                )
              ),
              child: const Text('Label 1'),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Colors.black54
                  )
              ),
              child: const Text('Label 2'),
            )
          ],
        )
      ],
    );
  }
}