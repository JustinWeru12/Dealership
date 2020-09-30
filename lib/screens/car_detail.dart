import 'package:dealership/utils/utils.dart';
import 'package:flutter/material.dart';
import '../widgets/specific_card.dart';

class CarDetail extends StatefulWidget {
  final String title;
  final double price;
  final String color;
  final String gearbox;
  final String fuel;
  final String brand;
  final String path;

  CarDetail(
      {this.title,
      this.price,
      this.color,
      this.gearbox,
      this.fuel,
      this.brand,
      this.path});

  @override
  _CarDetailState createState() => _CarDetailState();
}

class _CarDetailState extends State<CarDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  showInSnackBar(value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        style: TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(context).accentColor,
      duration: new Duration(seconds: 1),
    ));
  }

  var iconData = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  iconData == Icons.favorite_border
                      ? iconData = Icons.favorite
                      : iconData = Icons.favorite_border;
                });
                iconData == Icons.favorite
                    ? showInSnackBar('Added to Favorites')
                    : showInSnackBar('Removed from Favorites');
              },
              icon: Icon(iconData,
                  size: 30, color: Theme.of(context).accentColor)),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.share,
                size: 30,
                color: Theme.of(context).accentColor,
              )),
        ],
      ),
      body: Column(
        children: [
          Text(widget.title, style: MainHeading),
          Text(
            widget.brand,
            style: BodyHeading,
          ),
          Hero(tag: widget.title, child: Image.asset(widget.path)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpecificsCard(
                name: '12 Months',
                price: widget.price * 12,
                name2: 'Dollars',
              ),
              SpecificsCard(
                name: '6 Months',
                price: widget.price * 6,
                name2: 'Dollars',
              ),
              SpecificsCard(
                name: '1 Month',
                price: widget.price * 1,
                name2: 'Dollars',
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            'SPECIFICATIONS',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpecificsCard(
                name: 'Color',
                name2: widget.color,
              ),
              SpecificsCard(
                name: 'Gearbox',
                name2: widget.gearbox,
              ),
              SpecificsCard(
                name: 'Fuel',
                name2: widget.fuel,
              )
            ],
          ),
          SizedBox(height: 20),
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Theme.of(context).accentColor,
            onPressed: () {
              showInSnackBar('Booked');
            },
            child: Text(
              'Book Now',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
