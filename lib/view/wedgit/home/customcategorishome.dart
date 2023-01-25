import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/home_controller.dart';
import 'package:glaregroup/core/functions/translatedatabase.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../../linkapi.dart';



class CustomCatHome extends GetView<HomeControllerImp> {

  const CustomCatHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 90,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10,),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return Categories(
            i : index,
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]),) ;
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {

  final CategoriesModel categoriesModel;
  final int? i;
  const Categories( {Key? key, required this.categoriesModel, required this.i,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItems(controller.categories, i! , categoriesModel.categoriesId!);
      },
      child: Column(children: [
        Container(
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(12),

            color: AppColor.threeColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          height: 64.5,
          width: 64.5,
          child:
          SvgPicture.network(
              "${AppLink.imageCategories}/${categoriesModel.categoriesImage}"
          ),
        ),
        const SizedBox(height: 3,),
        Text("${translateDtaBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}")
      ],),
    );
  }
}

