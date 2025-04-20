import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zewail/core/common/presentation/widgets/networkWidgets/error_widget.dart';
import 'package:zewail/features/course/presentation/categories/cubit/categories_cubit.dart';
import 'package:zewail/features/course/presentation/courses_list/views/courses_list_view.dart';
import 'package:zewail/features/course/presentation/widgets/show_filters_button.dart';

class CategoryDetailsPage extends StatefulWidget {
  const CategoryDetailsPage({super.key, required this.id});
  final String id;
  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getCategoryDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    String? title = (context.watch<CategoriesCubit>().state
            is GetCategoryDetailsSuccess)
        ? (context.watch<CategoriesCubit>().state as GetCategoryDetailsSuccess)
            .category
            .name
        : null;
    return Scaffold(
      floatingActionButton: ShowFiltersButton(
        siz: 45.r,
        onApplyClicked: (p0) {},
      ),
      appBar: AppBar(
        title: Text(title ?? ''),
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is GetCategoryDetailsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetCategoryDetailsFailure) {
            return CustomErrorWidget(
                error: state.failure,
                refresh: () => context
                    .read<CategoriesCubit>()
                    .getCategoryDetails(widget.id));
          }
          if (state is GetCategoryDetailsSuccess) {
            return Column(
              spacing: 20.h,
              children: [
                Expanded(
                  child: CoursesListView(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      courses: state.category.courses ?? []),
                ),
              ],
            );
          }

          return Scaffold(
            appBar: AppBar(),
            body: Container(),
          );
        },
      ),
    );
  }
}
