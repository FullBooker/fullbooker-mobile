import 'package:flutter/material.dart';
import 'package:fullbooker/features/host/models/product.dart';
import 'package:fullbooker/shared/entities/table_header_test.dart';

class ActivitiesTableTable extends StatelessWidget {
  const ActivitiesTableTable({super.key, this.products = const <Product>[]});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        border: const TableBorder(
          top: BorderSide(color: Colors.black12),
          horizontalInside: BorderSide(color: Colors.black12),
          verticalInside: BorderSide(color: Colors.black12),
        ),
        columnSpacing: 10,
        horizontalMargin: 5,
        columns: const <DataColumn>[
          DataColumn(label: TableHeaderText('Tracking Number')),
          DataColumn(label: TableHeaderText('Product Name')),
          DataColumn(label: TableHeaderText('Price')),
          DataColumn(label: TableHeaderText('Status')),
          DataColumn(label: TableHeaderText('Next Actions')),
        ],
        rows: products.map((Product product) {
          return DataRow(
            cells: <DataCell>[
              DataCell(Text('#${product.number}', textAlign: TextAlign.center)),
              DataCell(Text(product.name, textAlign: TextAlign.center)),
              DataCell(
                Text(
                  product.pricing.isNotEmpty
                      ? 'KES ${product.pricing.first.cost}'
                      : '_',
                  textAlign: TextAlign.center,
                ),
              ),
              DataCell(
                Text(
                  product.active ? 'Active' : 'Disabled',
                  style: TextStyle(
                    color: product.active ? Colors.green : Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const DataCell(
                Text('Edit', style: TextStyle(color: Colors.orange)),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
