class ItemReviews {
  int? ratingValue;
  int? ratingUserid;
  int? ratingItemsid;
  String? ratingComment;
  String? usersName;

  ItemReviews(
      {this.ratingValue,
        this.ratingUserid,
        this.ratingItemsid,
        this.ratingComment,
        this.usersName});

  ItemReviews.fromJson(Map<String, dynamic> json) {
    ratingValue = json['rating_value'];
    ratingUserid = json['rating_userid'];
    ratingItemsid = json['rating_itemsid'];
    ratingComment = json['rating_comment'];
    usersName = json['users_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating_value'] = this.ratingValue;
    data['rating_userid'] = this.ratingUserid;
    data['rating_itemsid'] = this.ratingItemsid;
    data['rating_comment'] = this.ratingComment;
    data['users_name'] = this.usersName;
    return data;
  }
}
