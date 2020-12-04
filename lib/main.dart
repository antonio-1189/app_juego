import 'package:flutter/material.dart';
import 'package:all_sensors/all_sensors.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<double> giro = [0.0, 0.0, 0.0];
  @override
  void initState() {
    super.initState();

    accelerometerEvents.listen((event) {
      setState(() {
        giro = [event.x, event.y, event.z];

        print('y');
        print(giro[1].roundToDouble());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: PageView(
          scrollDirection: Axis.horizontal,
          children: [_pagina1(), _pagina2()],
        ));
  }

  Widget _pagina1() {
    return Stack(
      children: [
        _color(),
        _imagen(),
        _texto(),
      ],
    );
  }

  Widget _color() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(14, 123, 192, 1.0));
  }

  Widget _imagen() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/marioKart3.png'),
      ),
    );
  }

  Widget _texto() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Text(
            'Simulador',
            style: TextStyle(color: Colors.white, fontSize: 45),
          ),
          Expanded(
            child: Container(),
          ),
          Icon(Icons.keyboard_arrow_right, size: 150.0, color: Colors.white)
        ],
      ),
    );
  }

  Widget _pagina2() {
    return Stack(
      children: [
        _carretera(),
        _auto(),
      ],
    );
  }

  Widget _auto() {
    return Column(children: [
      Expanded(child: Container()),
      Transform.scale(
        scale: _scalar(giro[1]),
        child: Transform(
          transform: Matrix4.skewX(giro[0] / 10),
          child: Container(
              width: 250.0,
              height: 250.0,
              child: Image(
                image: AssetImage('assets/cooredor.png'),
              )),
        ),
      ),
      SizedBox(
        height: 50.0,
      )
    ]);
  }

  Widget _carretera() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/carretera2.gif'),
      ),
    );
  }

  double _scalar(double escala) {
    if (escala < 0) {
      escala = 1.5;
    } else if (escala == 0.0) {
      escala = 1.5;
    } else if (escala >= 1 && escala <= 5) {
      escala = 2.0;
    }
    return escala;
  }
}
