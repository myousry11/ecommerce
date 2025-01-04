import 'dart:convert';

import 'package:ecommerce/controller/searchcontroller.dart';
import 'package:ecommerce/core/class/handlingdata_view.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/search/custom_search_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/translatedatabase.dart';
class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: GetBuilder<SearchControllerImp>(builder: (controller) => Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: CustomSearchTextFormField(
                textController: controller.search!,
                onChanged: (val) {
                  if (val.isNotEmpty) {
                    controller.onSearchItems(); // استدعاء البحث عند الكتابة
                  } else {
                    controller.checkSearch(val); // التحقق إذا كان النص فارغًا
                  }
                },
              ),
            ),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch ? ListItemsSearch(listDataModel: controller.listData) : Container(),
            )
          ],
        ),
      )
      ),
    );
  }
}


class ListItemsSearch extends GetView<SearchControllerImp> {
  final List<ItemsModel> listDataModel;

  const ListItemsSearch({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listDataModel.length,
        itemBuilder: (context, index){
        return InkWell(
          onTap: (){
            controller.goToPageProduct(listDataModel[index]);
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // لون الظل خفيف
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 2), // موقع الظل
                ),
              ],
              borderRadius: BorderRadius.circular(40), // تعديل الحواف ليكون أكثر دائرية
            ),
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Card(
              color: AppColor.white,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(child: Image.memory(
                        base64Decode(listDataModel[index].itemsImage!),
                      height: 180,
                    )
                    ),
                    Expanded(
                      flex: 2 ,
                        child: ListTile(
                          title: Text(
                              "${translateDatabase(listDataModel[index].itemsNameAr, listDataModel[index].itemsName)}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${translateDatabase(listDataModel[index].categoriesNameAr, listDataModel[index].categoriesName)}",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14, color: Colors.grey.withOpacity(0.5)),
                              ),
                              const SizedBox(width: 10,),
                              Text(
                                "/ ${translateDatabase(listDataModel[index].subcategoriesNameAr, listDataModel[index].subcategoriesName)}",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14, color: Colors.grey.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    });
  }
}

