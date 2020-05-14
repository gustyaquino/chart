import 'package:flutter/material.dart';
import 'package:chart/models/LinearSale.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieChartWidget extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PieChartWidget(this.seriesList, this.animate);

  factory PieChartWidget.withSampleData() {
    return PieChartWidget(_createSampleData(), false);
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.ArcRendererConfig(
        arcRendererDecorators: [
          new charts.ArcLabelDecorator(
            labelPosition: charts.ArcLabelPosition.inside,
            insideLabelStyleSpec: new charts.TextStyleSpec(
              fontSize: 12,
              color: charts.Color.white,
            ),
          )
        ],
      ),
    );
  }

  static List<charts.Series<LinearSale, String>> _createSampleData() {
    final data = [
      new LinearSale(
        segment: "Label 1",
        size: 75,
        color: charts.MaterialPalette.red.shadeDefault,
      ),
      new LinearSale(
        segment: "Label 2",
        size: 25,
        color: charts.MaterialPalette.green.shadeDefault,
      ),
    ];

    return [
      new charts.Series<LinearSale, String>(
        id: "Sales",
        domainFn: (LinearSale segment, _) => segment.segment,
        measureFn: (LinearSale segment, _) => segment.size,
        //colorFn: (LinearSale segment, _) => segment.color,
        data: data,
        labelAccessorFn: (LinearSale row, _) => "${row.segment}\n${row.size}%",
      )
    ];
  }
}
