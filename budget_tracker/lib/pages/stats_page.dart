import 'package:budget_tracker/data/day_month.dart';
import 'package:budget_tracker/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int? activeMonth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    final size = MediaQuery.of(context).size;
    // final bool activity
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 19,
                  blurRadius: 3),
            ]),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 60, left: 20, bottom: 25, right: 29),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Stats",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: black)),
                      Icon(Ionicons.search)
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      months.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeMonth = index;
                            });
                            activeMonth;
                          },
                          child: Container(
                            width: (size.width - 40) / 7,
                            child: Column(
                              children: [
                                Text(
                                  months[index]['label'],
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: activeMonth == index
                                        ? primary
                                        : Colors.transparent,
                                    // shape: BoxShape.circle,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: activeMonth == index
                                          ? primary
                                          : black.withOpacity(0.1),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 7, bottom: 7, right: 12, left: 12),
                                    child: Text(
                                      months[index]['day'],
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: activeMonth == index
                                              ? white
                                              : black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
