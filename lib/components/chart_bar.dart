// ignore_for_file: avoid_print

import 'dart:math';

import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/tansaction.dart';

class ChartBar extends StatefulWidget {
  final String label;
  final double value;
  final double percentage;
  // final List<Transaction> tansactionDay;

  ChartBar({
    required this.label,
    required this.value,
    required this.percentage,
    //required this.tansactionDay,
  });

  @override
  State<ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text('R\$${widget.value.toStringAsFixed(2)}'),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: widget.percentage,
                    child: InkWell(
                      onTap: () {
                        print('transações do dia');
                      },
                      child: Container(
                        //child: Text(percentage.toString()),

                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            //color: _backgroundColor,
                            borderRadius: BorderRadius.circular(4)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(widget.label),
              ),
            ),
          ],
        );
      },
    );
  }
}
