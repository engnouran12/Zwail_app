import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zewail/core/common/presentation/widgets/networkWidgets/error_widget.dart';
import 'package:zewail/features/course/domain/entities/course_model.dart';
import 'package:zewail/features/course/presentation/course_details/cubit/course_details_cubit.dart';
import 'package:zewail/features/course/presentation/course_details/views/course_info_view.dart';
import 'package:zewail/features/course/presentation/course_details/views/header_view.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({super.key, required this.id});
  final String id;

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CourseDetailsCubit>().getCourseDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var course = context.watch<CourseDetailsCubit>().courseDetails;
    return BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
      builder: (context, state) {
        if (state is CourseDetailsLoading) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is CourseDetailsFailure) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => context.pop(), icon: Icon(Icons.arrow_back)),
            ),
            body: CustomErrorWidget(
                error: state.failure,
                refresh: () => context
                    .read<CourseDetailsCubit>()
                    .getCourseDetails(widget.id)),
          );
        }
        if (course != null) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderVew(courseModel: CourseModel()),
                  CourseInfoView(courseModel: CourseModel())
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
