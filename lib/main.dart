import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  TextEditingController firstEditingController = TextEditingController();
  TextEditingController secondEditingController = TextEditingController();

  num out = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    controller: firstEditingController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    controller: secondEditingController,
                    keyboardType:  TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('結果:$out'),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: (){
                      setState((){
                        out = 0;
                        out = num.parse(firstEditingController.text) + num.parse(secondEditingController.text);
                      });
                    },
                    child: const Text('+')
                ),
                ElevatedButton(
                  onPressed: (){
                    setState((){
                      out = 0;
                      out = num.parse(firstEditingController.text) - num.parse(secondEditingController.text);
                    });
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState((){
                      out = 0;
                      out = num.parse(firstEditingController.text) * num.parse(secondEditingController.text);
                    });
                  },
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState((){
                      out = 0;
                      out = num.parse(firstEditingController.text) / num.parse(secondEditingController.text);
                    });
                  },
                  child: const Text('÷'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}