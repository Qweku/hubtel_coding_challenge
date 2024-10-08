import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hubtel_coding_challenge/components/my_textfield.dart';
import 'package:hubtel_coding_challenge/dummy_data.dart';
import 'package:hubtel_coding_challenge/model/history_model.dart';
import 'package:hubtel_coding_challenge/widgets/history_card_widget.dart';
import 'package:sizer/sizer.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  bool isLoading = true;
  List<HistoryData> historyList =
      historyData.map((data) => HistoryData.fromMap(data)).toList();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:3.w),
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
              SvgPicture.asset('assets/images/filter.svg', height: 6.h),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),

          // History list
          Expanded(
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.inversePrimary,
                    ),
                  )
                : ListView(
                    padding: EdgeInsets.only(top: 2.h),
                    physics: const BouncingScrollPhysics(),
                    children: List.generate(historyList.length, (index) {
                      // A list of the various transactions for each day
                      List<Transaction> transactionList = historyList[index].history;

                      // each day as a header
                      return Padding(
                        padding: EdgeInsets.only(bottom: 3.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 1.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: theme.colorScheme.primary),
                              child: Text(
                                historyList[index].date,
                                style: theme.textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "NunitoSans-ExtraBold",
                                    color: theme.colorScheme.tertiary),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),

                            // A list of each transaction
                            Column(
                                children:
                                    List.generate(transactionList.length, (index) {
                              return HistoryCardWidget(
                                theme: theme,
                                image: transactionList[index].image,
                                name: transactionList[index].name,
                                time: transactionList[index].time,
                                phone: transactionList[index].phone,
                                status: transactionList[index].status,
                                amount: transactionList[index].amount,
                                category: transactionList[index].category,
                                comment: transactionList[index].comment,
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
