import 'package:bloc_app/screens/home/models/home_product_data.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(productDataModel.imageUrl),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 20),
            Text(productDataModel.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(productDataModel.description),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$ ${productDataModel.price.toString()}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_bag_outlined))
                  ],
                )
              ],
            )
          ],
        ));
  }
}
