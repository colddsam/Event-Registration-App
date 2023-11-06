import 'package:flutter/material.dart';
import '../widget/user_form_widget.dart';
import '../api/sheets/user_sheets_api.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String title = 'Devfest 2023';
  // Future insertUser() async {
  //   final user = [
  //     User(
  //         id: 'id',
  //         name: 'name',
  //         email: 'email',
  //         phone: 'phone',
  //         entered: 'entered',
  //         swags: 'swags',
  //         breakfast: 'breakfast',
  //         lunch: 'lunch',
  //         preference: 'preference',
  //         tsize: 'tsize')
  //   ];
  //   final jsonusers = user.map((user) => user.toJson()).toList();
  //   await userSheetsApi.insert(jsonusers);
  // }

  @override
  Widget build(BuildContext context) {
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
          child: UserFromWidget(
            onSaveUser: (user) async {
              // final id = await userSheetsApi.getRows();
              // final newUser = user.copy(id: id);
              await userSheetsApi.insert([user.toJson()]);
            },

            //() async {
            //   final user = User(
            //     id: '1',
            //     email: 'dassamratkumar772@gmail.com',
            //     entered: 'yes',
            //     breakfast: 'no',
            //     lunch: 'no',
            //     name: 'samrat kumar das',
            //     swags: 'no',
            //     tsize: 'L',
            //     preference:'no',
            //     phone: '123456789'
            //   );
            //   await userSheetsApi.insert([user.toJson()]);
            // },
          ),
        ),
      ),
    );
  }
}
