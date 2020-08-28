import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_task/src/items/setting_item.dart';
import 'package:flutter_kortobaa_task/src/models/item_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return OrientationBuilder(

      builder: (context, orientation) {
        return Container(
          child: Stack(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(0),
                elevation: 5,
                child: Container(
                  color: Colors.teal,
                  height: 0.3.hp,

                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: orientation == Orientation.portrait?0.2.hp : 0.1.hp),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _accountProfile(orientation),
                ),
              ),

              Positioned(
                child: _settingRow(orientation),
                bottom: orientation == Orientation.portrait?40.h : 0.h,
                width: 1.wp,

              )
            ],
          ),
        );
      }
    );
  }

  Widget _accountProfile(Orientation orientation){

    return Column(
      children: <Widget>[
        ClipOval(
          child: Image.asset(
            'assets/imgs/person.jpg',
            fit: BoxFit.fill,
            height: orientation == Orientation.portrait?400.sp :200.sp,
            width: orientation == Orientation.portrait?400.sp :200.sp,
          ),
        ),

        Text('اسم المستخدم',),

        Text('User99@gmail.com'),

      ],
    );



  }

  Widget _settingRow(Orientation orientation){
    return orientation == Orientation.portrait? Row(
      children: settingList.map((e) => SettingItem(e,orientation)).toList(),
      mainAxisAlignment: MainAxisAlignment.spaceAround,

    )
    :Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding:  EdgeInsets.only(bottom: 10,left: 5),
        child: Column(
          children: settingList.map((e) => SettingItem(e,orientation)).toList(),
          mainAxisAlignment: MainAxisAlignment.spaceAround,

        ),
      ),
    )
    ;
  }

  List<ItemModel> settingList=[
    ItemModel(title: "المفضلة",icon: Icons.star,onClick: (){}),
    ItemModel(title: "الاعدادات",icon: Icons.settings,onClick: (){}),
    ItemModel(title: "تعديل بياناتي",icon: Icons.edit,onClick: (){}),
  ];
}
