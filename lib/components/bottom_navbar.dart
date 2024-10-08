import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> btns = [
      {
        "label": "Home",
        "icon": "assets/images/home.svg",
      },
      {
        "label": "Send",
        "icon": "assets/images/send.svg",
      },
      {
        "label": "History",
        "icon": "assets/images/history.svg",
      },
      {
        "label": "Scheduled",
        "icon": "assets/images/Schedule.svg",
      },
    ];
    var theme = Theme.of(context);
    return Container(
      height: 12.h,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: theme.colorScheme.primary))),
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
      child: Row(
        children: List.generate(btns.length, (index) {
          return Expanded(
              child: index == 0
                  ? Row(
                      children: [
                        CircleAvatar(
                          radius: 7.w,
                          backgroundColor:
                              const Color.fromARGB(225, 204, 243, 239),
                          child: SvgPicture.asset(btns[index]["icon"]!,height: 4.5.h,),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 1.h),
                          child: VerticalDivider(
                            color: theme.colorScheme.primary,
                            width: 7.w,
                          ),
                        )
                      ],
                    )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          btns[index]["icon"]!,
                          height: 4.5.h,
                        ),
                        SizedBox(height: 1.h,),
                        Text(
                          btns[index]["label"]!,textAlign: TextAlign.center,
                          style: index == 2
                              ? TextStyle(
                                  fontSize: 1.6.h,fontWeight: FontWeight.bold,
                                  fontFamily: "NunitoSans-ExtraBold")
                              : TextStyle(
                                  fontSize: 1.6.h,
                                  color: theme.colorScheme.tertiary),
                        )
                      ],
                    ));
        }),
      ),
    );
  }
}
