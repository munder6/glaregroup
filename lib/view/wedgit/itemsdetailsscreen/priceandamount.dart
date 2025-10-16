import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/constant/routes.dart';
import '../../../core/constant/color.dart';

class PriceAndAmount extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  final String currency;

  const PriceAndAmount({
    Key? key,
    required this.onAdd,
    required this.onRemove,
    required this.price,
    required this.count,
    this.currency = "\$",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final maxW = constraints.maxWidth;
        final isNarrow = maxW < 320; // شاشات/بطاقات ضيقة جدًا

        final double pad = isNarrow ? 10 : 16;
        final double priceFont = isNarrow ? 18 : 22;
        final double btnSide = isNarrow ? 30 : 36;
        final double cntSide = isNarrow ? 34 : 40;
        final double cartSide = isNarrow ? 40 : 50;

        final countInt = int.tryParse(count) ?? 0;
        final totalText = "$price $currency";

        Widget priceWidget = FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            totalText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColor.black,
              fontSize: priceFont,
              fontWeight: FontWeight.w600,
            ),
          ),
        );

        Widget qtyWidget = Container(
          padding: EdgeInsets.symmetric(horizontal: isNarrow ? 6 : 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black12, width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _RoundIconButton(icon: Icons.add, side: btnSide, onPressed: onAdd),
              SizedBox(width: isNarrow ? 6 : 8),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: cntSide,
                  maxWidth: isNarrow ? 50 : 64,
                  minHeight: cntSide,
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "$countInt",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: isNarrow ? 15 : 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: isNarrow ? 6 : 8),
              _RoundIconButton(icon: Icons.remove, side: btnSide, onPressed: onRemove),
            ],
          ),
        );

        Widget cartBtn = SizedBox(
          width: cartSide,
          height: cartSide,
          child: _CartButton(onTap: () => Get.toNamed(AppRoute.cart)),
        );

        return Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(pad),
          child: isNarrow
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              priceWidget,
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: qtyWidget),
                  SizedBox(width: 10),
                  cartBtn,
                ],
              ),
            ],
          )
              : Row(
            // استخدمنا Expanded/Flexible لمنع الأوفرفلو
            children: [
              // السعر يتمدّد لكن ما يضغط الباقي
              Expanded(
                flex: 3,
                child: priceWidget,
              ),
              SizedBox(width: 12),
              // العداد يأخذ المساحة المتبقية بدون تجاوز
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: qtyWidget,
                ),
              ),
              SizedBox(width: 12),
              // زر سلة ثابت الحجم
              cartBtn,
            ],
          ),
        );
      },
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final double side;
  final VoidCallback? onPressed;

  const _RoundIconButton({
    Key? key,
    required this.icon,
    required this.side,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: side,
      height: side,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: side * 0.55, color: AppColor.black),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints.tightFor(width: side, height: side),
          splashRadius: side * 0.6,
        ),
      ),
    );
  }
}

class _CartButton extends StatelessWidget {
  final VoidCallback? onTap;
  const _CartButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: const Center(
          child: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}
