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
              Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {

                  },
                );
              }),
              Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.share, color: Colors.white),
                  onPressed: () {
                    
                  },
                );
              }),
              Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    
                  },
                );
              }),
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
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.0,
                          color: Colors.grey,
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.airplay_outlined),
                        title: Text(
                          'This is List tile',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text('List tile 1'),
                        dense: true,
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.0,
                          color: Colors.grey,
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.airplay_outlined),
                        title: Text(
                          'This is List tile',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text('List tile 2'),
                        dense: true,
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.0,
                          color: Colors.grey,
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.airplay_outlined),
                        title: Text(
                          'This is List tile',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text('List tile 3'),
                        dense: true,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(onPressed: () {
                        
                        }, child: Text('TEXT BUTTON', style: TextStyle(color: Color(0xFF182949),))),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Builder(
                            builder: (context) {
                              return IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 56, 117, 232),
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Settings Button!!!!!'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.settings, color: Color(0xFFFFFFFF),),
                              );
                            }
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFFFFE8E8),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Outlined Button!!!!!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Text('Outlined Button'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('FloatingAction Button!!!!!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            foregroundColor: Color(0xFFFFFFFF),
            backgroundColor: Color(0xFF182949),
            shape: CircleBorder(),
            child: Icon(Icons.add),
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
        ));
  }
}
