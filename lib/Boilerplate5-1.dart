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
      home: PageViewSODA(),
    );
  }
}

class PageViewSODA extends StatefulWidget {
  const PageViewSODA({super.key});

  @override
  State<PageViewSODA> createState() => _PageViewSODAState();
}

class _PageViewSODAState extends State<PageViewSODA>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PageView(
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 267.0,),
                      Image.asset(
                        'assets/images/SODA(1).png', fit: BoxFit.contain,
                      ),
                      SizedBox(height: 36.0,),
                      Text('Copyright 2023 SODA.  All rights reserved.', style: TextStyle(fontWeight: FontWeight.w500, ),),
                    ],
                  ), 
                ),
                Center(
                  child: Image.asset('assets/images/SODA(2).png', fit: BoxFit.contain,),
                ),
                Center(
                  child: Image.asset('assets/images/SODA(3).png', fit: BoxFit.contain,),
                ),
              ],
            ),
            PageIndicator(
              tabController: _tabController,
              currentPageIndex: _currentPageIndex,
              onUpdateCurrentPageIndex:
                  _updateCurrentPageIndex,
            ),
          ],
        ),
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabPageSelector(
                controller: tabController,
                color: Color(0xFFD8D8D8),
                selectedColor: Color(0xFF182949),
                indicatorSize: 6.0,
              ),
              SizedBox(height: 26.0,),
            ],
          ),
        ],
      ),
    );
  }
}