import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DocumentsCounterCubit/document_counter_cubit.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DocumentsCounterCubit/document_counter_state.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';
import 'package:productbox_flutter_exercise/View/Widgets/UploadDocuments/step_progress_indicatorr.dart';
import 'package:productbox_flutter_exercise/View/Widgets/UploadDocuments/upload_certificate_widget.dart';
import 'package:productbox_flutter_exercise/View/Widgets/UploadDocuments/upload_driving_license_widget.dart';
import 'package:productbox_flutter_exercise/View/Widgets/UploadDocuments/upload_passport_widget.dart';
import 'package:productbox_flutter_exercise/View/Widgets/UploadDocuments/upload_profile_widget.dart';
import 'package:productbox_flutter_exercise/View/Widgets/buttons.dart';
import 'package:productbox_flutter_exercise/View/Widgets/titile.dart';

class UploadDocumentsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsConstants.backgroundColor,
      body: Container(
          width: 1.sw,
          height: 1.sh,
          padding: EdgeInsets.only(left: 28.sp, right: 28.sp),
          child: ListView(
            children: [
              SizedBox(
                height: 40.sp,
              ),

              ///Login title
              Titles(
                text: "Upload Documents",
              ),
              SizedBox(
                height: 25.sp,
              ),

              ///Step Progress Indicator
              StepProgressIndicatorsWidget(),
              SizedBox(
                height: 65.sp,
              ),

              //Upload Profile Picture
              UploadProfilePictureWidget(),
              SizedBox(
                height: 25.sp,
              ),

              /// Upload Driving License
              UploadDrivingLicenseWidget(),
              SizedBox(
                height: 25.sp,
              ),

              /// Upload Certificate
              UploadCertificateWidget(),
              SizedBox(
                height: 25.sp,
              ),

              /// Upload Passport
              UploadPassportWidget(),
              SizedBox(
                height: 150.sp,
              ),
              //
              // Done Button
              //
              BlocBuilder<DocumentCounterCubit, DocumentCounterState>(
                builder: (context, state) {
                  return Buttons(
                      text: 'DONE',
                      buttonColor: state.counterValue! >= 4
                          ? ColorsConstants.primaryColorLight
                          : Colors.white54,
                      onPressed: () {
                        if (state.counterValue! >= 4) {
                          Navigator.pushNamed(context, '/dashboard');
                      }
                    }
                  );
                },
              ),
            ],
          )),
    ));
  }
}

