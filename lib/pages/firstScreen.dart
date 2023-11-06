import 'package:flutter/material.dart';
import 'package:spreadsheetconnectionapp/pages/internetCheck.dart';




class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  final String title = 'Devfest 2023';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InternetConnection()));
                },
                child: Text("press to start"))
          ],
        ),
      ),
    );
  }
}
