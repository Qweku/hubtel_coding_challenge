import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HistoryCardWidget extends StatelessWidget {
  final String time, name, phone, amount, image,category,comment;
  final bool status;
  const HistoryCardWidget({
    super.key,
    required this.theme,
    required this.time,
    required this.name,
    required this.phone,
    required this.amount,
    required this.image,
    required this.status, required this.category, required this.comment,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
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
            leading: CircleAvatar(
              radius: 3.h,
              backgroundColor: theme.colorScheme.tertiary,
              backgroundImage: AssetImage(image),
            ),
            title: Text(name),
            subtitle: Text(
              phone,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: theme.colorScheme.tertiary),
            ),
            trailing: SizedBox(
              width: 20.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      padding: EdgeInsets.all(1.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: status
                              ? Colors.green.shade100
                              : Colors.red.shade100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(status ? Icons.check_circle : Icons.cancel,
                              color: status
                                  ? Colors.green.shade800
                                  : Colors.red.shade800,
                              size: 2.h),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            status?"Successful":"Failed",
                            style: TextStyle(
                                fontSize: 1.2.h,
                                color: status
                                    ? Colors.green.shade800
                                    : Colors.red.shade800),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "GHS $amount",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: theme.colorScheme.tertiary,
          ),

          //Transaction category and comment
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: Colors.purple.shade200,
              child: Icon(Icons.person, color: Colors.purple.shade800),
            ),
            title: Row(
              children: [
                Text(category,style: theme.textTheme.bodySmall,),
               Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 2.w),
                  child: Icon(Icons.circle,color:theme.colorScheme.tertiary,size: 1.h,),
                ),
                Text(comment,style: theme.textTheme.bodySmall,),
              ],
            ),
            trailing: status?Icon(Icons.star,size:5.h,color:Colors.amber):Text(""),

          )
        
        ],
      ),
    );
  }
}
