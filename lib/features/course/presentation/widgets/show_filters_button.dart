import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_back_button.dart';
import 'package:zewail/core/config/assets.dart';
import 'package:zewail/core/config/colors.dart';
import 'package:zewail/features/course/domain/entities/courses_parameters_model.dart';
import 'package:zewail/features/course/presentation/widgets/search_filter_bottom_sheet.dart';

class ShowFiltersButton extends StatelessWidget {
  const ShowFiltersButton(
      {super.key,
      this.siz,
      required this.onApplyClicked,
      this.coursesParametersModel});
  final double? siz;
  final OnApplyClicked onApplyClicked;
  final CoursesParametersModel? coursesParametersModel;
  @override
  Widget build(BuildContext context) {
    return CustomShadowButton(
        siz: siz ?? 45,
        color: AppColors.mainColor,
        onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => SearchFilterBottomSheet(
                  onApplyClicked: onApplyClicked,
                  parametersModel: coursesParametersModel,
                ),
            isScrollControlled: true,
            showDragHandle: true),
        padding: EdgeInsets.all(8.r),
        icon: SvgPicture.asset(
          AppAssets.filtersIcon,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ));
  }
}
