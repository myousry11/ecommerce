class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersPrice;
  int? ordersTotalprice;
  int? ordersCoupon;
  int? ordersPaymentMethod;
  int? ordersStatus;
  String? ordersDatetime;
  int? ordersRating;
  String? ordersRateComment;
  int? addressId;
  String? addressName;
  int? addressUsersid;
  String? addressCity;
  String? addressStreet;
  String? addressBuilding;
  String? addressApartment;
  double? addressLat;
  double? addressLong;

  OrdersModel(
      {this.ordersId,
        this.ordersUsersid,
        this.ordersAddress,
        this.ordersType,
        this.ordersPricedelivery,
        this.ordersPrice,
        this.ordersTotalprice,
        this.ordersCoupon,
        this.ordersPaymentMethod,
        this.ordersStatus,
        this.ordersDatetime,
        this.addressId,
        this.addressName,
        this.addressUsersid,
        this.addressCity,
        this.addressStreet,
        this.addressBuilding,
        this.addressApartment,
        this.addressLat,
        this.addressLong,
        this.ordersRating,
        this.ordersRateComment,
      });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersPaymentMethod = json['orders_payment_method'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    ordersRating = json['orders_rating'];
    ordersRateComment = json['orders_rate_comment'];
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressBuilding = json['address_building'];
    addressApartment = json['address_apartment'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_payment_method'] = this.ordersPaymentMethod;
    data['orders_status'] = this.ordersStatus;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_rating'] = this.ordersRating;
    data['orders_rate_comment'] = this.ordersRateComment;
    data['address_id'] = this.addressId;
    data['address_name'] = this.addressName;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_building'] = this.addressBuilding;
    data['address_apartment'] = this.addressApartment;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
