import 'package:dealership/utils/utils.dart';
import 'package:flutter/material.dart';
import '../models/cars.dart';
import '../screens/car_detail.dart';

class CarsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: allCars.cars.length,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => CarDetail(
                      title: allCars.cars[i].title,
                      brand: allCars.cars[i].brand,
                      fuel: allCars.cars[i].fuel,
                      price: allCars.cars[i].price,
                      path: allCars.cars[i].path,
                      gearbox: allCars.cars[i].gearbox,
                      color: allCars.cars[i].color,
                    )));
          },
          child: Container(
              margin: EdgeInsets.only(
                  top: i.isEven ? 0 : 20, bottom: i.isEven ? 20 : 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).accentColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black, blurRadius: 6, spreadRadius: 1,offset: Offset(3.0, 3.0))
                  ]),
              child: Column(
                children: [
                  ClipRRect(
                      // tag: allCars.cars[i].title,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      child: Image.asset(allCars.cars[i].path)),
                  Text(
                    allCars.cars[i].title+'\n',
                    style: BasicHeading,
                  ),
                  Text((allCars.cars[i].price).toString(), style: SubHeading),
                  Text('per month')
                ],
              )),
        ),
      ),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
