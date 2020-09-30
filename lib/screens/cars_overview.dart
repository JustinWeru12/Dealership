import 'package:dealership/utils/utils.dart';
import 'package:flutter/material.dart';
import '../widgets/cars_grid.dart';

class CarsOverviewScreen extends StatefulWidget {
  @override
  _CarsOverviewScreenState createState() => _CarsOverviewScreenState();
}

class _CarsOverviewScreenState extends State<CarsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('DEALERSHIP', style: SubHeading),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Available Cars',
              style: MainHeading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CarsGrid(),
          )
        ],
      ),
    );
  }
}
