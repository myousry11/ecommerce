class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDescription;
  String? itemsDescriptionAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  int? itemsPriceDiscount;
  String? itemsDate;
  int? itemsSubcategory;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  int? subcategoriesId;
  String? subcategoriesName;
  String? subcategoriesNameAr;
  String? subcategoriesDatetime;
  int? subcategoriesCategory;
  String? favorite;

  ItemsModel(
      {this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDescription,
        this.itemsDescriptionAr,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsPriceDiscount,
        this.itemsDate,
        this.itemsSubcategory,
        this.categoriesId,
        this.categoriesName,
        this.categoriesNameAr,
        this.categoriesImage,
        this.categoriesDatetime,
        this.subcategoriesId,
        this.subcategoriesName,
        this.subcategoriesNameAr,
        this.subcategoriesDatetime,
        this.subcategoriesCategory,
        this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDescription = json['items_description'];
    itemsDescriptionAr = json['items_description_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsPriceDiscount = json['items_price_discount'];
    itemsDate = json['items_date'];
    itemsSubcategory = json['items_subcategory'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    subcategoriesId = json['subcategories_id'];
    subcategoriesName = json['subcategories_name'];
    subcategoriesNameAr = json['subcategories_name_ar'];
    subcategoriesDatetime = json['subcategories_datetime'];
    subcategoriesCategory = json['subcategories_category'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_description'] = this.itemsDescription;
    data['items_description_ar'] = this.itemsDescriptionAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_price_discount'] = this.itemsPriceDiscount;
    data['items_date'] = this.itemsDate;
    data['items_subcategory'] = this.itemsSubcategory;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['subcategories_id'] = this.subcategoriesId;
    data['subcategories_name'] = this.subcategoriesName;
    data['subcategories_name_ar'] = this.subcategoriesNameAr;
    data['subcategories_datetime'] = this.subcategoriesDatetime;
    data['subcategories_category'] = this.subcategoriesCategory;
    return data;
  }
}
