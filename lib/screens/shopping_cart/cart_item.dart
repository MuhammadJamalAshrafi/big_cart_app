import 'package:big_cart_app/models/product.dart';
import 'package:big_cart_app/providers/cart_provider.dart';
import 'package:big_cart_app/utils/styles/color.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: true);

    return Container(
        height: 600,
        child: ListView.separated(
          itemCount: cartProvider.getProductList.length,
          itemBuilder: ((context, index) {
            Product product = cartProvider.getProductList[index];
            return Padding(
              padding: const EdgeInsets.only(left: 17, right: 17),
              child: Slidable(
                key: ValueKey(index),
                endActionPane: ActionPane(
                  dismissible: DismissiblePane(
                    onDismissed: () {},
                  ),
                  motion: const DrawerMotion(),
                  extentRatio: 0.150,
                  children: [
                    SlidableAction(
                      spacing: 5,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      onPressed: (_) {},
                    ),
                  ],
                ),
                child: Container(
                    color: Colors.white,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 14, left: 15, right: 19.17, bottom: 14),
                      child: Row(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                    color: Color(product.color != null
                                            ? int.parse(
                                                '0xFF' +
                                                    product.color
                                                        .toString()
                                                        .substring(1),
                                              )
                                            : 0xFFFFFF)
                                        .withOpacity(0.3),
                                    shape: BoxShape.circle),
                              ),
                              Positioned(
                                  top: 15.82,
                                  width: 70,
                                  height: 55,
                                  child: product.image != null
                                      ? Image.network(
                                          product.image.toString(),
                                        )
                                      : Image.asset("assets/images/error.png"))
                            ],
                          ),
                          const SizedBox(width: 22),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "\$" +
                                        product.price.toString() +
                                        "x " +
                                        product.qty.toString(),
                                    style: paragraph6.copyWith(
                                        color: appGreenColor)),
                                Text(product.title ?? "",
                                    style: paragraph5.copyWith(fontSize: 16)),
                                Text(product.unit ?? "",
                                    style: paragraph2.copyWith(fontSize: 12))
                              ],
                            ),
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    cartProvider
                                        .increamentProductQty(product.id ?? 0);
                                  },
                                  child: const Icon(Icons.add,
                                      color: appGreenColor)),
                              Text(
                                  cartProvider
                                      .productQty(product.id ?? 0)
                                      .toString(),
                                  style: paragraph4),
                              GestureDetector(
                                onTap: () {
                                  cartProvider
                                      .decreamentProductQty(product.id ?? 0);
                                },
                                child: const Icon(Icons.remove,
                                    color: appGreenColor),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            );
          }),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 11);
          },
        ));
  }
}
