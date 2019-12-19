import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserWidget extends StatelessWidget {

  final String image;
  final String name;

  const UserWidget({Key key, this.image, this.name}) : super(key: key);

  // 圆形图片
  getImage(var imgUrl) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
//          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
//      margin: EdgeInsets.only(left: 8, top: 3, right: 8, bottom: 3),
      height: 80.0,
      width: 80.0,
    );
  }

  // 圆形头像
//    CircleAvatar(
//      backgroundImage: NetworkImage( 'url'),
//      radius: 100,
//    ),

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 80, 20, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getImage(
              image,
              ),
          SizedBox(
            width: ScreenUtil().setWidth(50),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Text(
                name,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(35),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(1),
              ),
              Image.asset(
                'images/mine_vip_code.png',
                height: ScreenUtil().setHeight(75),
                width: ScreenUtil().setHeight(100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
