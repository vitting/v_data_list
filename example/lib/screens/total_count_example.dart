import 'package:example/generate_fake_data_helper.dart';
import 'package:flutter/material.dart';
import 'package:v_data_list/components.dart';
import 'package:v_data_list/enums.dart';

class TotalCountExample extends StatefulWidget {
  static const routeName = '/total-count-example';
  const TotalCountExample({super.key});

  @override
  State<TotalCountExample> createState() => _TotalCountExampleState();
}

class _TotalCountExampleState extends State<TotalCountExample> {
  final int _totalItems = 20;

  bool _positionTop = true;
  bool _pinned = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Total counter example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Total counter position top'),
                Switch(
                  value: _positionTop,
                  onChanged: (value) {
                    setState(() {
                      _positionTop = value;
                    });
                  },
                ),
                Text('Total counter position pinned'),
                Switch(
                  value: _pinned,
                  onChanged: (value) {
                    setState(() {
                      _pinned = value;
                    });
                  },
                ),
              ],
            ),
            Text('Total Counter builder example 1', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                data: GenerateFakeDataHelper.generateData(_totalItems, columnDefs.keys.toList()),
                config: VDataListConfig().copyWith(
                  showTotalCountPinned: _pinned,
                  totalItemsPosition: _positionTop ? TotalCountPosition.top : TotalCountPosition.bottom,
                ),
                totalItems: _totalItems,
                totalCountBuilder: (context, config, total, theme) {
                  return VDataListTotalCount(
                    config: config,
                    // When defining container, you override the default container.
                    container: Material(
                      child: Text(' Total items: $total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Total Counter builder example 2', style: TextStyle(fontSize: 20)),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                data: GenerateFakeDataHelper.generateData(_totalItems, columnDefs.keys.toList()),
                config: VDataListConfig().copyWith(
                  showTotalCountPinned: _pinned,
                  totalItemsPosition: _positionTop ? TotalCountPosition.top : TotalCountPosition.bottom,
                ),
                totalItems: _totalItems,
                totalCountBuilder: (context, config, total, theme) {
                  return VDataListTotalCount(
                    config: config,
                    // When defining child, you set the content in the default container.
                    child: Text(
                      ' Total items: $total',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
