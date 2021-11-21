import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DrivingLicenseDocumentCubit/driving_license_document_cubit.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/profilePictureDocumentCubit/profile_picture_document_cubit.dart';
import 'package:productbox_flutter_exercise/Cubit/LoginCubit/login_cubit.dart';
import 'package:productbox_flutter_exercise/Cubit/PostCubit/post_cubit.dart';
import 'package:productbox_flutter_exercise/Cubit/UserCubit/user_cubit.dart';
import 'package:productbox_flutter_exercise/Data/Repositories/post_repository.dart';
import 'package:productbox_flutter_exercise/Data/Repositories/user_reposirtory.dart';
import 'package:productbox_flutter_exercise/View/Screens/dashboard_screen.dart';
import 'package:productbox_flutter_exercise/View/Screens/login_screen.dart';
import 'package:productbox_flutter_exercise/View/Screens/upload_documents_screen.dart';
import 'Cubit/DocumentCubit/CertificateDocumentCubit/certificate_document_cubit.dart';
import 'Cubit/DocumentCubit/PassportDocumentCubit/passport_document_cubit.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DocumentsCounterCubit/document_counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      builder: (context, widget) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 0.9),
          child: widget!,
        ),
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
        providers: [
          BlocProvider<UserCubit>(
            create: (context) => UserCubit(UserRepository()),
          ),
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(UserRepository()),
          ),
          BlocProvider<ProfilePictureDocumentCubit>(
            create: (context) => ProfilePictureDocumentCubit(),
          ),
          BlocProvider<CertificateDocumentCubit>(
            create: (context) => CertificateDocumentCubit(),
          ),
          BlocProvider<PassportDocumentCubit>(
            create: (context) => PassportDocumentCubit(),
          ),
          BlocProvider<DrivingLicenseDocumentCubit>(
            create: (context) => DrivingLicenseDocumentCubit(),
          ),
          BlocProvider<DocumentCounterCubit>(
            create: (context) => DocumentCounterCubit(),
          ),
          BlocProvider<PostCubit>(
            create: (context) => PostCubit(PostRepository()),
          ),
        ],
        child: MaterialApp(
          title: 'Currency Exchange Application',
          initialRoute: '/',
          routes: {
            // When navigating to the "/" route, build the MainCLass widget.
            '/': (context) => MainClass(),
             // When navigating to the "/login" route, build the LoginScreen widget.
            '/login': (context) => LoginScreen(),
            // When navigating to the "/uploadDocuments" route, build the SecondScreen widget.
            '/uploadDocuments': (context) => UploadDocumentsScreen(),
            // When navigating to the "/uploadDocuments" route, build the SecondScreen widget.
            '/dashboard': (context) => DashboardScreen(),
          },
          debugShowCheckedModeBanner: false,
        ),
      )
    );
  }
}

class MainClass extends StatefulWidget {
  const MainClass({Key? key}) : super(key: key);
  @override
  _MainClassState createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height
      ),
      designSize: const Size(360, 690),
      orientation: Orientation.portrait
    );
    return LoginScreen();
  }
}
