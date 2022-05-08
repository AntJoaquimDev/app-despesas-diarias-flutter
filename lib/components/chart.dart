import 'package:flutter/material.dart';
import '../models/tansaction.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  // ignore: prefer_const_constructors_in_immutables
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var day = DateFormat.E('PT_BR').format(weekDay)[0].toUpperCase();
      //var day2 = DateFormat.E('PT_BR').format(weekDay).toUpperCase();
      double totalSum = 0.00;

      // for (var trans in recentTransaction) {
      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;
        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      return {
        'day': day,
        // 'day2': day2,
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (somaAccumulator, trItem) {
      return somaAccumulator + (trItem['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            // return Text('${tr['day']} : ${tr['value']}');
            double valor = (tr['value'] as double);

            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr['day'].toString(),
                value: (tr['value'] as double),
                percentage: _weekTotalValue == 0 ? 0 : valor / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
