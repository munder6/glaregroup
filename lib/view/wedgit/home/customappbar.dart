import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';




class CustomAppBar extends StatelessWidget {

  final String titleappbar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedIconFavorite;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CustomAppBar({Key? key, required this.titleappbar,required this.onPressedIcon,required this.onPressedIconFavorite, this.onChanged, required this.mycontroller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 55,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: mycontroller,
              onChanged: onChanged,
              decoration: InputDecoration(
                prefixIcon:  IconButton(
                  onPressed: onPressedIcon,
                  icon: const Icon(EvaIcons.search, size: 24,),
                ),
                hintText: titleappbar,
                hintStyle: const TextStyle(fontSize: 13),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)
                ),
                filled: true,
                fillColor: AppColor.grey2,
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10)
            ),
            child: IconButton(
                onPressed: onPressedIconFavorite,
                icon: Icon(
                  EvaIcons.heartOutline,
                  size: 28,
                  color: Colors.grey[600],
                )
            ),
          ),
          const SizedBox(width: 5,),

          
        ],
      ),
    );
  }
}
