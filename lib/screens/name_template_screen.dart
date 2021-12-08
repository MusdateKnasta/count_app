import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
