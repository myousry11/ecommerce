import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/imageassets.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImageAsset.noData),
                      )
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server),
                  )
                : widget;
  }
}
