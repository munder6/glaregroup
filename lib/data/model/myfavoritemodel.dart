class MyFavoriteModel {
  String? favoriteId;
  String? favoriteUsersid;
  String? favoriteItemsid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDescount;
  String? itemsDate;
  String? itemsCat;
  String? usersId;

  MyFavoriteModel({
    this.favoriteId,
    this.favoriteUsersid,
    this.favoriteItemsid,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDescount,
    this.itemsDate,
    this.itemsCat,
    this.usersId,
  });

  String? _s(dynamic v) => v == null ? null : v.toString();

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId      = _s(json['favorite_id']);
    favoriteUsersid = _s(json['favorite_usersid']);
    favoriteItemsid = _s(json['favorite_itemsid']);

    itemsId         = _s(json['items_id']);
    itemsName       = _s(json['items_name']);
    itemsNameAr     = _s(json['items_name_ar']);
    itemsDesc       = _s(json['items_desc']);
    itemsDescAr     = _s(json['items_desc_ar']);
    itemsImage      = _s(json['items_image']);
    itemsCount      = _s(json['items_count']);
    itemsActive     = _s(json['items_active']);
    itemsPrice      = _s(json['items_price']);
    itemsDescount   = _s(json['items_descount']);
    itemsDate       = _s(json['items_date']);
    itemsCat        = _s(json['items_cat']);

    usersId         = _s(json['users_id'] ?? json['user_id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'favorite_id'      : favoriteId,
      'favorite_usersid' : favoriteUsersid,
      'favorite_itemsid' : favoriteItemsid,
      'items_id'         : itemsId,
      'items_name'       : itemsName,
      'items_name_ar'    : itemsNameAr,
      'items_desc'       : itemsDesc,
      'items_desc_ar'    : itemsDescAr,
      'items_image'      : itemsImage,
      'items_count'      : itemsCount,
      'items_active'     : itemsActive,
      'items_price'      : itemsPrice,
      'items_descount'   : itemsDescount,
      'items_date'       : itemsDate,
      'items_cat'        : itemsCat,
      'users_id'         : usersId,
    };
  }
}
