import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';
class RPSTopLeftCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = ColorsConstants.primaryColorLight
      ..style = PaintingStyle.fill;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.0486933,size.height*0.1910468);
    path0.cubicTo(size.width*0.0150400,size.height*0.1573892,size.width*0.0634133,size.height*0.1335468,size.width*0.1545600,size.height*0.1660591);
    path0.cubicTo(size.width*0.2980533,size.height*0.2098522,size.width*0.4550133,size.height*0.1849015,size.width*0.3027200,size.height*0.1314409);
    path0.cubicTo(size.width*0.1401600,size.height*0.0772783,size.width*0.3113867,size.height*0.0046429,size.width*0.4117600,size.height*0.0402956);
    path0.cubicTo(size.width*0.4891467,size.height*0.0563300,size.width*0.5316000,size.height*0.0211084,size.width*0.5011467,size.height*-0.0134975);
    path0.quadraticBezierTo(size.width*0.4409867,size.height*-0.0877463,size.width*0.3860000,size.height*-0.0134975);
    path0.lineTo(size.width*-0.0196000,size.height*-0.0156527);
    path0.lineTo(size.width*-0.0196000,size.height*0.2302956);
    path0.quadraticBezierTo(size.width*0.0710133,size.height*0.2169704,size.width*0.0486933,size.height*0.1910468);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}