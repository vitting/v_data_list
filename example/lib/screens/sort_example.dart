import 'package:example/generate_fake_data_helper.dart';
import 'package:flutter/material.dart';
import 'package:v_data_list/components.dart';
import 'package:v_data_list/enums.dart';
import 'package:v_data_list/type_definitions.dart';

class SortExample extends StatefulWidget {
  static const String routeName = '/sort-example';
  const SortExample({super.key});

  @override
  State<SortExample> createState() => _SortExampleState();
}

class _SortExampleState extends State<SortExample> {
  late VDataListDataRowList _data;

  @override
  void initState() {
    super.initState();
    _data = GenerateFakeDataHelper.generateData(100, columnDefsWithColumnsThatArentResizable.keys.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sort example')),
      body: Column(
        children: [
          Expanded(
            child: VDataList(
              columnDefinitions: columnDefs,
              totalItems: 100,
              config: VDataListConfig().copyWith(showSortIconsInHeader: true),
              data: _data,
              onSortChanged: (columnId, sortState, updatedColumnDefinitions) {
                setState(() {
                  // Update the sort state in the column definitions
                  _data.sort((a, b) {
                    final aValue = a[columnId]!.value;
                    final bValue = b[columnId]!.value;
                    return sortState == ColumnSortState.ascending ? aValue.compareTo(bValue) : bValue.compareTo(aValue);
                  });
                });
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Center(child: Text('Column sorted: $columnId, sortState: $sortState'))));
              },
            ),
          ),
        ],
      ),
    );
  }
}
