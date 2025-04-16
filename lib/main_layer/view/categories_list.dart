import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/common/presentation/widgets/networkImage/network_image.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/main_layer/widgets/list_title_widget.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTitleWidget(title: 'الاقسام'), //TODO:localization,

        SizedBox(
          height: 160.h,
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => Column(
                    spacing: 6.h,
                    children: [
                      CircleAvatar(
                        radius: 22.r,
                        backgroundColor:
                            AppColors.mainColor.withValues(alpha: .1),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomImageWidget(imagePath: ''),
                        ),
                      ),
                      Text('طهي', style: CustomTextStyle.styleW500S12Black)
                    ],
                  )),
        )
      ],
    );
  }
}
