import 'package:flutter/material.dart';

import '../../res/values/strings.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/ic_launcher_circle.png',
                width: 48,
                height: 48,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(AppString.instance.appName)
              ),
              const Icon(Icons.more_vert_outlined)
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black54
                    )
                  ),
                  child: const Text(
                    'Label 1',
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: const BoxDecoration(
                      border: BorderDirectional(
                        bottom: BorderSide(
                          color: Colors.black54,
                          width: 1
                        ),
                        end: BorderSide(
                          color: Colors.black54,
                          width: 1
                        ),
                        top: BorderSide(
                          color: Colors.black54,
                          width: 1
                        ),
                      )
                  ),
                  child: const Text(
                    'Label 2',
                    style: TextStyle(
                      fontSize: 14
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}