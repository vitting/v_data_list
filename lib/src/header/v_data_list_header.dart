import 'package:flutter/material.dart';
import 'package:v_data_list/src/config/v_data_list_config.dart';
import 'package:v_data_list/src/enums/v_data_list_enums.dart';
import 'package:v_data_list/src/header/v_data_list_header_cell.dart';
import 'package:v_data_list/src/theme/v_data_list_theme.dart';
import 'package:v_data_list/src/type_definitions/v_data_list_type_definitions.dart';

class VDataListHeader extends StatelessWidget {
  final void Function(String columnId, double delta, double currentWidth)? onDragUpdate;
  final void Function(String columnId, ColumnSortState sortState)? onSortTap;
  final void Function(String columnId)? onDragHandlerLongPress;
  final ColumnDefinitionMap columnDefinitions;
  final Widget? resizeHandler;
  final VDataListConfig config;
  final HeaderTheme? headerTheme;

  const VDataListHeader({
    super.key,
    required this.config,
    this.onDragUpdate,
    this.columnDefinitions = const {},
    this.onSortTap,
    this.onDragHandlerLongPress,
    this.resizeHandler,
    this.headerTheme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = headerTheme ?? VDataListTheme.of(context).headerTheme;
    return PinnedHeaderSliver(
      child: Material(
        child: Container(
          padding: config.headerPadding,
          decoration: BoxDecoration(color: theme.backgroundColor, borderRadius: config.headerBorderRadius),
          child: Row(
            children: [
              ...columnDefinitions.entries.map((entry) {
                final columnDefinition = entry.value;
                return VDataListHeaderCell(
                  id: columnDefinition.id,
                  title: columnDefinition.label,
                  width: columnDefinition.width,
                  onDragUpdate: onDragUpdate,
                  isResizable: columnDefinition.isResizable,
                  onSortTap: onSortTap,
                  sortState: columnDefinition.sortState,
                  onDragHandlerLongPress: onDragHandlerLongPress,
                  resizeHandler: resizeHandler,
                  textStyle: theme.textStyle,
                  resizableHandlerPinned: columnDefinition.resizableHandlerPinned,
                  showSortIconsInHeader: config.showSortIconsInHeader,
                  sortIconAscending: config.sortIconAscending,
                  sortIconDescending: config.sortIconDescending,
                );
              }),
              if (config.showRowClickHandler)
                VDataListHeaderCell(
                  id: '_trigger_cell_vlist_2000',
                  title: '',
                  width: config.rowClickHandlerWidth,
                  isResizable: false,
                  showSortIconsInHeader: false,
                  resizableHandlerPinned: false,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
