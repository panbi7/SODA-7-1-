import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xFF182949),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'SODA',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            actions: [
              ToggleSwitch(),
            ],
          ),
          drawer: Drawer(
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF182949),
                  ),
                  child: Text(
                    'SODA',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 24.0,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Icon : favorite'),
                )
              ],
            ),
          ),
          drawerScrimColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFFEDEDED),
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(
                  height: 51,
                ),
                RadioMFM(),
                CheckDD(),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomDatePicker(),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                      indent: 30,
                      endIndent: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Copyright 2022 SODA  All rights reserved.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Builder(builder: (context) {
                return FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: const Text('+ 버튼을 누르셨습니다.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('확인'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  foregroundColor: Color(0xFFFFFFFF),
                  backgroundColor: Color(0xFF182949),
                  shape: CircleBorder(),
                  child: Icon(Icons.add),
                );
              }),
              SizedBox(
                height: 71.0,
              ),
            ],
          ),
        ));
  }
}

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: isOn,
        onChanged: (bool value) {
          setState(() {
            isOn = value;
            if (isOn == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('switch를 ON 하였습니다.'),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );
            }
          });
        });
  }
}

enum MFM { male, female }

class RadioMFM extends StatefulWidget {
  const RadioMFM({super.key});

  @override
  State<RadioMFM> createState() => _RadioMFMState();
}

class _RadioMFMState extends State<RadioMFM> {
  MFM? _character = MFM.male;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Radio<MFM>(
              value: MFM.male,
              groupValue: _character,
              onChanged: (MFM? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            const Text('Male'),
          ],
        ),
        const SizedBox(width: 44),
        Row(
          children: [
            Radio<MFM>(
              value: MFM.female,
              groupValue: _character,
              onChanged: (MFM? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            const Text('Female'),
          ],
        ),
      ],
    );
  }
}

class CheckDD extends StatefulWidget {
  const CheckDD({super.key});

  @override
  State<CheckDD> createState() => _CheckDDState();
}

class _CheckDDState extends State<CheckDD> {
  bool isDesignerChecked = false;
  bool isDeveloperChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Checkbox(
              value: isDesignerChecked,
              onChanged: (bool? value) {
                setState(() {
                  isDesignerChecked = value ?? false;
                });
              },
            ),
            const Text('Designer'),
          ],
        ),
        const SizedBox(width: 16),
        Row(
          children: [
            Checkbox(
              value: isDeveloperChecked,
              onChanged: (bool? value) {
                setState(() {
                  isDeveloperChecked = value ?? false;
                });
              },
            ),
            const Text('Developer'),
          ],
        ),
      ],
    );
  }
}

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '버튼을 눌러 날짜를 선택해주세요.',
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => _selectDate(context),
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            foregroundColor: Colors.blue,
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          child: const Text('SELECT DATE'),
          
        ),
      ],
    );
  }
}
