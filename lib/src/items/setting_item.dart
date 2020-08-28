import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_task/src/models/item_model.dart';
import 'package:flutter_kortobaa_task/src/utils/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItem extends StatelessWidget {

  ItemModel _itemModel;
  Orientation orientation;

  SettingItem(this._itemModel,this.orientation);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GestureDetector(
      onTap: _itemModel.onClick,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius:  orientation == Orientation.portrait?0.08.wp : 0.03.wp,
            backgroundColor: appThemeData(context).primaryColor,
            child: Icon(
              _itemModel.icon,
              color: Colors.white,
            ),
          ),
          Text(
            _itemModel.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: orientation == Orientation.portrait?45.sp : 25.sp
            ),
          )
        ],
      ),
    );
  }
}
