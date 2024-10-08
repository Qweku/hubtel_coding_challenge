import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/components/bottom_navbar.dart';
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
              padding: EdgeInsets.symmetric(horizontal: .5.w),
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(5)),
              child: TabBar(
                unselectedLabelStyle: theme.textTheme.labelLarge!
                    .copyWith(color: theme.colorScheme.tertiary),
                labelStyle: theme.textTheme.labelLarge!
                    .copyWith(fontFamily: "NunitoSans-ExtraBold"),
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
            const Expanded(
              child: TabBarView(
                children: [
                  // History Tab
                  HistoryTab(),
                  Center(child: Text("No Transaction Summary"))
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () async {},
          extendedPadding:
              EdgeInsets.symmetric( horizontal: 3.w),
          backgroundColor: const Color.fromARGB(255, 0, 200, 170),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
               Icon(
                Icons.add_circle,
                color: Colors.white,
                size: 5.5.h,
              ),
              SizedBox(
                width: 1.w,
              ),
              const Text(
                'SEND NEW',
                style: TextStyle(color: Colors.white,fontFamily: "NunitoSans-ExtraBold", fontSize: 14),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavbar()
      ),
    );
  }
}
