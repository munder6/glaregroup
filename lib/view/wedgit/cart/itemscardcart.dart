import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glaregroup/core/constant/color.dart';
import 'package:glaregroup/linkapi.dart';

class ItemsCardCart extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const ItemsCardCart({Key? key, required this.name, required this.price, required this.count, required this.imagename,required this.onAdd,required this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      shadowColor: AppColor.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: CachedNetworkImage(imageUrl: "${AppLink.imageItems}/$imagename", height: 80)),
           Expanded(
              flex:3,child: ListTile(title: Text(name),
            subtitle: Text(price,style: const TextStyle(color: AppColor.red,fontSize: 16),),)),
          Expanded(child: Column(
            children: [
              SizedBox(
                  height: 50, child: IconButton(onPressed: onAdd, icon: const Icon(Icons.add))),
              SizedBox
                (height:30,child:  Text(count, style: const TextStyle(fontSize: 20),)),
              SizedBox(
                  height: 34,child: IconButton(onPressed: onRemove, icon: const Icon(Icons.remove))),
            ],
          )),
        ],
      ),
    );
  }
}
