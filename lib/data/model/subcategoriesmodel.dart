class SubCategoriesModel {
  int? subCategoriesId;
  String? subCategoriesName;
  String? subCategoriesNameAr;
  String? subCategoriesDatetime;
  int? subCategoriesCategory;

  SubCategoriesModel({
    this.subCategoriesId,
    this.subCategoriesName,
    this.subCategoriesNameAr,
    this.subCategoriesDatetime,
    this.subCategoriesCategory,
  });

  SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    subCategoriesId = json['subcategories_id'];
    subCategoriesName = json['subcategories_name'];
    subCategoriesNameAr = json['subcategories_name_ar'];
    subCategoriesDatetime = json['subcategories_datetime'];
    subCategoriesCategory = json['subcategories_category'];
  }

  Map<String, dynamic> toJson() {
    return {
      'subcategories_id': subCategoriesId,
      'subcategories_name': subCategoriesName,
      'subcategories_name_ar': subCategoriesNameAr,
      'subcategories_datetime': subCategoriesDatetime,
      'subcategories_category': subCategoriesCategory,
    };
  }
}
