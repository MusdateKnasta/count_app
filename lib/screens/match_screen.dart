import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateMatch extends StatefulWidget {
  @override
  MatchScreen createState() => MatchScreen();
}

class MatchScreen extends State<StateMatch> {
  String _playersCount = '';
  @override
  void initState() {
    super.initState();
    cargarPref();
  }

  cargarPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _playersCount = prefs.getString('playersCount') ?? "1";

    setState(() {});
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
                        itemCount: int.parse(_playersCount),
                        itemBuilder: (_, int idex) => PlayerContainer()))),
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

class PlayerContainer extends StatefulWidget {
  @override
  _PlayerContainerState createState() => _PlayerContainerState();
}

class _PlayerContainerState extends State<PlayerContainer> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    void _incrementCounter() {
      setState(() {
        this.counter++;
      });
    }

    void _decreaseCounter() {
      setState(() {
        counter--;
      });
    }

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
              child: Center(child: Text('${this.counter}'))),
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
