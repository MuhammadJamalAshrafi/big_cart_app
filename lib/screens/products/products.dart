import 'package:big_cart_app/controllers/product.dart';
import 'package:big_cart_app/models/product.dart';
import 'package:big_cart_app/providers/cart_provider.dart';
import 'package:big_cart_app/utils/assets.dart';
import 'package:big_cart_app/utils/styles/color.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  final int catId;
  Products({Key? key, required this.catId}) : super(key: key);
  final ProductController _productController = ProductController();

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: true);

    return Expanded(
      child: FutureBuilder<List<Product>>(
        future: _productController.getProductsByCategoryId(catId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data?.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 21, bottom: 29),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.83),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 9.88, bottom: 11),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(Assets.favoriteIcon),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 92,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 84.0,
                                  height: 84.0,
                                  decoration: BoxDecoration(
                                    color: Color(
                                            snapshot.data?[index].color != null
                                                ? int.parse('0xFF' +
                                                    snapshot.data![index].color
                                                        .toString()
                                                        .substring(1))
                                                : 0xFFFFFF)
                                        .withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Positioned(
                                  height: 75,
                                  width: 105,
                                  child: snapshot.data?[index].image != null
                                      ? Image.network(snapshot
                                              .data?[index].image
                                              .toString() ??
                                          "")
                                      : Image.asset(Assets.errorIcon),
                                  top: 22,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text("\$${snapshot.data?[index].price.toString()}",
                              style: paragraph6.copyWith(color: appGreenColor)),
                          const SizedBox(height: 1),
                          Text(snapshot.data?[index].title ?? "",
                              style: paragraph5.copyWith(fontSize: 15)),
                          const SizedBox(height: 1),
                          Text(snapshot.data?[index].unit ?? "",
                              style: paragraph6),
                          const SizedBox(height: 6),
                          const Divider(color: Color(0xFFEBEBEB)),
                          const SizedBox(height: 6),
                          if (cartProvider.isProductAdded(
                                  snapshot.data?[index].id ?? 0) ==
                              false)
                            GestureDetector(
                              onTap: () {
                                cartProvider.add(Product(
                                    id: snapshot.data?[index].id ?? 0,
                                    catId: snapshot.data?[index].catId ?? 0,
                                    title: snapshot.data?[index].title ?? "",
                                    unit: snapshot.data?[index].unit ?? "",
                                    stockAvailable:
                                        snapshot.data?[index].stockAvailable ??
                                            0,
                                    image: snapshot.data?[index].image ?? "",
                                    color: snapshot.data?[index].color ?? "",
                                    price: snapshot.data?[index].price ?? 0.0,
                                    qty: 1));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(Assets.addToCartIcon),
                                  const SizedBox(width: 9),
                                  Text("Add to Cart",
                                      style: paragraph6.copyWith(
                                          color: Colors.black))
                                ],
                              ),
                            ),
                          if (cartProvider.isProductAdded(
                                  snapshot.data?[index].id ?? 0) ==
                              true)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    cartProvider.increamentProductQty(
                                        snapshot.data?[index].id ?? 0);
                                  },
                                  child: const Icon(Icons.add,
                                      color: appGreenColor, size: 20),
                                ),
                                Text(
                                    cartProvider
                                        .productQty(
                                            snapshot.data?[index].id ?? 0)
                                        .toString(),
                                    style: paragraph6),
                                GestureDetector(
                                  onTap: () {
                                    cartProvider.decreamentProductQty(
                                        snapshot.data?[index].id ?? 0);
                                  },
                                  child: const Icon(Icons.remove,
                                      color: appGreenColor, size: 20),
                                )
                              ],
                            ),
                        ])),
                  );
                });
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(child: CircularProgressIndicator())),
            );
          }
        },
      ),
    );
  }
}
