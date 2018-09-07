import 'package:flutter/material.dart';
import 'package:tutorial/containers/counter/counter.dart';
import 'package:tutorial/containers/counter/increase_counter.dart';
import 'package:tutorial/containers/auth_button/auth_button_container.dart';
import 'package:tutorial/containers/user_profile/user_profile.dart';

class HomePage extends StatelessWidget {
  final String title;
  HomePage(this.title);

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CurrentUserProfile(),
              ),
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
