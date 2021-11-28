import 'package:count_app/WidgetsComponent/template_button.dart';
import 'package:flutter/material.dart';

class SelectTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mis Plantillas')),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 2.0, color: Color.fromRGBO(52, 207, 191, 1))),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.pushNamed(context, 'nameTemplate',
                            arguments: '');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text('Nueva Plantilla',
                                style: TextStyle(color: Colors.black)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Box()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Box(), Box()],
            ),
          ],
        ),
      ),
    );
  }
}
