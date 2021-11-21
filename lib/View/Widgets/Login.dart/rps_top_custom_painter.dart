import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';
class RPSTopCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = ColorsConstants.primaryColor
      ..style = PaintingStyle.fill;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*-0.0053333,size.height*0.1199261);
    path0.cubicTo(size.width*-0.0308000,size.height*0.1532512,size.width*0.1136000,size.height*0.1890148,size.width*0.2394933,size.height*0.1463916);
    path0.cubicTo(size.width*0.3612000,size.height*0.0739655,size.width*0.1797067,size.height*0.0545320,size.width*0.2180000,size.height*-0.0036946);
    path0.quadraticBezierTo(size.width*0.1621600,size.height*-0.0036946,size.width*-0.0053333,size.height*-0.0036946);
    path0.quadraticBezierTo(size.width*-0.0346667,size.height*0.0191995,size.width*-0.0053333,size.height*0.1199261);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
