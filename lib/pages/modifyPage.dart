import 'package:flutter/material.dart';
import 'package:spreadsheetconnectionapp/api/sheets/user_sheets_api.dart';
import 'package:spreadsheetconnectionapp/model/user.dart';

import '../widget/user_form_widget.dart';

class ModifySheetsPage extends StatefulWidget {
  final String id;
  const ModifySheetsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ModifySheetsPage> createState() => _ModifySheetsPageState();
}

class _ModifySheetsPageState extends State<ModifySheetsPage> {
  late String id;
  final String title = "Devfest 2023";
  User? user;
  bool loading = true; // Add loading state
  bool check = true;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    getUsers();
  }

  Future<void> getUsers() async {
    try {
      final user = await userSheetsApi.getByID(id);
      setState(() {
        this.user = user;
        loading = false;
        check = true;
      });
    } catch (error) {
      setState(() {
        check = false;
        loading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (check == true) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: loading
                ? Center(child: CircularProgressIndicator())
                : UserFromWidget(
                    user: user,
                    onSaveUser: (user) async {
                      try{
                        await userSheetsApi.update(user.id, user.toJson());
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        title: Text("UPDATED!"),
                        content: Text(
                          "Attendee Updated"
                        ),
                        actions: [
                          TextButton(onPressed: ()=>Navigator.pop(context),
                          child: Text("Close"))
                        ],
                      ));
                      }on Exception catch(_){
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("ERROR!"),
                                  content: Text("Some Problem occurs during update the sheet"),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("Close"))
                                  ],
                                ));
                      }
                      
                    },
                  ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: AlertDialog(
          title: Text("ERROR"),
          content: Text("Match not found"),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Back')),
          ],
        ),
      );
    }
  }
}
