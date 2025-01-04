import 'package:ecommerce/controller/productdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/productdetails/dialograting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProductReviews extends StatelessWidget {
  final String title;
  const CustomProductReviews({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(builder: (controller) {
      return Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 22),
                ),
                trailing: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: controller.isReviewExpanded
                      ? Image.asset(
                          "assets/icons/downarrow.png",
                          key: const ValueKey("down"),
                          height: 25,
                          width: 25,
                        )
                      : Image.asset(
                          "assets/icons/arrowforward.png",
                          key: const ValueKey("forward"),
                          height: 25,
                          width: 25,
                        ),
                ),
                onTap: () {
                  controller.toggleReview();
                },
              ),
              controller.isReviewExpanded
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 180, // تحديد عرض الزر
                    child: MaterialButton(
                      highlightColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        showDialogRating(context, controller.itemsModel.itemsId.toString());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "167".tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColor.grey),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.edit,
                            color: AppColor.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  controller.reviewsList.isEmpty
                      ? const Center(child: Text("No reviews yet."))
                      : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.reviewsList.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final review = controller.reviewsList[index];
                      return Card(
                        color: AppColor.white,
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${review.usersName}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge,
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: List.generate(5, (i) {
                                      return Icon(
                                        i < (review.ratingValue ?? 0)
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: Colors.amber,
                                        size: 20,
                                      );
                                    }),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${review.ratingComment}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                    fontSize: 14,
                                    color:
                                    Colors.grey.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
                  : const SizedBox.shrink(),

            ],
          ),
        ],
      );
    });
  }
}
