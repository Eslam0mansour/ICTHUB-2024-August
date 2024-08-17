import 'package:flutter/material.dart';
import 'package:new_8/data/data_source/products_data_source.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: ProductsDataSource.items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            tileColor: Colors.grey[200],
            leading: Image.network(
              ProductsDataSource.items[index].image,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            title: Text(
              ProductsDataSource.items[index].title,
              maxLines: 2,
            ),
            subtitle: Text(
              ProductsDataSource.items[index].description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              '${ProductsDataSource.items[index].price} \$',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}
