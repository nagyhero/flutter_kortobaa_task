import 'package:flutter/material.dart';
import 'package:flutter_kortobaa_task/src/models/post_model.dart';

class PostItem extends StatelessWidget {

  PostModel _postModel;

  PostItem(this._postModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          _headRow(),

        ],
      ),
    );
  }

  Widget _headRow(){
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Icon(Icons.favorite),
              Icon(Icons.turned_in),
              Icon(Icons.share),
            ],
          ),
        ),

        Expanded(
          child: Row(
            children: <Widget>[
              Text(
                _postModel.userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }


}
