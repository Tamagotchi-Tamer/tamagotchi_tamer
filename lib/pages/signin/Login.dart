import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                const SizedBox(height: 16.0),
                Text('Login Text')
              ],
            ),
            const SizedBox(height: 120.0),
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
  }


}
