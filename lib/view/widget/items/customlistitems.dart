import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/imageassets.dart';
import 'package:ecommerce/core/functions/translatedatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:typed_data';

import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final bool active;
  const CustomListItems({
    super.key,
    required this.itemsModel,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    String base64String = "${itemsModel.itemsImage}";
    Uint8List bytes = base64Decode(base64String);

    var ratingData = controller.ratings[itemsModel.itemsId] ?? {};
    double averageRating = ratingData['average'] ?? 0.0;
    int reviewCount = ratingData['count'] ?? 0;

    return GestureDetector(
      onTap: () {
        controller.goToPageProduct(itemsModel);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 2), // موقع الظل
            ),
          ],
          borderRadius: BorderRadius.circular(40),
        ),
        child: Card(
          color: AppColor.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${itemsModel.itemsId}",
                      child: Image.memory(
                        bytes,
                        width: 150,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Column(
                      children: [
                        Text(
                          translateDatabase(
                              itemsModel.itemsNameAr, itemsModel.itemsName),
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "${itemsModel.itemsPriceDiscount} ${"62".tr}",
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 5,),
                            if (itemsModel.itemsPrice != 0)
                              Text(
                                "${itemsModel.itemsPrice} ${"62".tr}",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Colors.grey.withOpacity(0.5),
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 22,
                              child: Row(
                                children: List.generate(
                                  5,
                                      (index) => Icon(
                                    Icons.star,
                                    size: 15,
                                    color: index < averageRating
                                        ? Colors.orange
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "(\t$reviewCount\t)",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (itemsModel.itemsDiscount != 0)
                Positioned(
                  top: 4,
                  left: 4,
                  child: Transform.rotate(
                    angle: -0.5,
                    child: Image.asset(
                      AppImageAsset.sale,
                      width: 50,
                    ),
                  ),
                ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {  // Favorite

                      },
                    icon: Icon(
                      active ? Icons.favorite : Icons.favorite_border_outlined,
                      size: 25,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
