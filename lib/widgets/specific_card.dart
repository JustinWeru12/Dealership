import 'package:dealership/utils/utils.dart';
import 'package:flutter/material.dart';

class SpecificsCard extends StatelessWidget {
  final double price;
  final String name;
  final String name2;

  SpecificsCard({this.price, this.name, this.name2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: price == null ? 80 : 100,
      width: 100,
      decoration: BoxDecoration(
        // border: Border.all(color: Theme.of(context).accentColor, width: 1),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            offset: Offset(5.0, 5.0),
            blurRadius: 5.0,
          )
        ],
      ),
      child: price == null
          ? Column(
              children: [
                Text(
                  name,
                  style: BodyHeading,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  name2,
                  style: SubHeading,
                ),
              ],
            )
          : Column(
              children: [
                Text(
                  name,
                  style: BodyHeading,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  price.toString(),
                  style: SubHeading,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(name2)
              ],
            ),
    );
  }
}
