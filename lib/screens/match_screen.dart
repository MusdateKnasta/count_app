import 'package:flutter/material.dart';

class StateMatch extends StatefulWidget {
  @override
  MatchScreen createState() => MatchScreen();
}

class MatchScreen extends State<StateMatch> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Nombre Partida')),
        body: Column(
          children: [
            Container(
              height: 50,
              color: Color.fromRGBO(255, 226, 104, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: Center(child: Text('Jugador'))),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: Center(child: Text('Puntuacion'))),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: Center(child: Text(''))),
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.73,
                child: Scrollbar(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (_, int idex) => PlayerContainer(
                            counter, _decreaseCounter, _incrementCounter)))),
            Container(
              child: Material(
                color: Color.fromRGBO(52, 207, 191, 1),
                child: InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, 'results', arguments: ''),
                  child: SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Finalizar Partida',
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

class PlayerContainer extends StatelessWidget {
  PlayerContainer(this.counter, this._decreaseCounter, this._incrementCounter);
  final int counter;
  final _decreaseCounter;
  final _incrementCounter;
  @override
  Widget build(BuildContext context) {
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
              width: MediaQuery.of(context).size.width * 0.33,
              child: Center(child: Text('Jugador'))),
          Container(
              width: MediaQuery.of(context).size.width * 0.33,
              child: Center(child: Text('$counter'))),
          Container(
            width: MediaQuery.of(context).size.width * 0.33,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Color.fromRGBO(255, 226, 104, 1),
                  foregroundColor: Colors.black,
                  onPressed: () {
                    _decreaseCounter();
                  },
                  child: Icon(Icons.remove),
                  mini: true,
                ),
                FloatingActionButton(
                  backgroundColor: Color.fromRGBO(255, 226, 104, 1),
                  foregroundColor: Colors.black,
                  onPressed: () => {_incrementCounter()},
                  child: Icon(Icons.add),
                  mini: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
