import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel/app/modules/home/views/SwiperModel.dart';

class SwiperCard extends StatelessWidget {
  SwiperCard({super.key, required this.swper});
  final SwiperModel swper;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(swper.img!),
                fit: BoxFit.cover,
              ),
              color: CupertinoColors.activeBlue,
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              margin: EdgeInsets.only(bottom: 50),
              height: 50.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(swper.city!),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(swper.contry!),
                    ],
                  ),
                ],
              )),
        ),
        Container(
          child: Icon(
            Icons.chevron_right,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
