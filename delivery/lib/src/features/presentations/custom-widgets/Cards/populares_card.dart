import 'package:delivery/src/features/presentations/custom-widgets/Headers/header_text.dart';
import 'package:flutter/material.dart';
import '../../../../utils/my_colors.dart';
import '../Buttons/rounded_button.dart';

Widget popularesCard({
  required context,
  double marginTop = 0.0,
  double marginRight = 0.0,
  double marginBottom = 0.0,
  double marginLeft = 10.0,
  required title,
  required subtitle,
  required review,
  required ratings,
  required buttonText,
  required bool hasActionButton,
  required ImageProvider<Object> image,
}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, 'place-detail');
        },
        child: Container(
          margin: EdgeInsets.only(
            top: marginTop,
            right: marginRight,
            bottom: marginBottom,
            left: marginLeft,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                    width: 100, height: 100, fit: BoxFit.cover, image: image),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 7.0),
                      child: headerText(
                          text: title, color: Colors.black, fontSize: 17.0),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16.0,
                        ),
                        Text(
                          review,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            ratings,
                            style: TextStyle(
                                color: MyColors.gris,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 35.0),
                          width: 100.0,
                          height: 18.0,
                          child: hasActionButton
                              ? createButton(
                                context: context,
                                  buttonColor: MyColors.primaryColor,
                                  labelButton: buttonText,
                                  labelFontSize: 11)
                              : const Text(''),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}
