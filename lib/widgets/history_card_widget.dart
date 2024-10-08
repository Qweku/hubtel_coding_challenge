import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class HistoryCardWidget extends StatelessWidget {
  final String time, name, phone, amount, image, category, comment;
  final bool status;
  const HistoryCardWidget({
    super.key,
    required this.theme,
    required this.time,
    required this.name,
    required this.phone,
    required this.amount,
    required this.image,
    required this.status,
    required this.category,
    required this.comment,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.colorScheme.primary)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Transaction Time
          Text(
            time,
            style: theme.textTheme.bodyMedium!
                .copyWith(color: theme.colorScheme.tertiary),
          ),

          // Transaction Details
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(image),
            
            title: Row(

              children: [
                Expanded(child: Text(name)),
                Chip(
                    labelPadding: EdgeInsets.only(left: 1.w,right: 1.w),
                    elevation: 0,
                    side:BorderSide.none,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.h)),
                    avatar:  Icon(status ? Icons.check_circle : Icons.cancel,
                              
                              // change the color of the icon according to the status
                              color: status
                                  ? const Color.fromARGB(225,112, 224, 131)
                                  : const Color.fromARGB(225,153, 35, 29),
                              size: 2.h),
                    backgroundColor: status
                              ? const Color.fromARGB(225, 219, 247, 224)
                              : const Color.fromARGB(225,253, 176, 172),
                   
                    label:  Text(
                            status ? "Successful" : "Failed",
                            style: TextStyle(
                                fontSize: 1.4.h,
                                fontFamily: "NunitoSans-ExtraBold",
                                color: status
                                    ? const Color.fromARGB(225,112, 224, 131)
                                  : const Color.fromARGB(225,153, 35, 29)),
                          ),
                  ),
             

              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  phone,
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: theme.colorScheme.tertiary, fontSize: 14),
                ),
                Text(
                    "GHS $amount",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontFamily: "NunitoSans-ExtraBold"),
                  ),
              ],
            ),
          
          
          ),
          Divider(
            color: theme.colorScheme.primary,
          ),

          //Transaction category and comment
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset("assets/images/user_icon.svg",height: 5.h,),
            title: Row(
              children: [
                Text(
                  category,
                  style: theme.textTheme.bodyMedium,
                ),
                comment.isEmpty?Padding(
                  padding:  EdgeInsets.only(left:3.w),
                  child: SvgPicture.asset("assets/images/star.svg",height: 3.h,),
                ): Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Icon(
                    Icons.circle,
                    color: theme.colorScheme.tertiary,
                    size: 1.h,
                  ),
                ),
                Text(
                  comment,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            trailing: status && comment.isNotEmpty
                ? SvgPicture.asset("assets/images/star.svg",height: 3.h,)
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
