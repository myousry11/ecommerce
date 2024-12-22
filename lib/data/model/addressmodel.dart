class AddressModel {
  int? addressId;
  String? addressName;
  int? addressUsersid;
  String? addressCity;
  String? addressStreet;
  String? addressBuilding;
  String? addressApartment;
  double? addressLat;
  double? addressLong;

  AddressModel(
      {this.addressId,
        this.addressName,
        this.addressUsersid,
        this.addressCity,
        this.addressStreet,
        this.addressBuilding,
        this.addressApartment,
        this.addressLat,
        this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
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
