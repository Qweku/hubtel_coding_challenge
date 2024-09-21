import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/tab_indicator.dart';
import 'package:hubtel_coding_challenge/views/history_tab.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(3.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(5)),
              child: TabBar(
                unselectedLabelStyle: theme.textTheme.labelLarge!
                    .copyWith(color: Colors.grey.shade500),
                labelStyle: theme.textTheme.labelLarge!
                    .copyWith(fontWeight: FontWeight.bold),
                dividerHeight: 0,
                labelColor: Colors.black,
                indicator: CustomTabIndicator(),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: "History"),
                  Tab(text: "Transaction Summary"),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Divider(
              height: 5.h,
              color: theme.colorScheme.primary,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // History Tab
                  const HistoryTab(),
                  Container(
                    child: const Center(child: Text("No Transaction Summary")),
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {},
          extendedPadding:
              EdgeInsets.symmetric(vertical: .15.h, horizontal: 3.w),
          backgroundColor: const Color.fromARGB(255, 0, 200, 170),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              SizedBox(
                width: 1.w,
              ),
              const Text(
                'SEND NEW',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, color: Colors.black),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_screen_share, color: Colors.black),
                label: "Send"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt, color: Colors.black),
                label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_rounded, color: Colors.black),
                label: "Schedule")
          ],
        ),
      ),
    );
  }
}
