import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/shoppingcart_provider.dart';

class MyCheckout extends StatelessWidget {
  const MyCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Consumer<ShoppingCart>(
        builder: (context, cart, child) {
          if (cart.cart.isEmpty) {
            return const Center(child: Text("No items to checkout"));
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.cart.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(cart.cart[index].name),
                        subtitle: Text("Price: ${cart.cart[index].price}"),
                      );
                    },
                  ),
                ),
                Text("Total: ${cart.cartTotal}"),
                ElevatedButton(
                  onPressed: () {
                    cart.removeAll();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Payment Successful"),
                      duration: Duration(seconds: 1, milliseconds: 100),
                    ));
                  },
                  child: const Text("Pay Now"),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
