import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String character;
  final String quote;

  DetailPage(this.character, this.quote);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${character}",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "${quote}",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
