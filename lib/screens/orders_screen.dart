import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders-screen';

//   @override
//   State<OrdersScreen> createState() => _OrdersScreenState();
// }

// class _OrdersScreenState extends State<OrdersScreen> {
  // Future _ordersFuture;

  // Future _obtainOrderFuture() {
  //   return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _ordersFuture = _obtainOrderFuture();
  //   super.initState();
  // }

  // var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    print('building orders');
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Orders',
        ),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              //... error message
              return Center(
                child: Text('An error occured!'),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
