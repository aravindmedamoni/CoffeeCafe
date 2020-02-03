
import 'package:coffeecafe/utils/constants.dart';
import 'package:flutter/material.dart';

class BannerContainer extends StatelessWidget {
  const BannerContainer({this.containerColor, this.priceColor, this.coffeePrice});

  final Color containerColor,priceColor;
  final String coffeePrice;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200.0,
        decoration: kContainerDecoration.copyWith(
          color: containerColor,
          borderRadius: BorderRadius.circular(18.0),
          image: DecorationImage(
            image: AssetImage('images/coffee.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0,bottom: 12.0),
              child: Text('$coffeePrice'??'Rs.55',style: TextStyle(
                color: priceColor??Colors.black87,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),),
            )),
      ),
    );
  }
}