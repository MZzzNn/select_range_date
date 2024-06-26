# Select Range Date

Select Range Date is a Flutter package that allows users to select a range of dates. It provides a user-friendly interface and easy-to-use methods to get the selected dates.

## Features

- Select a range of dates.
- Get the selected dates easily.
- Customize the appearance of the date picker.

## Getting Started

### Prerequisites

- Dart SDK: '>=3.3.2 <4.0.0'
- Flutter SDK: '>=1.17.0'

### Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  select_range_date: ^0.0.1
```

### Usage

```dart
import 'package:flutter/material.dart';
import 'package:select_range_date/select_range_date.dart';

void main() {
  runApp(MyApp());
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
              SelectRangeDate.show(
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
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
