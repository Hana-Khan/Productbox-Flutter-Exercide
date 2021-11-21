import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DocumentsCounterCubit/document_counter_cubit.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DocumentsCounterCubit/document_counter_state.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class StepProgressIndicatorsWidget extends StatelessWidget {
  const StepProgressIndicatorsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentCounterCubit, DocumentCounterState>(
      builder: (context, state) {
        return StepProgressIndicator(
          size: 7.sp,
          padding: 8.0.sp,
          totalSteps: 4,
          currentStep: state.counterValue!,
          selectedColor: ColorsConstants.primaryColorLight,
          unselectedColor: ColorsConstants.lightGreyColor,
          customStep: (index, color, _) => Container(
            height: 7.0.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0.r),
              color: color == ColorsConstants.primaryColorLight
                  ? ColorsConstants.primaryColorLight
                  : ColorsConstants.lightGreyColor,
            ),
          ),
        );
      },
    );
  }
}
class ProgressIndicators extends StatelessWidget {
  const ProgressIndicators({ Key? key, this.color }) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.0.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0.r),
          color: color??ColorsConstants.lightGreyColor,
        ),
    );
  }
}