import 'package:flutter/material.dart';
import 'package:spreadsheetconnectionapp/pages/choice.dart';

class choiceMethod extends StatelessWidget {
  const choiceMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Devfest 2023'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BarcodeScanner()));
                },
                child: Text('Press to Scan')),
            ElevatedButton(
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TextSearchID()));
                },
                child: Text('Press to Write')),
          ],
        ),
      ),
    );
  }
}
