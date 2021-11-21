import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Cubit/LoginCubit/login_cubit.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';
import 'package:productbox_flutter_exercise/View/Widgets/Login.dart/forgot_password_widget.dart';
import 'package:productbox_flutter_exercise/View/Widgets/Login.dart/rps_bottom_left_custom_painter.dart';
import 'package:productbox_flutter_exercise/View/Widgets/Login.dart/rps_bottom_right_custom_painter.dart';
import 'package:productbox_flutter_exercise/View/Widgets/Login.dart/rps_top_custom_painter.dart';
import 'package:productbox_flutter_exercise/View/Widgets/Login.dart/rps_top_left_custom_painter.dart';
import 'package:productbox_flutter_exercise/View/Widgets/buttons.dart';
import 'package:productbox_flutter_exercise/View/Widgets/Login.dart/register_widget.dart';
import 'package:productbox_flutter_exercise/View/Widgets/showToast.dart';
import 'package:productbox_flutter_exercise/View/Widgets/textfields.dart';
import 'package:productbox_flutter_exercise/View/Widgets/titile.dart';

class LoginScreen extends StatelessWidget{
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String email, password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsConstants.backgroundColor,
        body: BlocListener<LoginCubit, LoginState>(
          listener: (context, loginstate) {
            if (loginstate is LoginSuccess) {
              showToastMessage(msg:loginstate.loginResult);
              Future.delayed(Duration(seconds: 1)).then((value) => 
                Navigator.pushNamed(context, '/uploadDocuments')
              ).then((value) {
                emailController.clear();
                passwordController.clear();
              });
              
            }
            if (loginstate is LoginNoInternetError) {
              showToastMessage(msg:'No internet connection available');
            }
            if (loginstate is LoginUnsuccess) {
               showToastMessage(msg:loginstate.loginResult);
            }
            if (loginstate is LoginError) {
              showToastMessage(msg:loginstate.loginResult);
            }
          },
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              width: 1.sw,
              height: 1.sh,
              child: ListView(
                children: [
                  /// Bottom Design widget
                  Container(
                    height: 0.2.sh,
                    child: Stack(
                      children: [
                        buildTopLeftCustomPaint(),
                        buildTopCustomPaint(),
                      ],
                    )
                  ),
                  // LoginForm
                  Container(
                    width: 1.sw,
                    height: 0.61.sh,
                    padding: EdgeInsets.only(left: 18.sp, right: 18.sp),
                    child: Form(
                        key: _formKey,
                        child: ListView(
                          physics: ClampingScrollPhysics(),
                          children: [
                            SizedBox(
                              height: 30.sp,
                            ),
          
                            ///Login title
                            Titles(
                              text: "Log In",
                            ),
                            SizedBox(
                              height: 30.sp,
                            ),
          
                            ///Email Address textfield
                            TextFields(
                              hintText: 'Email Address',
                              controller: emailController,
                              validator: (emailValue) {
                                RegExp emailRegex = RegExp(
                                    r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                                if (emailValue!.isEmpty) {
                                  return 'Enter email.';
                                } else if (!(emailRegex
                                    .hasMatch(emailValue))) {
                                  return "Invalid Email";
                                } else
                                  email = emailValue;
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
          
                            /// Password textfield
                            TextFields(
                                hintText: 'Password',
                                controller: passwordController,
                                validator: (passwordValue) {
                                  if (passwordValue!.isEmpty) {
                                    return 'Enter password';
                                  } else
                                    password = passwordValue;
                                  return null;
                                }),
                            SizedBox(
                              height: 15.sp,
                            ),
          
                            /// Login Button
                            Buttons(
                              text: 'LOGIN',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  BlocProvider.of<LoginCubit>(context).authenticateUser(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                }
                              }
                            ),
                            SizedBox(
                              height: 20.sp,
                            ),
          
                            /// Forgot Password
                            ForgotPasswordWidget(),
                            SizedBox(
                              height: 40.sp,
                            ),
          
                          /// Register Here
                          RegisterWidget(),
                        ],
                      ),
                    )
                  ),
                  // Bottom Design widget
                  Container(
                    height: 0.15.sh,
                    child: Stack(
                      children: [
                        buildBottomLeftCustomPaint(),
                        buildBottomRightCustomPaint(),
                      ],
                    )
                  ),
                ],
              )
            ),
          )
        ),
      )
    );
  }

  Positioned buildBottomRightCustomPaint() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: CustomPaint(
        size: Size(1.sw, 600.sp),
        painter: RPSBottomRightCustomPainter(),
      ),
    );
  }

  Positioned buildBottomLeftCustomPaint() {
    return Positioned(
      bottom: 0,
      left: 0,
      child: CustomPaint(
        size: Size(300.sp, 500.sp),
        painter: RPSBottomLeftCustomPainter(),
      ),
    );
  }

  Positioned buildTopCustomPaint() {
    return Positioned(
      top: 0,
      left: 0,
      child: CustomPaint(
        size: Size(300.sp, 600.sp),
        painter: RPSTopCustomPainter(),
      ),
    );
  }

  Positioned buildTopLeftCustomPaint() {
    return Positioned(
      top: 10.sp,
      left: 0,
      child: CustomPaint(
        size: Size(1.sw, 590.sp),
        painter: RPSTopLeftCustomPainter(),
      ),
    );
  }
}
