import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/home_controller.dart';
import 'package:glaregroup/data/model/itemsmodel.dart';
import 'package:glaregroup/linkapi.dart';

import '../../../core/constant/color.dart';
import '../../../core/functions/translatedatabase.dart';

class AllProductsHome extends GetView<HomeControllerImp> {
  const AllProductsHome({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.items.isEmpty) {
      return const SizedBox.shrink();
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: controller.items.length,
      itemBuilder: (context, index) {
        final item = ItemsModel.fromJson(controller.items[index]);
        return _AllProductCard(item: item);
      },
    );
  }
}

class _AllProductCard extends GetView<HomeControllerImp> {
  final ItemsModel item;
  const _AllProductCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: AppColor.primaryColor.withOpacity(0.1),
      onTap: () => controller.goToPageProductDetails(item),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Hero(
                  tag: '${item.itemsId}_home_all_products',
                  child: CachedNetworkImage(
                    imageUrl: '${AppLink.imageItems}/${item.itemsImage}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                translateDtaBase(item.itemsNameAr, item.itemsName),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${item.itemsPriceDiscount}\$',
                style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}