class CartModel {
  int? itemsprice;
  int? countitems;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? cartOrders;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDescription;
  String? itemsDescriptionAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsNew;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCategory;
  int? itemsSubcategory;
  int? itemsPriceDiscount;

  CartModel(
      {this.itemsprice,
        this.countitems,
        this.cartId,
        this.cartUsersid,
        this.cartItemsid,
        this.cartOrders,
        this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDescription,
        this.itemsDescriptionAr,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsNew,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCategory,
        this.itemsSubcategory,
        this.itemsPriceDiscount});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDescription = json['items_description'];
    itemsDescriptionAr = json['items_description_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsNew = json['items_new'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategory = json['items_category'];
    itemsSubcategory = json['items_subcategory'];
    itemsPriceDiscount = json['items_price_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_orders'] = this.cartOrders;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_description'] = this.itemsDescription;
    data['items_description_ar'] = this.itemsDescriptionAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_new'] = this.itemsNew;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_category'] = this.itemsCategory;
    data['items_subcategory'] = this.itemsSubcategory;
    data['items_price_discount'] = this.itemsPriceDiscount;
    return data;
  }
}
