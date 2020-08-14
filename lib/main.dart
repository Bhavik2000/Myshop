import './screens/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './screens/product_detail.dart';
import './screens/product_overview.dart';
import './providers/cart.dart';
import './screens/order_screen.dart';
import './providers/orders.dart';
import 'widgets/user_product.dart';
import './screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'Myshop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductsOverview(),
        routes: {
          ProductDetail.routeName: (ctx) => ProductDetail(),
          CartScreen.rountName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          UserProduct.routeName: (ctx) => UserProduct(),
          EditProduct.routeName: (ctx) => EditProduct(),
        },
      ),
    );
  }
}
