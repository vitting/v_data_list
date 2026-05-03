# VDataList

A Flutter web application demonstrating a dynamic data list component with resizable columns, pagination, and various interactive features.

## Features

- **Resizable columns**: Drag column borders to adjust width
- **Dynamic data**: Support for different data types and configurations
- **Pagination**: Built-in pagination support
- **Lazy loading**: Efficient loading for large datasets
- **Interactive rows**: Click and long-press interactions
- **Custom styling**: Flexible Theming and cell styling
- **Responsive design**: Optimized for web browsers

## Getting Started

1. Clone this repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run -d web` to start the example web application

## Usage

### Basic Example

The core component is `VDataList` which accepts:

#### ColumnDefinition

First define the structure of your data which is done by defining a list of columnDefinitions

```dart
final ColumnDefinitionMap columnDefinitions = {
  'id': ColumnDefinition(id: 'id', label: 'ID'),
  'name': ColumnDefinition(id: 'name', label: 'Name'),
  'email': ColumnDefinition(id: 'email', label: 'Email'),
  'phone': ColumnDefinition(id: 'phone', label: 'Phone'),
  'street': ColumnDefinition(id: 'street', label: 'Street'),
  'city': ColumnDefinition(id: 'city', label: 'City'),
  'country': ColumnDefinition(id: 'country', label: 'Country'),
};
```

or you can use the `ColumnDefinitionHelper`. It creates the `ColumnDefinitionMap` from the id's in the ColumnDefinition

```dart
final ColumnDefinitionMap columnDefinitions = ColumnDefinitionHelper.generateColumnDefinitionMap([
  ColumnDefinition(id: 'id', label: 'ID'),
  ColumnDefinition(id: 'name', label: 'Name'),
  ColumnDefinition(id: 'email', label: 'Email'),
  ColumnDefinition(id: 'phone', label: 'Phone'),
  ColumnDefinition(id: 'street', label: 'Street'),
  ColumnDefinition(id: 'city', label: 'City'),
  ColumnDefinition(id: 'country', label: 'Country'),
]);
```

#### VDataListDataRowList

Then organize your data into a structure of `VDataListDataRowList`

```dart
final VDataListDataRowList data = [
  {
    'id': VDataListRowCellData(value: '1'),
    'name': VDataListRowCellData(value: 'John Doe'),
    'email': VDataListRowCellData(value: 'example@email.com'),
    'phone': VDataListRowCellData(value: '123-456-7890'),
    'street': VDataListRowCellData(value: '123 Main St'),
    'city': VDataListRowCellData(value: 'Any town'),
    'country': VDataListRowCellData(value: 'USA'),
  },
  {
    'id': VDataListRowCellData(value: '2'),
    'name': VDataListRowCellData(value: 'Jane Smith'),
    'email': VDataListRowCellData(value: 'another_email@example.com'),
    'phone': VDataListRowCellData(value: '987-654-3210'),
    'street': VDataListRowCellData(value: '456 Elm St'),
    'city': VDataListRowCellData(value: 'Other town'),
    'country': VDataListRowCellData(value: 'Canada'),
  },
];
```

or if you have data in a structure of List of lists then you can use `DataRowHelper.generateDataRowListFromListOfData`

```dart
final VDataListDataRowList data = DataRowHelper.generateDataRowListFromListOfData(columnDefinitions, [
  ['1', 'John Doe', 'example@email.com', '123-456-7890', '123 Main St', 'Any town', 'USA'],
  ['2', 'Jane Smith', 'another_email@example.com', '987-654-3210', '456 Elm St', 'Other town', 'Canada'],
]);
```

#### VDataList widget

```dart
VDataList(
    columnDefs: columnDefinitions,
    config: VDataListConfig(),
    data: data,
),
```

## Settings

### VDataList - Properties

The `VDataList` widget is the main component that renders a dynamic data list with resizable columns, pagination, and various interactive features.
<!-- markdownlint-disable -->
| Property                     | Type                                   | Required | Default | Description                                                                       |
| ---------------------------- | -------------------------------------- | -------- | ------- | --------------------------------------------------------------------------------- |
| `columnDefinitions`          | `ColumnDefinitionMap`                  | ✅        | -       | The column definitions for the list. Keys should match the keys in the data rows. |
| `config`                     | `VDataListConfig`                      | ✅        | -       | The configuration for the list including appearance and behavior settings.        |
| `data`                       | `VDataListDataRowList`                 | ❌        | `[]`    | The data to display in the list. Each DataRow represents a row of data.           |
| `totalItems`                 | `int`                                  | ✅        | -       | Total number of items to display in the total count widget.                       |
| `isLoading`                  | `bool`                                 | ❌        | `false` | Flag indicating whether the list is currently loading more data.                  |
| `footer`                     | `Widget?`                              | ❌        | `null`  | Optional widget to display as the footer of the list.                             |
| `footerBuilder`              | `VDataListFooterBuilder?`              | ❌        | `null`  | Optional custom builder for creating a custom footer widget.                      |
| `headerBuilder`              | `VDataListHeaderBuilder?`              | ❌        | `null`  | Optional custom header builder instead of the default header.                     |
| `noDataBuilder`              | `VDataListNoDataBuilder?`              | ❌        | `null`  | Optional custom builder for no data widget when there is no data to display.      |
| `onColumnDefsChanged`        | `VDataListonColumnDefsChanged?`        | ❌        | `null`  | Callback triggered when column definitions change.                                |
| `onLoadMore`                 | `VDataListOnLoadMore?`                 | ❌        | `null`  | Callback triggered when the user scrolls to the end of the list.                  |
| `onLongPressRow`             | `VDataListOnLongPressRow?`             | ❌        | `null`  | Callback triggered when a row is long pressed.                                    |
| `onLongPressRowCopyValue`    | `VDataListOnLongPressRowCopyValue?`    | ❌        | `null`  | Callback triggered when a row cell value is long pressed for copying.             |
| `onPaginationIndexChanged`   | `VDataListOnPaginationIndexChanged?`   | ❌        | `null`  | Callback triggered when the pagination index changes.                             |
| `onRowTap`                   | `VDataListOnRowTap?`                   | ❌        | `null`  | Callback triggered when a row is tapped.                                          |
| `onSortChanged`              | `VDataListOnSortChanged?`              | ❌        | `null`  | Callback triggered when sort state changes.                                       |
| `paginationCurrentPage`      | `int?`                                 | ❌        | `null`  | Current page index to display in pagination (zero-based).                         |
| `paginationItemsPerPage`     | `int?`                                 | ❌        | `null`  | Items per page to display in pagination widget.                                   |
| `resetWidthDialogBuilder`    | `VDataListResetWidthDialogBuilder?`    | ❌        | `null`  | Optional custom dialog builder for resetting column widths.                       |
| `resizeHandler`              | `Widget?`                              | ❌        | `null`  | Custom resize handler widget for column resizing.                                 |
| `rowBuilder`                 | `VDataListRowBuilder?`                 | ❌        | `null`  | Optional custom row builder instead of the default row widget.                    |
| `rowCellStyleBuilder`        | `VDataListRowCellStyleBuilder?`        | ❌        | `null`  | Cell style builder to override default cell style for specific cells.             |
| `totalCountBuilder`          | `VDataListTotalCountBuilder?`          | ❌        | `null`  | Optional custom total count builder widget.                                       |
| `loadMoreDataSpinnerBuilder` | `VDataListLoadMoreDataSpinnerBuilder?` | ❌        | `null`  | Optional custom loading spinner builder for when more data is being loaded.       |
| `paginationBuilder`          | `VDataListPaginationBuilder?`          | ❌        | `null`  | Optional custom pagination builder instead of the default pagination widget.      |
<!-- markdownlint-enable -->
#### Example

```dart
VDataList(
  columnDefinitions: columnDefinitions,
  config: VDataListConfig(),
  data: dataRows,
  totalItems: 150,
  onRowTap: (data, columnDefs) => print('Row tapped: $data'),
  onSortChanged: (columnId, sortState, columnDefs) {
    print('Sort changed: $columnId - $sortState');
  },
)
```

### ColumnDefinition - Properties

The `ColumnDefinition<T>` class defines the structure and behavior of a column
in the data list.

<!-- markdownlint-disable -->
| Property                 | Type                   | Required | Default                     | Description                                                                                                           |
| ------------------------ | ---------------------- | -------- | --------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| `id`                     | `String`               | ✅        | -                           | The unique identifier for the column. Used to match the column with the data in the rows.                             |
| `label`                  | `String`               | ✅        | -                           | The label of the column. Displayed in the column header and used to identify the column.                              |
| `width`                  | `double?`              | ❌        | `null`                      | The width of the column. If null, the column will auto-size based on its content.                                     |
| `isResizable`            | `bool`                 | ❌        | `true`                      | Whether the column is resizable. If true, the user can resize the column by dragging the edge of the column header.   |
| `sortState`              | `ColumnSortState`      | ❌        | `ColumnSortState.none`      | The current sort state of the column. Determines how to display the sort icon in the column header.                   |
| `rowCellIcon`            | `Widget?`              | ❌        | `null`                      | An optional icon to display in each cell of this column. Used to add visual cues to the cells.                        |
| `rowCellIconSpacing`     | `double`               | ❌        | `0`                         | The spacing between the icon and the cell content when `rowCellIcon` is provided.                                     |
| `columnSpacing`          | `double`               | ❌        | `0`                         | The spacing to the right of the column. Creates space between columns. The last column will not have spacing applied. |
| `rowCellIconPlacement`   | `RowCellIconPlacement` | ❌        | `RowCellIconPlacement.left` | The placement of the icon relative to the cell content when `rowCellIcon` is provided.                                |
| `type`                   | `T?`                   | ❌        | `null`                      | The type of the column, which can be used to determine how to render the cells in this column.                        |
| `resizableHandlerPinned` | `bool`                 | ❌        | `false`                     | Whether the resize handler of this column is pinned or not.                                                           |
<!-- markdownlint-enable -->
#### Enums

<!-- markdownlint-disable-next-line -->
**ColumnSortState**

- `none` - No sorting applied
- `ascending` - Sort in ascending order
- `descending` - Sort in descending order

<!-- markdownlint-disable-next-line -->
**RowCellIconPlacement**

- `left` - Icon placed to the left of cell content
- `right` - Icon placed to the right of cell content

<!-- markdownlint-disable-next-line -->
#### Example

```dart
ColumnDefinition(
  id: 'name',
  label: 'Full Name',
  width: 200.0,
  isResizable: true,
  sortState: ColumnSortState.none,
  rowCellIcon: Icon(Icons.person),
  rowCellIconSpacing: 8.0,
  columnSpacing: 16.0,
  rowCellIconPlacement: RowCellIconPlacement.left,
  type: String,
  resizableHandlerPinned: false,
)
```
