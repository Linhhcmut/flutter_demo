import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RidePickerPage extends StatefulWidget {
  @override
  _RidePickerPageState createState() => _RidePickerPageState();
}

class _RidePickerPageState extends State<RidePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xfff8f8f8),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,            
              width: double.infinity,
              height: 60,
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: <Widget>[
                  SizedBox(
                    width: 40,
                    height: 60,
                    child: Center(
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Positioned(
                      right: 10,
                      top: 0,
                      width: 40,
                      height: 60,
                      child: Center(
                        child: FlatButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.close,
                              color: Colors.black54,
                            )),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(right: 50, left: 40),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter a search the location",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87)
                            )
                          ),
                          textInputAction: TextInputAction.search,
                          onSubmitted: (str) {},
                          style: TextStyle(fontSize: 17, color: Colors.black87),
                        ),
                      ), 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
