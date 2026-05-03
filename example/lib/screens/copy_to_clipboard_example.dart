import 'package:example/generate_fake_data_helper.dart';
import 'package:example/screens/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:v_data_list/components.dart';

class CopyToClipboardExample extends StatelessWidget {
  static const routeName = '/copy-to-clipboard-example';
  const CopyToClipboardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Copy to clipboard example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Long press on any cell to copy its value to clipboard. A snackbar will appear at the bottom of the screen showing the copied value.',
            ),
            SizedBox(height: 16),
            Expanded(
              child: VDataList(
                columnDefinitions: columnDefs,
                totalItems: 100,
                config: VDataListConfig().copyWith(longPressToCopyCellValueToClipboard: true),
                onLongPressRowCopyValue: (id, value, data, updatedColumnDefs) => CustomSnackbar.copySnackbar(context, value),
                data: GenerateFakeDataHelper.generateData(100, columnDefs.keys.toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
