import 'package:delivery/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/styles/box_decoration_shadows.dart';

@immutable
class AvatarView extends StatelessWidget {
  String? backgroundImage;
  AvatarView({super.key, this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: createDecorationWithShadows(
              borderRadius: BorderRadius.circular(65)),
          width: 142,
          height: 142,
          child: CircleAvatar(
            backgroundImage: NetworkImage(backgroundImage!),
            backgroundColor: MyColors.primaryColorOpacity,
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -35),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Icon(
              Icons.camera_alt,
              color: MyColors.white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}
