import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/controller/home_controller.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/core/constant/routes.dart';
import 'package:glaregroup/data/model/itemsmodel.dart';
import 'package:glaregroup/linkapi.dart';
import 'package:glaregroup/view/wedgit/home/customcardhome.dart';
import '../../core/class/handlingdataview.dart';
import '../wedgit/home/allproductshome.dart';
import '../wedgit/home/customappbar.dart';
import '../wedgit/home/customcategorishome.dart';
import '../wedgit/home/listitemshome.dart';

class HomeScreen extends StatelessWidget {


  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());

    Future<void>_loadResources(bool reload) async {
      await controller.getData();
    }


    return  GetBuilder<HomeControllerImp>(
        builder: (controller) =>
            Scaffold(
              body: RefreshIndicator(
                color: Colors.black,
                onRefresh: ()async{
                  await _loadResources(true);
                },
                child: Container(
                  color: Colors.grey.shade50,
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(top: 10),
                   child: ListView(
                children: [
                      const Text("Our", style: TextStyle(fontSize: 35),),
                      const Text("Product", style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20),
                     CustomAppBar(
                    mycontroller: controller.search!,
                    onPressedIconFavorite: (){
                      Get.toNamed(AppRoute.myFavorite);
                    },
                    onPressedIcon: (){
                      controller.onSearchItems();
                    },
                    titleappbar: "49".tr,
                    onChanged: (val ) {
                    controller.checkSearch(val);
                    },
                  ),
                    CustomCardHome(
                    title: controller.titlehomecard,
                    body:  controller.bodyhomecard,
                  ),
          HandlingDataView(statusRequest: controller.statusRequest , widget:
                !controller.isSearch ?  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const SizedBox(height: 10),
                      const SizedBox(height: 10,),
                      const  CustomCatHome(),
                      const SizedBox(height: 2,),
                      Text("154".tr, style: const TextStyle(fontSize: 18, color: AppColor.secondColor),),
                      const AllProductsHome(),
                      const SizedBox(height: 20),
                      Text("153".tr, style: const TextStyle(fontSize: 18, color: AppColor.secondColor),),
                      const SizedBox(height: 12),
                      const ListItemsHome(),

                    ],
                  ) : ListItemsSearch(listdatamodel: controller.listdata)

          )],
                  ),
          ),
              ),
            ),

    );
  }
}


class ListItemsSearch extends GetView<HomeControllerImp> {

  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
        return InkWell(
          onTap: (){
          controller.goToPageProductDetails(listdatamodel[index]);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 3),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(child: CachedNetworkImage(imageUrl: "${AppLink.imageItems}/${listdatamodel[index].itemsImage}",height: 80,fit: BoxFit.scaleDown,) ),
                    Expanded(flex : 2,child: ListTile(
                     title: Text("${listdatamodel[index].itemsName}"),
                     subtitle: Text("${listdatamodel[index].categoriesName}"),
                      trailing: Text("${listdatamodel[index].itemsPriceDiscount}\$", style: const TextStyle(color: AppColor.primaryColor, fontSize: 20),),
                    ) ),

                  ],
                ),
              ),
            ),
          ),
        );
        }
        );
  }
}

