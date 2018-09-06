import 'package:flutter/material.dart';
import 'package:tutorial/containers/counter/counter.dart';
import 'package:tutorial/containers/counter/increase_counter.dart';
import 'package:tutorial/containers/auth_button/auth_button_container.dart';

class HomePage extends StatelessWidget {
  // We passed it a title from the app root, so we have to
  // set up the class to accept that arg.
  final String title;
  HomePage(this.title);

  @override
  Widget build(BuildContext context) {
    // Scaffold is almost always going to be your top-level widget
    // on each page.
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GoogleAuthButtonContainer(),
              Container(
                height: 10.0,
              ),
              Text(
                'You have pushed the button this many times:',
              ),
              Counter(),
              Container(
                height: 20.0,
              ),
              Text(""),
            ],
          ),
        ),
      ),
      floatingActionButton: IncreaseCountButton(),
    );
  }
}
