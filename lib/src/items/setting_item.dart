import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_task/src/models/item_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItem extends StatelessWidget {

  ItemModel _itemModel;

  SettingItem(this._itemModel);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GestureDetector(
      onTap: _itemModel.onClick,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 80.ssp,
            child: Icon(
              _itemModel.icon,
              color: Colors.white,
            ),
          ),
          Text(
            _itemModel.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 45.sp
            ),
          )
        ],
      ),
    );
  }
}
