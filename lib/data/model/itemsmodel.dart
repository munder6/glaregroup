class ItemsModel {
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
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? itemsPriceDiscount;
  String? favorite;

  ItemsModel({
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
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatetime,
    this.favorite,
    this.itemsPriceDiscount,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId            = json['items_id']?.toString();
    itemsName          = json['items_name'];
    itemsNameAr        = json['items_name_ar'];
    itemsDesc          = json['items_desc'];
    itemsDescAr        = json['items_desc_ar'];
    itemsImage         = json['items_image'];
    itemsCount         = json['items_count']?.toString();
    itemsActive        = json['items_active']?.toString();
    itemsPrice         = json['items_price']?.toString();
    itemsDescount      = json['items_descount']?.toString();
    itemsPriceDiscount = json['itemspricedescount']?.toString();
    itemsDate          = json['items_date'];
    itemsCat           = json['items_cat']?.toString();
    categoriesId       = json['categories_id']?.toString();
    categoriesName     = json['categories_name'];
    categoriesNameAr   = json['categories_name_ar'];
    categoriesImage    = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite           = json['favorite']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['items_id']            = itemsId;
    data['items_name']          = itemsName;
    data['items_name_ar']       = itemsNameAr;
    data['items_desc']          = itemsDesc;
    data['items_desc_ar']       = itemsDescAr;
    data['items_image']         = itemsImage;
    data['items_count']         = itemsCount;
    data['items_active']        = itemsActive;
    data['items_price']         = itemsPrice;
    data['items_descount']      = itemsDescount;
    data['items_date']          = itemsDate;
    data['items_cat']           = itemsCat;
    data['categories_id']       = categoriesId;
    data['categories_name']     = categoriesName;
    data['categories_name_ar']  = categoriesNameAr;
    data['categories_image']    = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    // ملاحظة: itemspricedescount غير مرسل هنا كما كان في كودك الأصلي
    return data;
  }
}