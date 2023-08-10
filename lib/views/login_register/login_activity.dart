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
            const SizedBox(height: 40),
            BorderInputType(
              title: AppString.instance.textEmail,
              hint: AppString.instance.hintEmail,
              maxLength: 10,
            ),
            const SizedBox(height: 10),
            BorderInputType(
              title: AppString.instance.textPhoneNumber,
              hint: AppString.instance.hintPhoneNumber,
              maxLength: 10,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: ElevatedButton(
                onPressed: () {
                  _loginMandatory();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)
                ),
                child: Text(AppString.instance.textSubmit),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _loginMandatory() {
    if (_formLoginKey.currentState!.validate()) {
      Navigator.of(context).pushReplacementNamed(RouteName.home);
    }
  }
}

