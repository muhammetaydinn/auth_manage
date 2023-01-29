import 'package:flutter/material.dart';

import 'login_resources.dart';
import 'login_view_model.dart';

//LoginViewModel

class LoginView extends LoginViewModel with LoginResources {
  final EdgeInsets paddingLow = const EdgeInsets.all(16.0);
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: paddingLow,
        child: Center(
          child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: buildWrapFormBody()),
        ),
      ),
    );
  }

  Wrap buildWrapFormBody() {
    return Wrap(
      alignment: WrapAlignment.end,
      runSpacing: 10,
      spacing: 10,
      children: [
        TextFormField(
          controller: controllerEmail,
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: emailText),
        ),
        TextFormField(
          controller: controllerPassword,
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: passwordText),
        ),
        FloatingActionButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              fetchUserLogin(controllerEmail.text, controllerPassword.text);
            }
          },
        ),
      ],
    );
  }
}
