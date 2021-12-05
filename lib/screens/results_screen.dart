import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Resumen de la Partida')),
        body: Column(
          children: [
            Container(
              height: 50,
              color: Color.fromRGBO(255, 226, 104, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(child: Text('Jugador'))),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(child: Text('Puntuacion')))
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.73,
                child: Scrollbar(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (_, int idex) {
                          return Container(
                            height: 75,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Color.fromRGBO(255, 226, 104, 1),
                              width: 2,
                            ))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Center(child: Text('Jugador'))),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Center(child: Text('counter'))),
                              ],
                            ),
                          );
                        }))),
            Container(
              child: Material(
                color: Color.fromRGBO(52, 207, 191, 1),
                child: InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, 'home', arguments: ''),
                  child: SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Volver al Menu Principal',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
