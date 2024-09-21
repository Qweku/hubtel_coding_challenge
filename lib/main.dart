import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/tab_indicator.dart';
import 'package:hubtel_coding_challenge/theme/light_mode.dart';
import 'package:hubtel_coding_challenge/views/history_tab.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, deviceType, orientation) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Send Money',
        theme: lightMode,
        home: const MyHomePage(),
      );
    });
  }
}

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
                 
                  labelStyle:theme.textTheme.labelLarge!
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
                height:5.h,
                color: theme.colorScheme.primary,
              ),
              Expanded(
                child: TabBarView(
                  children: [HistoryTab(), Container()],
                ),
              ),
            ],
          )),
    );
  }
}
