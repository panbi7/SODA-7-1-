//import 'package:flutter/foundation.dart';
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
  late PageController _pageViewController; // PageView의 스크롤 동작을 제어하는 컨트롤러
  late TabController _tabController; // 페이지 전환 시 탭 상태를 관리하는 컨트롤러
  int _currentPageIndex = 0; // 현재 페이지 인덱스를 저장 - 초기 값

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(); // PageController 초기화
    _tabController = TabController(length: 3, vsync: this); // TabController 초기화
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose(); // 리소스 정리
    _tabController.dispose(); // 리소스 정리
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: _pageViewController, // 페이지를 제어하는 컨트롤러
            onPageChanged: _handlePageViewChanged, // 페이지 변경 시 호출되는 콜백
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
                child: Image.asset('assets/images/SODA(2).png', fit: BoxFit.contain,), // 두 번째 페이지
              ),
              Center(
                child: Image.asset('assets/images/SODA(3).png', fit: BoxFit.contain,), // 세 번째 페이지
              ),
            ],
          ),
          PageIndicator(
            // 하단에 페이지를 표시하는 인디케이터
            tabController: _tabController, // 탭 상태를 관리하는 컨트롤러
            currentPageIndex: _currentPageIndex, // 현재 페이지 인덱스
            onUpdateCurrentPageIndex:
                _updateCurrentPageIndex, // 페이지 변경 요청 시 호출되는 콜백
            //isOnDesktopAndWeb: _isOnDesktopAndWeb, // 데스크톱/웹 여부에 따라 인디케이터 활성화
          ),
        ],
      ),
    );
  }

  // PageView 페이지 변경 시 호출되는 메서드
  void _handlePageViewChanged(int currentPageIndex) {
    // if (!_isOnDesktopAndWeb) {
    //   return;
    // }
    _tabController.index = currentPageIndex; // TabController의 상태 업데이트
    setState(() {
      _currentPageIndex = currentPageIndex; // 현재 페이지 인덱스 업데이트
    });
  }

  // 인디케이터를 통해 페이지를 변경할 때 호출
  void _updateCurrentPageIndex(int index) {
    _tabController.index = index; // TabController 상태 업데이트
    _pageViewController.animateToPage(
      index, // 선택된 페이지로 이동
      duration: const Duration(milliseconds: 400), // 애니메이션 지속 시간
      curve: Curves.easeInOut, // 애니메이션 곡선
    );
  }

  // 현재 플랫폼이 데스크톱/웹인지 확인
  // bool get _isOnDesktopAndWeb {
  //   if (kIsWeb) {
  //     return true;
  //   }
  //   switch (defaultTargetPlatform) {
  //     case TargetPlatform.macOS:
  //     case TargetPlatform.linux:
  //     case TargetPlatform.windows:
  //       return true;
  //     case TargetPlatform.android:
  //     case TargetPlatform.iOS:
  //     case TargetPlatform.fuchsia:
  //       return false;
  //   }
  // }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    // required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  // final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    // if (!isOnDesktopAndWeb) {
    //   return const SizedBox.shrink();
    // }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // IconButton(
          //   splashRadius: 16.0,
          //   padding: EdgeInsets.zero,
          //   onPressed: () {
          //     if (currentPageIndex == 0) {
          //       return;
          //     }
          //     onUpdateCurrentPageIndex(currentPageIndex - 1);
          //   },
          //   icon: const Icon(
          //     Icons.arrow_left_rounded,
          //     size: 32.0,
          //   ),
          // ),
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
          // IconButton(
          //   splashRadius: 16.0,
          //   padding: EdgeInsets.zero,
          //   onPressed: () {
          //     if (currentPageIndex == 2) {
          //       return;
          //     }
          //     onUpdateCurrentPageIndex(currentPageIndex + 1);
          //   },
          //   icon: const Icon(
          //     Icons.arrow_right_rounded,
          //     size: 32.0,
          //   ),
          // ),
        ],
      ),
    );
  }
}