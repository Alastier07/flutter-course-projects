import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  Widget listTileNavigation(
      BuildContext context, String title, String routeName, Icon icon) {
    return ListTile(
      leading: icon,
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
          listTileNavigation(
            context,
            'Shop',
            '/',
            Icon(Icons.shop),
          ),
          Divider(),
          listTileNavigation(
            context,
            'Orders',
            OrdersScreen.routeName,
            Icon(Icons.payment),
          ),
          Divider(),
          listTileNavigation(
            context,
            'Manage Products',
            UserProductsScreen.routeName,
            Icon(Icons.edit),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.of(context).pushReplacementNamed(routeName);
              Provider.of<Auth>(context, listen: false).logout();
            },
          )
        ],
      ),
    );
  }
}
