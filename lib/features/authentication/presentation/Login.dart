import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tamagotchi_tamer/features/all_data_provider.dart';
import 'package:tamagotchi_tamer/features/authentication/presentation/register_user_info.dart';
import 'package:tamagotchi_tamer/features/authentication/presentation/verify_email.dart';
import 'package:tamagotchi_tamer/features/home/presentation/Home.dart';
import 'package:tamagotchi_tamer/features/authentication/presentation/forgot_password.dart';
import 'package:tamagotchi_tamer/features/users/domain/user_collection.dart';

import '../../../repositories/firestore/firestore_providers.dart';
import '../../users/data/user_providers.dart';

class LoginPage extends ConsumerWidget {

  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/';


  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return SignInScreen(
      actions: [
        ForgotPasswordAction((context, email) {
          Navigator.pushNamed(
            context,
            ForgotPassword.routeName,
            arguments: {'email': email},
          );
        }),
        AuthStateChangeAction<SignedIn>((context, state) {
          if (!state.user!.emailVerified) {
            Navigator.pushNamed(context, VerifyEmailView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          }
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          if (!state.credential.user!.emailVerified) {
            Navigator.pushNamed(context, VerifyEmailView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          }
        }),
        AuthStateChangeAction<CredentialLinked>((context, state) {
          if (!state.user.emailVerified) {
            Navigator.pushNamed(context, VerifyEmailView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
            }
        }),
      ],
      styles: const {
        EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
      },
      /*
      headerBuilder: headerImage('assets/images/vegetables.png'),
      sideBuilder: sideImage('assets/images/vegetables.png'),
       */
      subtitleBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            action == AuthAction.signIn
                ? 'Welcome to Tamagotchi Tamer! Please sign in.'
                : 'Welcome to Tamagotchi Tamer! Please create an account.',
          )
        );
      },
      footerBuilder: (context, action) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              action == AuthAction.signIn
                  ? 'By signing in, you agree to our terms and conditions.'
                  : 'By registering, you agree to our terms and conditions.',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
    );



    /*
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                const SizedBox(height: 16.0),
                Text(
                    'Tamagotchi Trainer Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                  ),
                )
              ],
            ),
            const SizedBox(height: 100.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',

              ),
            ),

            const SizedBox(height: 12.0),

            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              )
            ),

            const SizedBox(height: 12.0),

            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                      },
                    child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text('Next'),
                )
              ]
            )
          ],
        )
      )
    );

     */
  }
}
