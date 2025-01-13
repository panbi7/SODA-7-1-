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
        appBar: SodaAppBar(),
        drawer: SodaDrawer(),
        drawerScrimColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 23),
                  Text(
                    'DAY 8',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 23),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Card(
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(
                        color: Colors.black,
                        width: 0,
                      )),
                  child: Column(
                    children: <Widget>[
                      const ListTile(
                        title: Text('Boilerplate 4\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: 'Roboto',),),
                        subtitle: Text(
                          '어느덧 SODA 캠프 8일차가 되었네요! \n'
                          '여기까지 달려오시느라 수고 많으셨어요 :)\n\n'
                          '아래 있는 CANCEL과 SUBMIT은 버튼입니다 !!',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {},
                            child: const Text('CANCEL', style: TextStyle(color: Color(0xFF4B6EB1)),),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('SUBMIT',style: TextStyle(color: Color(0xFF4B6EB1)),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ChipSelection(),
            ],
          ),
        ),
        floatingActionButton: Tooltip(
          message: 'ToolTip!',
          waitDuration: Duration(seconds: 0),
          showDuration: Duration(seconds: 3),
          verticalOffset: -56.0,
          child: FloatingActionButton(
            onPressed: () {},
            foregroundColor: Color(0xFFFFFFFF),
            backgroundColor: Color(0xFF182949),
            shape: CircleBorder(),
            child: Icon(Icons.add),
          ),
        ),
        bottomNavigationBar: Column(
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
      ),
    );
  }
}

class ChipSelection extends StatefulWidget {
  @override
  ChipSelectionState createState() => ChipSelectionState();
}

class ChipSelectionState extends State<ChipSelection> {
  int _selectedChipIndex = 0;

  final List<String> _options = [
    "SODA",
    "CAMP",
    "FUN",
    "FLUTTER",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 23),
        Wrap(
          spacing: 10.0,
          children: List<Widget>.generate(
            _options.length,
            (int index) {
              return ChoiceChip(
                label: Text(
                  _options[index],
                  style: (() {
                    TextStyle textStyle;
                    if (_selectedChipIndex == index) {
                      textStyle = TextStyle(color: Colors.white);
                    } else {
                      textStyle = TextStyle(color: Colors.black);
                    }
                    return textStyle;
                  })(),
                ),
                selected: (() {
                  bool isSelected;
                  if (_selectedChipIndex == index) {
                    isSelected = true;
                  } else {
                    isSelected = false;
                  }
                  return isSelected;
                })(),
                selectedColor: Color(0xFF182949),
                backgroundColor: Color(0xFFEDEDED),
                showCheckmark: false,
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      _selectedChipIndex = index;
                    } else {
                      _selectedChipIndex = _selectedChipIndex;
                    }
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class SodaDrawer extends StatelessWidget {
  const SodaDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}

class SodaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SodaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.share, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
