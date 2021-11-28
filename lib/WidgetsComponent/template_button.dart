import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: TextButton(
        style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Color.fromRGBO(52, 207, 191, 1)),
        onPressed: () {
          Navigator.pushNamed(context, 'nameTemplate', arguments: '');
        },
        child: Text('Plantilla'),
      ),
    );
  }
}
