
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zenfit/UI/graphs/intermediate_measurement.dart';

import '../../Service/Database.dart';
import '../../main.dart';

class MeasurementGraph extends StatelessWidget {
  final String field;
  const MeasurementGraph({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LineChartWidget(field: field,),
    );
  }
}


class LineChartWidget extends StatelessWidget {
  final String field;
  const LineChartWidget({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const Intermediate_measurement()));
        }, icon: const Icon(Icons.arrow_back),color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(field,style: TextStyle(color: Colors.white54),),
      ),
      body: Container(
        height: mq.height * .75,
        width: mq.width* 1,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("bodymeasurement")
                .doc(DatabaseService.me.id)
                .collection(field)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              // Process data and create chart data
              List<Map<String, dynamic>> chartData = [];
              snapshot.data!.docs.asMap().forEach((index, doc) {
                // Assuming each document contains a single field named "value"
                dynamic yValue = doc["data"];
                chartData.add({"x": (index), "y": yValue});
              });

              // Pass chart data to YourChartWidget
              return YourChartWidget(chartData);
            },
          ),
        ),
      ),
    );
  }
}

// Your custom chart widget


class YourChartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> chartData;

  YourChartWidget(this.chartData);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(color: Colors.blueGrey);

          },
          getDrawingHorizontalLine: (value) {
            return FlLine(color: Colors.blueGrey);
          },
        ),
        minX: 0,
        maxX: 50,
        minY: 0,
        maxY: 60,
        lineBarsData: [
          LineChartBarData(
            spots: _convertDataToSpots(chartData),
            isCurved: true,
            color: Colors.blue,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: false),
            dotData: FlDotData(show: false)
          ),
        ],
        titlesData: const FlTitlesData(
            show: true,

            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false),drawBelowEverything: true,axisNameSize: 44,axisNameWidget: Text("Time(day from the beginning)",style: TextStyle(color: Colors.white),)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false),drawBelowEverything: true,axisNameSize: 44,axisNameWidget: Text("Measurement(cm)",style: TextStyle(color: Colors.white),))
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: Colors.blueGrey,
            width: 1,
          ),
        ),

      ),
    );
  }


  List<FlSpot> _convertDataToSpots(List<Map<String, dynamic>> data) {
    List<FlSpot> spots = [];
    for (int i = 0; i < data.length; i++) {
      spots.add(FlSpot(i.toDouble(), data[i]["y"].toDouble()));
    }
    return spots;
  }

  double _calculateMaxY(List<Map<String, dynamic>> data) {
    double maxY = 0;
    for (var entry in data) {
      if (entry["y"] > maxY) {
        maxY = entry["y"].toDouble();
      }
    }
    return maxY;
  }
}
