import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HistoryView extends StatelessWidget {
  final List<charts.Series<dynamic, DateTime>> seriesList;

  HistoryView(this.seriesList);

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
