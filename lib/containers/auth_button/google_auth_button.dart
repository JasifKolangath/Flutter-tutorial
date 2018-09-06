import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class GoogleAuthButton extends StatelessWidget {
  final String buttonText;
  final Function onPressedCallback;

  GoogleAuthButton({
    @required this.buttonText,
    this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressedCallback,
      color: Colors.white,
      child: Container(
        width: 230.0,
        height: 50.0,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  "G",
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                )),
            Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
