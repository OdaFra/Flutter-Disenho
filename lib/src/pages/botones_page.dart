import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class BotonesPage extends StatelessWidget {
  const BotonesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _fondoApp(),
            SingleChildScrollView(
              child: Column(
                children: [
                  _titulos(),
                  _botonesRedondeados(),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: _bottonNavigatorBar(context));
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );

    final cajarosada = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 250.0,
        width: 290.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ],
          ),
        ),
      ),
    );

    return Stack(
      children: [
        gradiente,
        Positioned(
          child: cajarosada,
          top: -60.0,
        )
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Classify Transaction',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('Classify this transaction into to particular category',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
          ],
        ),
      ),
    );
  }

  Widget _bottonNavigatorBar(context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: Colors.pinkAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                size: 30.0,
              ),
              title: Container()),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bubble_chart,
                size: 30.0,
              ),
              title: Container()),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.supervised_user_circle,
                size: 30.0,
              ),
              title: Container()),
        ],
      ),
    );
  }

  Widget _botonesRedondeados() {
    return Table(children: [
      TableRow(children: [
        _crearBotonesRedondeados(Colors.blue, Icons.border_all, 'General'),
        _crearBotonesRedondeados(
            Colors.purpleAccent, Icons.directions_bus, 'Buscador'),
      ]),
      TableRow(children: [
        _crearBotonesRedondeados(Colors.pinkAccent, Icons.shop, 'Buy'),
        _crearBotonesRedondeados(
            Colors.orange, Icons.insert_drive_file, 'File'),
      ]),
      TableRow(children: [
        _crearBotonesRedondeados(
            Colors.blueAccent, Icons.movie_filter, 'Entertaiment'),
        _crearBotonesRedondeados(Colors.green, Icons.cloud, 'Grocery'),
      ]),
      TableRow(children: [
        _crearBotonesRedondeados(Colors.red, Icons.collections, 'Photos'),
        _crearBotonesRedondeados(Colors.teal, Icons.help_outline, 'Help'),
      ]),
    ]);
  }

  Widget _crearBotonesRedondeados(Color color, IconData iconos, String texto) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.70),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 5.0,
              ),
              CircleAvatar(
                radius: 35.0,
                backgroundColor: color,
                child: Icon(
                  iconos,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              Text(
                texto,
                style: TextStyle(color: color),
              ),
              SizedBox(
                height: 5.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
