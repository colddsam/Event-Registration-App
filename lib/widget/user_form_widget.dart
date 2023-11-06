import 'package:flutter/material.dart';
import 'package:spreadsheetconnectionapp/model/user.dart';
import 'package:spreadsheetconnectionapp/widget/button_widget.dart';

class UserFromWidget extends StatefulWidget {
  final User? user;
  final ValueChanged<User> onSaveUser;
  const UserFromWidget({Key? key, this.user, required this.onSaveUser})
      : super(key: key);

  @override
  State<UserFromWidget> createState() => _UserFromWidgetState();
}

class _UserFromWidgetState extends State<UserFromWidget> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPhone;
  late TextEditingController tSize;
  late TextEditingController controllerID;
  late TextEditingController controllerPref;
  late bool getSwags;
  late bool getTshirt;
  late bool getLunch;
  late bool getBreakfast;
  late bool quizWinner;
  late bool entered;

  @override
  void didUpdateWidget(covariant UserFromWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    initUser();
  }

  @override
  void initState() {
    super.initState();
    initUser();
  }

  void initUser() {
    final id = widget.user == null ? '' : widget.user!.id;
    final controllerpref = widget.user == null ? '' : widget.user!.preference;
    final name = widget.user == null ? '' : widget.user!.name;
    final email = widget.user == null ? '' : widget.user!.email;
    final phone = widget.user == null ? '' : widget.user!.phone;
    final tsize = widget.user == null ? '' : widget.user!.tsize;
    final getSwags = widget.user == null ? false : widget.user!.swags;
    final getEntered = widget.user == null ? false : widget.user!.entered;
    final getTshirt = widget.user == null ? false : widget.user!.tshirt;
    final getLunch = widget.user == null ? false : widget.user!.lunch;
    final getBreakfast = widget.user == null ? false : widget.user!.breakfast;
    final quizWinner = widget.user == null ? false : widget.user!.quiz;

    setState(() {
      controllerPref = TextEditingController(text: controllerpref);
      controllerID = TextEditingController(text: id);
      controllerName = TextEditingController(text: name);
      controllerEmail = TextEditingController(text: email);
      controllerPhone = TextEditingController(text: phone);
      tSize = TextEditingController(text: tsize);
      this.getSwags = getSwags;
      this.getTshirt = getTshirt;
      this.getLunch = getLunch;
      this.getBreakfast = getBreakfast;
      this.quizWinner = quizWinner;
      this.entered = getEntered;
    });
  }

  double height = 20.0;
  Widget buildSubmit() => ButtonWidget(
      text: 'save',
      onClicked: () {
        final form = formKey.currentState!;
        final isValid = form.validate();
        if (isValid) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('ALERT!'),
                    content:
                        Text('Do you really want to update the information ? '),
                    actions: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                            });
                            Navigator.pop(context);
                          },
                          child: Text('Back')),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              final user = User(
                                  preference: controllerPref.text,
                                  id: controllerID.text,
                                  name: controllerName.text,
                                  email: controllerEmail.text,
                                  phone: controllerPhone.text,
                                  tsize: tSize.text,
                                  entered: entered,
                                  swags: getSwags,
                                  breakfast: getBreakfast,
                                  lunch: getLunch,
                                  quiz: quizWinner,
                                  tshirt: getTshirt);

                              widget.onSaveUser(user);
                            });
                            Navigator.pop(context);
                          },
                          child: Text('Update'))
                    ],
                  ));
        }
      });
  Widget buildPref() => TextFormField(
        readOnly: true,
        controller: controllerPref,
        decoration: InputDecoration(
            labelText: 'Preference', border: OutlineInputBorder()),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter valid Preference' : null,
      );
  Widget buildID() => TextFormField(
        readOnly: true,
        controller: controllerID,
        decoration:
            InputDecoration(labelText: 'ID', border: OutlineInputBorder()),
        validator: (value) =>
            value != null && (value.length != 22) ? 'Enter valid ID' : null,
      );
  Widget buildName() => TextFormField(
        readOnly: true,
        controller: controllerName,
        decoration:
            InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Name' : null,
      );

  Widget buildEmail() => TextFormField(
        readOnly: true,
        controller: controllerEmail,
        decoration:
            InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
        validator: (value) =>
            value != null && !value.contains('@') ? 'Enter valid Email' : null,
      );
  Widget buildPhone() => TextFormField(
        readOnly: true,
        controller: controllerPhone,
        decoration:
            InputDecoration(labelText: 'Phone', border: OutlineInputBorder()),
        validator: (value) =>
            value != null && value.isEmpty
                ? 'Enter valid number'
                : null,
      );
  // Widget buildID() => TextFormField(
  //       controller: controllerID,
  //       decoration:
  //           InputDecoration(labelText: 'ID', border: OutlineInputBorder()),
  //       validator: (value) =>
  //           value != null && value.isEmpty ? 'Enter Name' : null,
  //     );
  Widget buildSize() => TextFormField(
      readOnly: true,
      controller: tSize,
      validator: (value) =>
          value != null && value.isEmpty
              ? 'Enter Valid Size'
              : null,
      decoration:
          InputDecoration(labelText: 'Size', border: OutlineInputBorder()));
  Widget buildSwags() => SwitchListTile(
        value: getSwags,
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
        title: Text('Swags Provided ?'),
        onChanged: (value) => setState(() {
          getSwags = value;
        }),
      );
  Widget buildTshirt() => SwitchListTile(
        value: getTshirt,
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
        title: Text('tshirt Provided ?'),
        onChanged: (value) => setState(() {
          getTshirt = value;
        }),
      );
  Widget buildLunch() => SwitchListTile(
      value: getLunch,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      title: Text('Lunch Provided ?'),
      onChanged: (value) => setState(() {
            getLunch = value;
          }));
  Widget buildBreakfast() => SwitchListTile(
      value: getBreakfast,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      title: Text('Breakfast Provided ?'),
      onChanged: (value) => setState(() {
            getBreakfast = value;
          }));
  Widget buildQuiz() => SwitchListTile(
      value: quizWinner,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      title: Text('Quiz Winner ?'),
      onChanged: (value) => setState(() {
            quizWinner = value;
          }));
  Widget buildEntered() => SwitchListTile(
      value: entered,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      title: Text('Registered?'),
      onChanged: (value) => setState(() {
            entered = value;
          }));
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildID(),
          SizedBox(
            height: height,
          ),
          buildName(),
          SizedBox(
            height: height,
          ),
          buildEmail(),
          SizedBox(
            height: height,
          ),
          buildSize(),
          SizedBox(
            height: height,
          ),
          buildPref(),
          SizedBox(
            height: height,
          ),
          buildPhone(),
          SizedBox(
            height: height,
          ),
          buildEntered(),
          SizedBox(
            height: height,
          ),
          buildBreakfast(),
          SizedBox(
            height: height,
          ),
          buildLunch(),
          SizedBox(
            height: height,
          ),
          buildQuiz(),
          SizedBox(
            height: height,
          ),
          buildSwags(),
          SizedBox(
            height: height,
          ),
          buildTshirt(),
          SizedBox(
            height: height,
          ),
          buildSubmit(),
        ],
      ),
    );
  }
}
