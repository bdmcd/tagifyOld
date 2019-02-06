import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          // Padding(
          //   padding: EdgeInsets.only(left: 12.0),
          //   child: Icon(Icons.airline_seat_recline_extra),
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Track Name", style: Theme.of(context).textTheme.subhead),
                  Text("Artist - Album", style: Theme.of(context).textTheme.caption),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}