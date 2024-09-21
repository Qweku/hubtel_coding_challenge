import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/components/my_textfield.dart';
import 'package:hubtel_coding_challenge/dummy_data.dart';
import 'package:hubtel_coding_challenge/widgets/history_card_widget.dart';
import 'package:sizer/sizer.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [

              // The Search textfield
              Expanded(
                child: MyTextField(
                  hintText: 'Search',
                  obscureText: false,
                  controller: TextEditingController(),
                  color: theme.colorScheme.primary,
                  prefixIcon: Icon(Icons.search,
                      size: 4.h, color: theme.colorScheme.inversePrimary),
                ),
              ),
              SizedBox(
                width: 3.w,
              ),

              //Filter Icon
              Image.asset('assets/images/filter.png', height: 5.h),
            ],
          ),
          SizedBox(height: 2.h,),

          // History list
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 2.h),
              physics: const BouncingScrollPhysics(),
              children: List.generate(historyData.length, (index) {

                // A list of the various transactions for each day
                List historyList = historyData[index]['history'];

                // each day as a header
                return Padding(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: theme.colorScheme.primary),
                        child: Text(
                          historyData[index]['date'],
                          style: theme.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.tertiary),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),


                      // A list of each transaction
                      Column(
                          children: List.generate(historyList.length, (index) {
                        return                      

                        HistoryCardWidget(
                          theme: theme,
                          image: historyList[index]['image'],
                          name:historyList[index]['name'],
                          time: historyList[index]['time'],
                          phone:historyList[index]['phone'],
                          status: historyList[index]['status'],
                          amount: historyList[index]['amount'],
                          category: historyList[index]['category'],
                          comment: historyList[index]['comment'],
                        );
                      }))
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
