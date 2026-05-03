import 'package:example/generate_fake_data_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:v_data_list/components.dart';
import 'package:v_data_list/theme.dart';

@Preview(name: 'Basic Data Table')
Widget basicDataTable() {
  return MaterialApp(
    theme: ThemeData(extensions: [VDataListTheme.defaultTheme]),
    home: VDataList(
      columnDefinitions: columnDefWithAllColumnsResizable,
      data: GenerateFakeDataHelper.generateData(20, columnDefWithAllColumnsResizable.keys.toList()),
      totalItems: 20,
      config: VDataListConfig(),
      onRowTap: (rowData, column) {
        debugPrint(column.toString());
      },
    ),
  );
}
