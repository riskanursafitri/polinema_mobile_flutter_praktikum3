import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();

  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  konversi() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      _reamur = 4 / 5 * _inputUser;
      _kelvin = _inputUser + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("KOnverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: etInput,
                decoration: const InputDecoration(
                    hintText: 'Masukkan Suhu Dalam Celcius'),
              ),
              Container(
                alignment: Alignment.center,
                child: Text("Hasil Konversi",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                margin: EdgeInsets.only(top: 20, bottom: 80),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '$_kelvin',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        "Kelvin",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '$_reamur',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        "Reamur",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                child: Text("",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                margin: EdgeInsets.only(top: 20, bottom: 80),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      onPressed: konversi,
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Konversi Suhu'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
