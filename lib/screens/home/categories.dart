import 'package:big_cart_app/controllers/category.dart';
import 'package:big_cart_app/models/category.dart';
import 'package:big_cart_app/utils/styles/text.dart';
import 'package:big_cart_app/utils/util.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);
  final CategoryController _categoryController = CategoryController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: 78,
      child: FutureBuilder<List<Category>>(
        future: _categoryController.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Util.getCategoryColor(
                                snapshot.data![index].id ?? 0),
                            borderRadius: BorderRadius.circular(100)),
                        child: Image.asset(
                            Util.getCategoryIcon(snapshot.data![index].id ?? 0),
                            width: 24.5,
                            height: 26.69),
                      ),
                      const SizedBox(height: 11),
                      Text(snapshot.data![index].title ?? "", style: paragraph7)
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 21);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
