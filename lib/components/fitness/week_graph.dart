import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CreateGraphWeek extends StatelessWidget {

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tues';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thurs';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
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
        showTitles: true,
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
          toY: 8,
        )
      ],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(
          color: Colors.redAccent,
          toY: 20,
        )
      ],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(
          color: Colors.redAccent,
          toY: 14,
        )
      ],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(
          color: Colors.redAccent,
          toY: 15,
        )
      ],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(
          color: Colors.redAccent,
          toY: 13,
        )
      ],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
          color: Colors.redAccent,
          toY: 10,
        )
      ],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(
          color: Colors.redAccent,
          toY: 16,
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
          "Steps on Average",
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
