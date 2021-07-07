class ShopInfoCreateRequest {
  final String user_id;
  final String name;
  final String image; // base64
  final String type;

  final String address;
  final String sub_district;
  final String district;
  final String province;

  final double latitude;
  final double longtitude;

  ShopInfoCreateRequest(
      {this.user_id,
      this.name,
      this.image,
      this.address,
      this.sub_district,
      this.district,
      this.province,
      this.type,
      this.latitude,
      this.longtitude});
}

class ShopInfoCreateResponse {
  final ShopInfoCreateDataResponse shopInfoCreateDataResponse;
  final int code;

  ShopInfoCreateResponse({this.shopInfoCreateDataResponse, this.code});
}

class ShopInfoCreateDataResponse {
  final String shop_id;

  ShopInfoCreateDataResponse({this.shop_id});
}

class DataShopDetail {
  final String name, type, image;
  DataShopDetail({this.name, this.type, this.image});
}

class DataShopAddress {
  final String address, sub_district, district, province;
  DataShopAddress({
    this.address,
    this.sub_district,
    this.district,
    this.province,
  });
}

class DataShopPosition {
  final double latitude, longtitude;
  DataShopPosition({this.latitude, this.longtitude});
}
