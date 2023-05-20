import 'package:delivery/src/pages/custom-widgets/Headers/header_text.dart';
import 'package:delivery/src/utils/extensions/screen_size.dart';
import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataWidget extends StatelessWidget {
  String? text;

  NoDataWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
         width: screenWidth.getScreenWidth(
                  context: context, multiplier: 0.5),
         height: screenHeight.getScreenHeight(
    context: context, multiplier: 0.5),
          child: Lottie.asset('assets/images/slide.json'),
        ),
        Container(
           alignment: Alignment.bottomCenter,
          
          
            
            margin: EdgeInsets.only(
              bottom: screenHeight.getScreenHeight(
                  context: context, multiplier: 0.2),
            ),
            child: headerText(
                text: text!, fontSize: 22, fontWeight: FontWeight.w500,textAlign:TextAlign.center ))
      ],
    );
  }
}

class EmptyWidget extends StatelessWidget {
  String? text;

  EmptyWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
         width: screenWidth.getScreenWidth(
                  context: context, multiplier: 1),
         height: screenHeight.getScreenHeight(
    context: context, multiplier: 1),
          child: Lottie.asset('assets/images/empty.json'),
        ),
        Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(
              bottom: screenHeight.getScreenHeight(
                  context: context, multiplier: 0.08),
            ),
            child: headerText(
                text: text!, fontSize: 22, fontWeight: FontWeight.w500))
      ],
    );
  }
}



//  [
//            Container(
//             // margin: const EdgeInsets.only(bottom: 300),
//             child: Lottie.asset('assets/images/empty.json'),
//             height: 600,
//             width: 600,
//             ),
//              Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
              
//               children: [
                
//                 // Image.asset('assets/images/no-items.png'),
//                 headerText(text: text!, fontSize: 22, fontWeight: FontWeight.w500)
//               ],
//             ),
//         ],