import 'package:bvoat_clone/pages/data/product_model.dart';
import 'package:bvoat_clone/theme/app_color.dart';
import 'package:flutter/material.dart';

import '../pages/data/data_utils.dart';

class ProductCard extends Column {
  ProductCard({Key? key, required List<Widget> children})
      : super(
          key: key,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        );

  factory ProductCard.noDescription(ProductModel productModel) {
    return ProductCard(children: [
      Card(
        child: Image.asset(
          productModel.getAssetName,
          width: 150,
          fit: BoxFit.fitWidth,
        ),
      ),
      SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productModel.brand,
              style: const TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const Text(
              '',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis),
            ),
            Text(
              productModel.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              DataUtils.calcStringToWon(productModel.price),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.instance.kBlue,
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  factory ProductCard.build(ProductModel productModel) {
    return ProductCard(
      children: [
        Card(
          child: Image.asset(
            productModel.getAssetName,
            width: 150,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.brand,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                productModel.description,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis),
              ),
              Text(
                productModel.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                DataUtils.calcStringToWon(productModel.price),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.instance.kBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
