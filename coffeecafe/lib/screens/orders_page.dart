import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeecafe/components/banner_container.dart';
import 'package:coffeecafe/components/rounded_rectangle_button.dart';
import 'package:coffeecafe/models/coffee_data.dart';
import 'package:coffeecafe/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

final _fireStore = Firestore.instance;

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // Below list is for getting the list from model class
  List<String> coffeeNames, coffeeCupSizes;

  // it is used to change the value of radio button dynamically
  String selectedCoffee;

  //It is cup size variable
  String selectedCupSize;

  // cost variable
  double coffeePrice;

  //text controller
  TextEditingController userNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // whenever our is start
    // Initially set the selectedCoffee values to null because it is string
    selectedCoffee = null;
    coffeePrice = 0.0;
    selectedCupSize = 'Regular';

    // allocates the memory here to our defined list which is declared above
    // by getting the coffeeNames List from model class
    coffeeNames = CoffeeData().coffeeNames;
    coffeeCupSizes = CoffeeData().coffeeCupSizes;
  }

  // this method is used to change the value of selectedCoffee dynamically
  // whenever we select particular radio button
  void setSelectedCoffee(String value) {
    setState(() {
      selectedCoffee = value;
    });
  }

  List<Widget> createRadioListCoffees() {
    List<Widget> coffeeListWidget = [];
    for (String coffeeName in coffeeNames) {
      coffeeListWidget.add(Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: RadioListTile(
              value: coffeeName,
              groupValue: selectedCoffee,
              title: Text(coffeeName),
              onChanged: (currentCoffee) {
                // print('Coffee Name $coffeeName');
                setSelectedCoffee(currentCoffee);
                getPrice();
              },
              selected: selectedCoffee == coffeeName,
              activeColor: Colors.deepOrange,
            ),
          ),
          Expanded(
              flex: 2,
              child: Image.asset(
                'images/coffee.png',
                width: 50,
                height: 50.0,
              )),
        ],
      ));
    }
    return coffeeListWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Cafe'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        //color: Colors.grey[400],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Our Specials',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  height: 180.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      
                      BannerContainer(
                        containerColor: Colors.orange,
                        coffeePrice: 'Rs.78',
                        priceColor: Colors.white,
                      ),
                      BannerContainer(
                        containerColor: Colors.blue,
                        coffeePrice: 'Rs.90',
                        priceColor: Colors.white,
                      ),
                      BannerContainer(
                        containerColor: Colors.purpleAccent,
                        coffeePrice: 'Rs.100',
                        priceColor: Colors.white,
                      ),
                      BannerContainer(
                        containerColor: Colors.red,
                        coffeePrice: 'Rs.55',
                        priceColor: Colors.white,
                      ),

                      BannerContainer(
                        containerColor: Colors.yellow,
                        coffeePrice: 'Rs.65',

                      ),
                      BannerContainer(
                        containerColor: Colors.pink,
                        coffeePrice: 'Rs.80',
                        priceColor: Colors.white,
                      ),

                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'User Name',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 6.0,
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.redAccent,
                  ),
                  child: TextField(
                    controller: userNameController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: kTextFieldDecoration,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Select Coffee',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Column(
                  children: createRadioListCoffees(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Select Cup Size',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                      DropdownButton(
                        elevation: 5,
                        value: selectedCupSize,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30.0,
                          color: Colors.blue,
                        ),
                        iconSize: 30.0,
                        items: coffeeCupSizes
                            .map<DropdownMenuItem<String>>((String newcupSize) {
                          return DropdownMenuItem<String>(
                              value: newcupSize, child: Text(newcupSize));
                        }).toList(),
                        onChanged: (changedCupSize) {
                          setState(() {
                            selectedCupSize = changedCupSize;
                            getPrice();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Total Price',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Rs. $coffeePrice',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                      RoundedRectangleButton(
                          onPress: () {
                            if (userNameController.text.isNotEmpty &&
                                selectedCoffee.isNotEmpty &&
                                selectedCupSize.isNotEmpty) {
                              // to get the System date and time
                              var formatter = DateFormat('yyyy-MM-dd hh:mma');
                              String formattedDate =
                                  formatter.format(DateTime.now());
                              // print(formattedDate);
                              _fireStore.collection('orders').add({
                                'orderBy': userNameController.text,
                                'coffeeType': selectedCoffee,
                                'cupSize': selectedCupSize,
                                'totalPrice': coffeePrice,
                                'time': formattedDate,
                                //'time':,
                              });
                              Toast.show(
                                  'Successfully Placed your order.', context,
                                  backgroundRadius: 18.0);
                              Navigator.of(context).pop();
                            } else {
                              Toast.show('All Fields are required.', context,
                                  backgroundRadius: 18.0);
                            }
                          },
                          buttonName: 'Place Order',
                          buttonColor: Colors.blueGrey[900])
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // getting the coffee cost based on your selection
  void getPrice() {
    if (selectedCoffee == 'Capetuno' && selectedCupSize == 'Regular') {
      setState(() {
        coffeePrice = num.parse((110 * 1.1).toStringAsFixed(2));
      });
    } else if (selectedCoffee == 'Capetuno' && selectedCupSize == 'Medium') {
      setState(() {
        coffeePrice = num.parse((110 * 2.5).toStringAsFixed(2));
      });
    } else if (selectedCoffee == 'Capetuno' && selectedCupSize == 'Large') {
      setState(() {
        coffeePrice = num.parse((110 * 3.1).toStringAsFixed(2));
      });
    } else if (selectedCoffee == 'Espresso' && selectedCupSize == 'Regular') {
      setState(() {
        coffeePrice = num.parse((75 * 1.1).toStringAsFixed(2));
      });
    } else if (selectedCoffee == 'Espresso' && selectedCupSize == 'Medium') {
      setState(() {
        coffeePrice = num.parse((75 * 2.5).toStringAsFixed(2));
      });
    } else if (selectedCoffee == 'Espresso' && selectedCupSize == 'Large') {
      setState(() {
        // value = ;
        coffeePrice = num.parse((75 * 3.1).toStringAsFixed(2));
      });
    } else if (selectedCoffee == 'Latte' && selectedCupSize == 'Regular') {
      setState(() {
        coffeePrice = num.parse((50 * 1.1).toStringAsFixed(2));
      });
    } else if (selectedCoffee == 'Latte' && selectedCupSize == 'Medium') {
      setState(() {
        coffeePrice = num.parse((50 * 2.5).toStringAsFixed(2));
      });
    } else if (selectedCoffee == 'Latte' && selectedCupSize == 'Large') {
      setState(() {
        coffeePrice = num.parse((50 * 3.1).toStringAsFixed(2));
      });
    }
  }
}


