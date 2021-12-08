import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina Principal')),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/sports_items.jpg'),
              Column(
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
                  ),
                ],
              ),
              Image.asset('assets/images/sports.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
