import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';




class CustomAppBar extends StatelessWidget {

  final String titleappbar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedIconFavorite;
  const CustomAppBar({Key? key, required this.titleappbar,required this.onPressedIcon,required this.onPressedIconFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 45,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon:  IconButton(
                  onPressed: onPressedIcon,
                  icon: const Icon(Icons.search, size: 24,),
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
          const SizedBox(width: 5,),
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10)
            ),
            child: IconButton(
                onPressed: onPressedIconFavorite,
                icon: Icon(
                  Icons.favorite_outline,
                  size: 28,
                  color: Colors.grey[600],
                )
            ),
          ),
          const SizedBox(width: 5,),
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10)
            ),
            // child: IconButton(
            //     onPressed: onPressedIcon,
            //     icon: Icon(
            //       Icons.notifications_active_outlined,
            //       size: 28,
            //       color: Colors.grey[600],
            //     )
            // ),
          ),
          
        ],
      ),
    );
  }
}
