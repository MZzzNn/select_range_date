import 'package:flutter/material.dart';
import 'package:select_range_date/select_range_date.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  final DateTime startDate = DateTime.now().subtract(const Duration(days: 7));
  final DateTime endDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Select Range Date Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              SelectDateFromTo.show(
                startDate: startDate,
                endDate: endDate,
                onApplyClick: (DateTime startDate, DateTime endDate) {
                  print('Start Date: $startDate');
                  print('End Date: $endDate');
                },
              );
            },
            child: const Text('Select Range Date'),
          ),
        ),
      ),
    );
  }}