import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/common/presentation/widgets/customButtons/custom_elevated_buttons.dart';
import 'package:zewail/core/common/presentation/widgets/custom_form_dropdown.dart';
import 'package:zewail/core/config/text_styles.dart';
import 'package:zewail/features/course/domain/entities/courses_parameters_model.dart';

typedef OnApplyClicked = void Function(CoursesParametersModel);

class SearchFilterBottomSheet extends StatelessWidget {
  const SearchFilterBottomSheet(
      {super.key, this.parametersModel, required this.onApplyClicked});
  final CoursesParametersModel? parametersModel;
  final OnApplyClicked onApplyClicked;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'الظهور علي حسب',
            style: CustomTextStyle.styleW700S14Black,
          ),
          CustomFormDropDown(
              label: 'حسب اللغه', items: [DropdownMenuItem(child: Text('en'))]),
          CustomFormDropDown(
              label: 'حسب المادة التعليمية',
              items: [DropdownMenuItem(child: Text('en'))]),
          CustomFormDropDown(
              label: 'المرحلة الدراسية',
              items: [DropdownMenuItem(child: Text('en'))]),
          Text(
            'السن',
            style: CustomTextStyle.styleW500S12Black,
          ),
          RangeSlider(
            values: RangeValues(22, 40),
            onChanged: (value) {},
            max: 60,
            min: 10,
          ),
          Text(
            'السعر',
            style: CustomTextStyle.styleW500S12Black,
          ),
          RangeSlider(
            values: RangeValues(22, 40),
            onChanged: (value) {},
            max: 60,
            min: 10,
          ),
          CustomMainButton(
            height: 45.h,
            margin: EdgeInsets.only(top: 30.h),
            onPressed: () {},
            text: 'Apply',
            fontSize: 14.sp,
          ),
        ],
      ),
    );
  }
}
