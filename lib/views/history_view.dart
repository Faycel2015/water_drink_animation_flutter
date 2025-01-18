import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HistoryView extends StatelessWidget {
  const HistoryView({super.key, required this.seriesList});

  final List<charts.Series<dynamic, DateTime>> seriesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: seriesList.isEmpty
          ? Center(child: Text('No data available.'))
          : charts.TimeSeriesChart(
              seriesList,
              animate: true,
            ),
    );
  }
}
