import 'package:delivery/src/features/presentations/custom-widgets/Headers/header_text.dart';
import 'package:flutter/material.dart';
import '../../../../utils/my_colors.dart';
import '../../../../utils/styles/box_decoration_shadows.dart';

Widget favouriteCard({
  required context,
  double marginTop = 15.0,
  double marginRight = 0.0,
  double marginBottom = 0.0,
  double marginLeft = 0.0,
  required title,
  required subtitle,
  required review,
  required ratings,
  String buttonText = '',
  required bool hasActionButton,
  required bool isFavourite,
  required ImageProvider<Object> image,
}) {
  return Container(
    margin: EdgeInsets.only(
        top: marginTop,
        right: marginRight,
        bottom: marginBottom,
        left: marginLeft),
    padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
    width: double.infinity,
    decoration: createDecorationWithShadows(),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            image: image,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 7.0),
                      child: headerText(
                          text: title,
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark,
                          size: 35.0,
                          color: isFavourite
                              ? MyColors.primaryColor
                              : Colors.grey[300],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: MyColors.gris,
                        size: 16.0,
                      ),
                      headerText(
                          text: subtitle,
                          color: MyColors.gris,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16.0,
                        ),
                        headerText(
                            text: review,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                        const SizedBox(
                          width: 5,
                        ),
                        headerText(
                            text: ratings,
                            color: MyColors.gris,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                      ],
                    ),
                    // Container(
                    //     margin: const EdgeInsets.symmetric(horizontal: 0.0),
                    //     width: 110.0,
                    //     height: 25.0,
                    //     child: createButton(
                    //         buttonColor: MyColors.primaryColor,
                    //         labelButton: buttonText,
                    //         labelFontSize: 11.0))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
