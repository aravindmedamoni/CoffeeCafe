import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeecafe/components/fancy_floating_action_button.dart';
import 'package:coffeecafe/screens/orders_page.dart';
import 'package:coffeecafe/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffeecafe/utils/extensions.dart';

final _firestore = Firestore.instance;

class OrdersDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Orders'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        color: Colors.grey[350],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: OrdersStream(),
      ),
      floatingActionButton: FancyFloatingActionButton(
          buttonName: 'Order Now',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OrdersPage();
            }));
          }),
    );
  }
}

class OrdersStream extends StatelessWidget {
  const OrdersStream({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('orders').snapshots(),
        builder: (context, snopshot) {
          if (!snopshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.blueGrey,
            ));
          }

          final orders = snopshot.data.documents;
          List<Widget> orderDetailsCards = [];

          for (var order in orders) {
            final coffeeName = order.data['coffeeType'];
            final cupSize = order.data['cupSize'];
            final totalCost = order.data['totalPrice'];
            var time = order.data['time'];
            orderDetailsCards.add(Container(
              decoration: kContainerDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                coffeeName ?? '',
                                style: kTextStyle.copyWith(fontSize: 18.0,
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold
                                ),

                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                cupSize ?? '',
                                style: kTextStyle.copyWith(
                                  color: Colors.blueGrey
                                ),
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 10.0),
                        ),
                      ),
                      Expanded(child: Image.asset('images/coffee.png', width: 80.0, height: 80.0,))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '$totalCost'??'', style: kTextStyle.copyWith(
                                color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                            ),
                            ),
                            TextSpan(
                              text: ' INR',style: kTextStyle.copyWith(
                              color: Colors.black87,
                              fontSize: 14.0
                            )
                            )
                          ]
                        ),
                      ),
                      Text(time.toString(), style: kTextStyle.copyWith(
                        fontWeight: FontWeight.w500
                      )),
                    ],
                  ).paddingSymmetric(horizontal: 10.0),
                ],
              ).paddingSymmetric(vertical: 14.0,horizontal: 12.0),
            ).paddingSymmetric(vertical: 8.0));
          }
          return ListView(
            children: orderDetailsCards,
          ).paddingOnly(bottom: 65.0,left: 10.0,top: 10.0,right: 10.0);
        });
  }
}
