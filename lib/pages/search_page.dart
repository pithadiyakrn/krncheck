import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page here'),
      ),
      body: Center(
        child: Text(
          'Search Page Content',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
