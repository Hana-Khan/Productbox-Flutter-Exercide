import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';


class RPSBottomLeftCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = ColorsConstants.primaryColorLight
      ..style = PaintingStyle.fill;
     
         
    Path path0 = Path();
    path0.moveTo(0,size.height*0.7709360);
    path0.quadraticBezierTo(size.width*0.0040000,size.height*0.7986453,size.width*0.0533333,size.height*0.8103448);
    path0.cubicTo(size.width*0.0986667,size.height*0.8189655,size.width*0.1266667,size.height*0.8121921,size.width*0.1760000,size.height*0.8078818);
    path0.quadraticBezierTo(size.width*0.2466667,size.height*0.8051108,size.width*0.2800000,size.height*0.8251232);
    path0.quadraticBezierTo(size.width*0.2993333,size.height*0.8509852,size.width*0.2666667,size.height*0.8596059);
    path0.cubicTo(size.width*0.2406667,size.height*0.8703818,size.width*0.2160000,size.height*0.8793103,size.width*0.1813333,size.height*0.8953202);
    path0.cubicTo(size.width*0.1120000,size.height*0.9264163,size.width*0.1086667,size.height*0.9458128,size.width*0.1920000,size.height*0.9618227);
    path0.quadraticBezierTo(size.width*0.3053333,size.height*0.9716749,size.width*0.3946667,size.height*0.9679803);
    path0.quadraticBezierTo(size.width*0.4660000,size.height*0.9679803,size.width*0.4960000,size.height*0.9667488);
    path0.quadraticBezierTo(size.width*0.5573333,size.height*0.9846059,size.width*0.4666667,size.height);
    path0.lineTo(0,size.height);
    path0.lineTo(0,size.height);
    path0.lineTo(0,size.height);
    path0.lineTo(0,size.height*0.9396552);
    path0.lineTo(0,size.height*0.7709360);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
