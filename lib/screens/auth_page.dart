import 'package:mixnmatch/components/login_form.dart';
import 'package:mixnmatch/components/sign_up_form.dart';
import 'package:mixnmatch/components/social_button.dart';
import 'package:mixnmatch/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:mixnmatch/utils/prefs.dart" ;
import '../utils/config.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    //build login text field
    return Scaffold(
        // backgroundColor: Config.primaryColor,
        body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.05.sw,
        vertical: 0.02.sh,
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text(
            //   AppText.enText['welcome_text']!,
            //   style: const TextStyle(
            //     fontSize: 36,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Image.asset(
            //     'assets/mnm.png',
            //     width: 0.7.sw,
            //     // height: 40,
            //   ),
            // ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/mixnmatch.png',
                width: 0.7.sw,
                // height: 40,
              ),
            ),
            Config.spaceBig,
            Text(
              isSignIn
                  ? AppText.enText['signIn_text']!
                  : AppText.enText['register_text']!,
              style: const TextStyle(
                // color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Config.spaceSmall,
            SizedBox(
              height: 0.02.sh,
            ),
            isSignIn ? LoginForm() : SignUpForm(),
            Config.spaceSmall,
            isSignIn
                ? Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        AppText.enText['forgot-password']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Container(),
            const Spacer(),
            Center(
              child: Text(
                AppText.enText['social-login']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            Config.spaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  'assets/google.png',
                  width: 0.1.sw,
                  height: 0.1.sw,
                ),
                Image.asset('assets/facebook.png',
                    width: 0.15.sw, height: 0.15.sw),
              ],
            ),
            Config.spaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  isSignIn
                      ? AppText.enText['signUp_text']!
                      : AppText.enText['registered_text']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isSignIn = !isSignIn;
                    });
                  },
                  child: Text(
                    isSignIn ? 'Sign Up' : 'Sign In',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
