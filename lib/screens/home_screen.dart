import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina Principal')),
      body: Center(
        child: Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, 'create', arguments: ''),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Crear Partida'),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'selectTemplate',
                    arguments: ''),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Ver Plantillas'),
                ),
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, 'history', arguments: ''),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text('Ver Historial'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
