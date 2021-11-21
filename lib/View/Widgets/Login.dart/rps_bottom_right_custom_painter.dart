import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';


class RPSBottomRightCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = ColorsConstants.primaryColorLight
      ..style = PaintingStyle.fill;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.6693333,size.height);
    path0.quadraticBezierTo(size.width*0.6840000,size.height*0.9696319,size.width*0.6986667,size.height*0.9472393);
    path0.cubicTo(size.width*0.7213333,size.height*0.9061350,size.width*0.7446667,size.height*0.8846626,size.width*0.7760000,size.height*0.8711656);
    path0.quadraticBezierTo(size.width*0.8480000,size.height*0.8426380,size.width,size.height*0.8503067);
    path0.lineTo(size.width,size.height);
    path0.lineTo(size.width*0.6693333,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}