import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Cubit/PostCubit/post_cubit.dart';
import 'package:productbox_flutter_exercise/Cubit/PostCubit/post_state.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';
import 'package:productbox_flutter_exercise/View/Widgets/Dashboard.dart/no_internet_widget.dart';
import 'package:productbox_flutter_exercise/View/Widgets/Dashboard.dart/post_widget.dart';
import 'package:productbox_flutter_exercise/View/Widgets/Dashboard.dart/circular_story_widget.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PostCubit>(context).getListOfPosts();
  }

  String storyImageUrl ="https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?cs=srgb&dl=pexels-pixabay-415829.jpg";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstants.white,
        body: Container(
          width: 1.sw,
          height: 1.sh,
          child: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              if(state is PostsListLoading){
                return Center(child: CircularProgressIndicator(
                  color: ColorsConstants.primaryColorLight,
                ));
              }
              if(state is PostsNoInternetError){
                return NoInternetWidget();
              }
              if(state  is PostsListLoaded){
                final posts=state.posts;
                return Column(
                  children: [
                    SizedBox(height: 30.sp),
                    // 
                    // Horizontal scrollable list of circular stories widgets
                    // 
                    Expanded(
                      flex: 1,
                      child: Container(
                        // padding: EdgeInsets.only(left: 20.sp),
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return CircularStoryWidget  (
                              isFirstStory: index==0?true:false,
                              storyImageUrl: storyImageUrl
                            );
                          }
                        ),
                      )
                    ),
                    SizedBox(height: 10.sp),
                    
                    ///Vertical List of Posts widgets 
                    Expanded(
                      flex: 7,
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return PostWidget(
                            authorName:posts[index].author!,
                            authorProfileImageUrl:storyImageUrl, 
                            postsUrl: posts[index].downloadUrl!);
                            }
                          )
                        ),
                      ],
                    );
                  }else{
                  return Container();
                }
              }
            )
          ),
        )
    );
  }
}


