import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Cubit/LoginCubit/login_cubit.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';

class Buttons extends StatelessWidget {
  final String? text;
  final Color? buttonColor;
  final Function()? onPressed;

  const Buttons({
    Key? key,
    this.text,
    this.onPressed,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        height: 52.0.sp,
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          left: 18.sp,
          right: 18.sp,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0.r),
          color: buttonColor ??ColorsConstants.primaryColor, // const Color(0xFFE6E6E6),
        ),
        child: 
        // Text(
        //   text ?? '',
        //   style: TextStyle(
        //     fontSize: 18.0.sp,
        //     color: ColorsConstants.white,
        //     fontWeight: FontWeight.w600,
        //     ),
        //   )
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if(state is LoginLoading){
              // final isLoginSuccess=state.isLoginSuccess;
            return Center(child: CircularProgressIndicator(
              color: ColorsConstants.white,));
                                
          }
          else{
            return
             Text(
              text ?? '',
              style: TextStyle(
                fontSize: 18.0.sp,
                color: ColorsConstants.white,
                fontWeight: FontWeight.w600,
                ),
              )
              ;
            }
          }
        ),
      ),
    );
  }
}
