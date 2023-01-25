import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/view/wedgit/itemsdetailsscreen/optionsselect.dart';
import '../controller/productdetails_controller.dart';
import '../core/functions/translatedatabase.dart';
import '../linkapi.dart';


class ProDetailsTest extends StatefulWidget {
  const ProDetailsTest({Key? key}) : super(key: key);

  @override
  State<ProDetailsTest> createState() => _ProDetailsTestState();
}

class _ProDetailsTestState extends State<ProDetailsTest> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.grey.shade300 ,
       appBar: AppBar(
         foregroundColor: AppColor.black,
         title: Center(child: Text("70".tr, style: const TextStyle(color: AppColor.black, fontSize: 18),)),
         backgroundColor: Colors.grey.shade300,
         elevation: 0,
         actions: [
           IconButton(onPressed: (){}, icon: const Icon(Icons.favorite, color: Colors.redAccent,size: 30,))
         ],
       ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50
                    ),
                    child: Container(
                      width: double.infinity,
                      color: Colors.grey.shade300,
                      child: CachedNetworkImage(
                        imageUrl: "${AppLink.imageItems}/${controller.itemsModel.itemsImage!}",
                        height: 250,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(child:
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration:  BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40)
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Row(
                           children: [
                             Expanded(child:
                                 Text(translateDtaBase(
                                     controller.itemsModel.itemsNameAr,controller.itemsModel.itemsName),
                                   style: const TextStyle(color: AppColor.black, fontSize: 27, fontWeight: FontWeight.bold))
                             ),
                             const SizedBox(width: 30),
                             Container(
                               decoration: BoxDecoration(
                                 color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(8)
                               ),
                               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                               child: Text("\$${controller.itemsModel.itemsPrice}",
                                   style: const TextStyle(color: AppColor.white, fontSize: 24),
                                 textAlign: TextAlign.start,

                               ),
                             )
                           ],
                         ),
                          const SizedBox(height: 15),
                          Text(
                              translateDtaBase(
                                  controller.itemsModel.itemsDescAr,controller.itemsModel.itemsDesc),
                              style:  TextStyle(color: AppColor.greydark, fontSize: 14),
                          ),

                          const SizedBox(height: 10),
                          const SubItems()
                        ],
                      ),
                    ),
                  ))

                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              height: 120,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40)
                )
              ),
              child: Row(
                children: [
                  Container(
                    width: 180,
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(999)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                            if(_count > 0){
                              _count--;
                            }
                            }),
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey.shade900,
                              child: const Icon(Icons.remove , color: Colors.white,),
                            ),
                          ),
                          Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              child:  Text("$_count",style: const TextStyle(fontSize: 20),)),
                          InkWell(
                            onTap: () => setState(() {
                              _count++;
                            }),
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey.shade900,
                              child: const Icon(Icons.add , color: Colors.white,),
                            ),
                          )
                        ],
                      ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey.shade900),
                        fixedSize: MaterialStateProperty.all(const Size(double.infinity, 65)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                        )),
                      ),
                        child: Text("55".tr, style: const TextStyle(fontSize: 17),),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
