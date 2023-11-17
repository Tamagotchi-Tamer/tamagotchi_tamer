import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamagotchi_tamer/features/authentication/presentation/Login.dart';
import 'package:tamagotchi_tamer/features/authentication/presentation/register_user_info.dart';
import 'package:tamagotchi_tamer/features/home/presentation/Home.dart';

import 'decorations.dart';


/// Builds the page to support email verification.
class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  static const routeName = '/verify-email';

  @override
  Widget build(BuildContext context) {
    return EmailVerificationScreen(
      headerBuilder: headerIcon(Icons.verified),
      sideBuilder: sideIcon(Icons.verified),
      actions: [
        EmailVerifiedAction(() {
          Navigator.pushReplacementNamed(context, RegisterUserInfo.routeName);
        }),
        AuthCancelledAction((context) {
          FirebaseUIAuth.signOut(context: context);
          Navigator.pushReplacementNamed(context, LoginPage.routeName);
        }),
      ],
    );
  }
}
