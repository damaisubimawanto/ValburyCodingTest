import 'package:flutter/material.dart';

class BorderInputType extends StatelessWidget {
  const BorderInputType({
    super.key,
    required this.title,
    required this.hint,
    this.maxLength,
  });

  final int? maxLength;
  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 8),
            Text(title)
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            obscureText: false,
            maxLength: maxLength,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Cannot be empty";
              }
              return null;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint
            ),
          ),
        ),
      ],
    );
  }
}