class CouponModel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponExpdate;
  String? couponDiscount;

  CouponModel(
      {this.couponId,
        this.couponName,
        this.couponCount,
        this.couponExpdate,
        this.couponDiscount});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponExpdate = json['coupon_expdate'];
    couponDiscount = json['coupon_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_count'] = this.couponCount;
    data['coupon_expdate'] = this.couponExpdate;
    data['coupon_discount'] = this.couponDiscount;
    return data;
  }
}