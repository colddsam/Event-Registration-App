import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spreadsheetconnectionapp/pages/modifyPage.dart';
import 'package:spreadsheetconnectionapp/widget/button_widget.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class TextSearchID extends StatefulWidget {
  const TextSearchID({super.key});

  @override
  State<TextSearchID> createState() => _TextSearchIDState();
}

class _TextSearchIDState extends State<TextSearchID> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  void initUser() {
    setState(() {
      controllerName = TextEditingController();
    });
  }

  double height = 20.0;
  final title = 'Devfest 2023';
  Widget buildName() => TextFormField(
        controller: controllerName,
        decoration: InputDecoration(
            labelText: 'Enter ID', border: OutlineInputBorder()),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter ID' : null,
      );

  Widget buildSubmit() => ButtonWidget(
      text: 'check',
      onClicked: () {
        final form = formKey.currentState!;
        final isValid = form.validate();
        if (isValid) {
          String tempID = 'DEVFEST-' + controllerName.text + '-GDGDGP23';
          _mainCheckPage(context, tempID);
          setState(() {
            controllerName.clear();
            tempID = '';
          });
        }
      });

  _mainCheckPage(BuildContext context, String id) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ModifySheetsPage(
                  id: id,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buildName(), SizedBox(height: height), buildSubmit()],
          ),
        ),
      ),
    );
  }
}

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({super.key});

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  String barcode = '';

  void scanBarcode() async {
    String result = '';
    try {
      result = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "CANCEL", true, ScanMode.BARCODE);
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ModifySheetsPage(id: result)));
    } on PlatformException {
      result = "ERROR";
    }
    setState(() {
      barcode = result;
    });
  }

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
          child: ElevatedButton(
            onPressed: scanBarcode,
            child: Text("scan"),
          )),
    );
  }
}
