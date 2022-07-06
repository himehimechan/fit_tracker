import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fit_tracker_eden_farm/modules/home/home.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final HomeController home;
  List<Color> gradientColors = [
    const Color(0xff2343e6),
    const Color(0xff49fd7b),
  ];

  HomeScreen(this.home, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
            () {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Statistik',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline6,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              lineChartSample2(context),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Riwayat',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline6,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              home.dataWeight.isEmpty ? Container()
                                  : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: home.dataWeight.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var dataView = home.dataWeight[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        elevation: 6.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20.0),
                                        ),
                                        child: SizedBox(
                                          height: 100.h,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceAround,
                                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Text(
                                                    "${dataView.weight
                                                        .toString()} KG",
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .headline4,
                                                  ),
                                                  Text(
                                                    dataView.date,
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {

                                                    },
                                                    child: const Icon(
                                                      Icons.edit,
                                                      size: 20,
                                                      //color: Color(0xff05293d),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape: CircleBorder(),
                                                      elevation: 0,
                                                    ),
                                                  ),
                                                  OutlinedButton(
                                                    onPressed: () {

                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .delete_forever_rounded,
                                                      size: 22,
                                                    ),
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      primary: Colors.grey,
                                                      shape: CircleBorder(),
                                                      elevation: 0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              );
            });
  }

  Widget lineChartSample2(context){
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Theme.of(context).primaryColor),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'avg',
              style: TextStyle(
                  fontSize: 12,
                  color:
                  true ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.white,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.white,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '78';
              case 3:
                return '74';
              case 5:
                return '65';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: Colors.white,
            width: 2,
          )),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
            gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}