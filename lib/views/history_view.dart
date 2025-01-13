import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HistoryView extends StatelessWidget {
  const HistoryView({super.key, required this.seriesList}); // Add this line

  final List<charts.Series<dynamic, DateTime>> seriesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: charts.TimeSeriesChart(
        seriesList,
        animate: true,
      ),
    );
  }
}
