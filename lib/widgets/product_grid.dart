import '../providers/products.dart';
import 'package:flutter/material.dart';
import './product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavs;
  ProductGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final product = showFavs ? productData.favoriteItems : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: product.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: product[i],
        //create: (c) => product[i],
        child: ProductItem(
            // product[index].id,
            // product[index].title,
            // product[index].imageUrl,
            ),
      ),
    );
  }
}
