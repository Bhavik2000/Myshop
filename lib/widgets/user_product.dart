import '../screens/edit_product.dart';
import 'app_drawer.dart';
import 'user_product_item.dart';
import '../providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProduct extends StatelessWidget {
  static const routeName = '/use-products';
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context).fetchAndSetProduct();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your products!'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProduct.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (_, i) => Column(
              children: <Widget>[
                UserProductItem(
                  productData.items[i].id,
                  productData.items[i].imageUrl,
                  productData.items[i].title,
                ),
                Divider(),
              ],
            ),
            itemCount: productData.items.length,
          ),
        ),
      ),
    );
  }
}
