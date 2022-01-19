import 'package:flutter/material.dart';

class LocationAddress extends StatefulWidget {
  const LocationAddress({ Key? key }) : super(key: key);

  @override
  _LocationAddressState createState() => _LocationAddressState();
}

class _LocationAddressState extends State<LocationAddress> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: Image.asset('address_image.png', width: 600, height: 450),
          ),
          Material(
            color: Colors.black,
            elevation: 8,
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              splashColor: Colors.purpleAccent,
              onTap: () {

              },
            child:Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Ink.image(
                   image: AssetImage('assets/location.png'),
                   height: 30,
                   width: 40,
                   fit: BoxFit.fitHeight,
                 ),
                 SizedBox(width: 6),
                 Text(
                   'Your Location',
                   style: TextStyle(fontSize: 30, color: Colors.white),
                 ),
                 SizedBox(width: 6),
              ],
            )
            ),
          ),
          Padding(padding: EdgeInsets.all(20)),
          Material(
            color: Colors.black,
            elevation: 8,
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
            child:Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Ink.image(
                   image: AssetImage('assets/search.png'),
                   height: 30,
                   width: 40,
                   fit: BoxFit.fitHeight,
                 ),
                 SizedBox(width: 6),
                 Text(
                   'Your Location',
                   style: TextStyle(fontSize: 30, color: Colors.white),
                 ),
                 SizedBox(width: 6),
              ],
            )
            ),
          ),
        ],
      ),
    );
  }
}