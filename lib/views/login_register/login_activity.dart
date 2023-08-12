import 'package:flutter/material.dart';
import 'package:valbury_coding_test/res/values/strings.dart';
import 'package:valbury_coding_test/utils/routes/routes_name.dart';
import 'package:valbury_coding_test/views/custom_views/border_input_type.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({super.key});

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final _formLoginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.instance.textLogin.toUpperCase(),
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formLoginKey,
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            BorderInputType(
              title: AppString.instance.textEmail,
              hint: AppString.instance.hintEmail,
              inputType: TextInputType.emailAddress,
              isDigitOnly: false,
              isEmailValidation: true,
            ),
            const SizedBox(height: 10.0),
            BorderInputType(
              title: AppString.instance.textPhoneNumber,
              hint: AppString.instance.hintPhoneNumber,
              inputType: TextInputType.phone,
              isDigitOnly: true,
              isEmailValidation: false,
              maxLength: 10,
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  _loginMandatory(context);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50.0)
                ),
                child: Text(AppString.instance.textSubmit),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _loginMandatory(BuildContext context) async {
    if (_formLoginKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return const Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator()
                ],
              ),
            ),
          );
        }
      );

      await Future.delayed(const Duration(seconds: 3));

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed(RouteName.home);
    }
  }
}

