import 'dart:convert';

import 'package:get/get.dart';
import 'package:mixnmatch/components/button.dart';
import 'package:mixnmatch/controllers/branch_controller.dart';
import 'package:mixnmatch/controllers/login_controller.dart';
import 'package:mixnmatch/main.dart';
import 'package:mixnmatch/models/auth_model.dart';
import 'package:mixnmatch/providers/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:mixnmatch/screens/branchSelect_page.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/error_dialog_widget.dart';
import 'package:mixnmatch/utils/prefs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
              hintStyle: TextStyle(color: Colors.white), // Set hint text color
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white), // Set border color to white
                borderRadius: BorderRadius.circular(
                    20.0), // Set corner radius to 20 pixels
              ),
            ),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obsecurePass,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.lock_outline),
                prefixIconColor: Config.primaryColor,
                hintStyle:
                    TextStyle(color: Colors.white), // Set hint text color
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // Set border color to white
                  borderRadius: BorderRadius.circular(
                      20.0), // Set corner radius to 20 pixels
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecurePass = !obsecurePass;
                      });
                    },
                    icon: obsecurePass
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Config.primaryColor,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: Config.primaryColor,
                          ))),
          ),
          Config.spaceSmall,
          Consumer<AuthModel>(
            builder: (context, auth, child) {
              return Button(
                width: double.infinity,
                title: 'Sign In',
                onPressed: () async {
                  final LoginController c = Get.put(LoginController());
                  try {
                    await c.loginEmail(
                      email: _emailController.text,
                      password: _passController.text,
                    );
                    Navigator.of(context).pushNamed('branchSelectScreen',
                        arguments: {'isFromMain': false});
                  } on LoginException catch (e) {
                    _showErrorDialog(context, e.message);
                  } catch (e) {
                    _showErrorDialog(context,
                        "An unexpected error occurred. Please try again.");
                  }
                  final BranchSelectController controller =
                      Get.put(BranchSelectController());
                  controller.fetchBranches();
                },
                disable: false,
              );
            },
          )
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ErrorDialogWidget(
          title: "Error",
          content: message,
          onSubmit: () => Navigator.of(context).pop(),
        );
      },
    );
  }
}
