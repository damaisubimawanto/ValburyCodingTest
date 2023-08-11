import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valbury_coding_test/res/values/strings.dart';
import 'package:validators/validators.dart';

class BorderInputType extends StatelessWidget {
  const BorderInputType({
    super.key,
    required this.title,
    required this.hint,
    required this.isDigitOnly,
    required this.isEmailValidation,
    required this.inputType,
    this.maxLength,
  });

  final bool isDigitOnly;
  final bool isEmailValidation;
  final int? maxLength;
  final String title;
  final String hint;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter>? inputFormatters;
    if (isDigitOnly) {
      inputFormatters = [
        FilteringTextInputFormatter.digitsOnly
      ];
    }

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 16.0),
            Text(title)
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: TextFormField(
            obscureText: false,
            maxLength: maxLength,
            keyboardType: inputType,
            inputFormatters: inputFormatters,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppString.instance.errorCannotBeEmpty;
              } else if (isEmailValidation) {
                if (!isEmail(value)) {
                  return AppString.instance.errorEmailInvalid;
                }
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