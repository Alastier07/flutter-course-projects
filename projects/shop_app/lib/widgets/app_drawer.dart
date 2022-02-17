import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  Widget listTileNavigation(
      BuildContext context, String title, String routeName) {
    return ListTile(
      leading: Icon(Icons.shop),
      title: Text(title),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          listTileNavigation(context, 'Shop', '/'),
          Divider(),
          listTileNavigation(context, 'Orders', OrdersScreen.routeName),
          Divider(),
          listTileNavigation(
              context, 'Manage Products', UserProductsScreen.routeName),
        ],
      ),
    );
  }
}
