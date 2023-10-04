import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CreateDayGraph extends StatelessWidget {

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = 'Today';
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  /*
  LinearGradient get _barsGradient => LinearGradient(
    colors: [
      Colors.blue
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
   */
  //Looks better without gradient so I removed it from the graph

  Widget leftTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else {
      text = '${value.toInt()}k';
    }
    return SideTitleWidget(
      angle: 0,
      axisSide: meta.axisSide,
      space: 4,
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }

  FlTitlesData get weekData=> FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
        reservedSize: 30,
        getTitlesWidget: getTitles,
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        getTitlesWidget: leftTitles,
        interval: 5,
        reservedSize: 42,
      ),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
  );

  BarTouchData get barTouchData => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      tooltipBgColor: Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: 8,
      getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
          ) {
        return BarTooltipItem(
          rod.toY.round().toString(),
          const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    ),
  );

  FlBorderData get borderData => FlBorderData(
    show: false,
  );

  List<BarChartGroupData> get barGroups => [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          color: Colors.redAccent,
          toY: 10.5,
        )
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          "10,538",
          style: TextStyle(
            fontSize: 72,
          ),
        ),
        const Text(
          "Steps Today",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        AspectRatio(
          aspectRatio: 1.6,
          child: BarChart(
            BarChartData(
              barTouchData: barTouchData,
              titlesData: weekData,
              borderData: borderData,
              barGroups: barGroups,
              gridData: const FlGridData(show: false),
              alignment: BarChartAlignment.spaceAround,
              maxY: 20,
            ),

          ),
        ),
      ],
    );
  }

}
