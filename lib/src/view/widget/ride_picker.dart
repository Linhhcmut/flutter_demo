import 'package:flutter/material.dart';
import 'package:taxi_application/src/view/location_page.dart';

class RidePicker extends StatefulWidget {
  @override
  _RidePickerState createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103,
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0x88999999),
              offset: Offset(0, 5),
              blurRadius: 5.0,
            )
          ]),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RidePickerPage(),
                  ));
                },
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      Positioned(
                          left: 0,
                          top: 0,
                          height: 50,
                          width: 40,
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.black54,
                          )),
                      Positioned(
                        right: 0,
                        top: 0,
                        width: 40,
                        height: 50,
                        child: Icon(Icons.close, color: Colors.black26),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Text(
                          "Đường D2, Tăng Nhơn Phú B, Quận 9, Thành phố Hồ Chí Minh",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
                onPressed: () {},
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      Positioned(
                          left: 0,
                          top: 0,
                          width: 40,
                          height: 50,
                          child: Icon(
                            Icons.navigation_outlined,
                            color: Colors.black54,
                          )),
                      Positioned(
                        right: 0,
                        top: 0,
                        width: 40,
                        height: 50,
                        child: Icon(Icons.close, color: Colors.black26),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Text("location 2",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54)),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
