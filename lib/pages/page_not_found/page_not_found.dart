import 'package:flutter/material.dart';

const pageSpecification = '''
# Page Not Found

This page appears when there is a bug in routing.
''';



/// Displays a page indicating that there was an attempt to route to a non-existent page.
class PageNotFound extends StatelessWidget {
  const PageNotFound({
    super.key,
  });
  final String title = 'Page Not Found';
  static const routeName = '/page_not_found';


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        "Page Not found"
      )
    );
  }
}