import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      child: Stack(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(0),
            elevation: 5,
            child: Container(
              color: Colors.teal,
              height: MediaQuery.of(context).size.height*0.3,

            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
            child: Align(
              alignment: Alignment.topCenter,
              child: _accountProfile(),
            ),
          )
        ],
      ),
    );
  }

  Widget _accountProfile(){

    return Column(
      children: <Widget>[
        ClipOval(
          child: Image.asset(
            'assets/imgs/person.jpg',
            fit: BoxFit.fill,
            height: ScreenUtil().setSp(400,allowFontScalingSelf: true),
            width: ScreenUtil().setSp(400,allowFontScalingSelf: true),
          ),
        ),

        Text('اسم المستخدم',),

        Text('User99@gmail.com'),

      ],
    );



  }
}
