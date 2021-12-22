import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameTempalte extends StatefulWidget {
  @override
  NameTempalteState createState() {
    return NameTempalteState();
  }
}

class NameTempalteState extends State<NameTempalte> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _myDateTime;
  String time = '';
  String _matchName = '';
  String _playersCount = "0";
  String _playerName = '';

  @override
  void initState() {
    super.initState();
    cargarPref();
  }

  cargarPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _matchName = prefs.getString('matchName') ?? "Nombre de la Partida";
    setState(() {});
  }

  _setMatchName(String? valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('matchName', valor ?? "Nombre de la Partida");
    _matchName = valor ?? "Nombre de la Partida";
    setState(() {});
  }

  _setPlayersCount(String? valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('playersCount', valor ?? "0");
    _playersCount = valor ?? "0";
    setState(() {});
  }

  _setPlayerName(String? valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('playerName', valor ?? "Nombre del Jugador");
    _playerName = valor ?? "Nombre del Jugador";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nombre Plantilla')),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Nombre de la partida',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Porfavor ingrese el nombre de la partida';
                        }
                      },
                      onChanged: _setMatchName,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Nombre del juego',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Porfavor ingrese el nombre del juego';
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Cantidad de jugadores',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Porfavor ingrese la cantidad de jugadores';
                        }
                      },
                      onChanged: _setPlayersCount,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              time,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(52, 207, 191, 1)),
                            onPressed: () async {
                              _myDateTime = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2015),
                                  lastDate: DateTime(2025));
                              setState(() {
                                String stringDate = _myDateTime.toString();
                                final dt = DateTime.parse(stringDate);
                                time = DateFormat('dd/MM/yyyy').format(dt);
                              });
                            },
                            child: Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.385,
                        child: Scrollbar(
                            child: ListView.builder(
                                itemCount: int.parse(_playersCount),
                                itemBuilder: (_, int index) {
                                  return TextFormField(
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: ('Nombre del jugador'),
                                      ),
                                      validator: (value) {
                                        if (value != null && value.isEmpty) {
                                          return 'Porfavor ingrese el nombre del jugador';
                                        }
                                      },
                                      onChanged: _setPlayerName);
                                })))
                  ],
                ),
              )),
          Container(
            child: Material(
              color: Color.fromRGBO(52, 207, 191, 1),
              child: InkWell(
                onTap: () => {
                  if (_formKey.currentState!.validate())
                    {
                      Navigator.pushNamed(context, 'matchScreen',
                          arguments: ''),
                    }
                  else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Porfavor rellene todos los campos')))
                    },
                },
                child: SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Comenzar Partida',
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
      ),
    );
  }
}
