
import 'dart:collection';

class CoffeeData{
  List<String> _coffeeNames = [
    'Capetuno',
    'Espresso',
    'Latte'
  ];

  UnmodifiableListView<String> get coffeeNames{
    return UnmodifiableListView(_coffeeNames);
  }

  List<String> _coffeeCupSize = [
    'Regular',
    'Medium',
    'Large'
  ];

  UnmodifiableListView<String> get coffeeCupSizes{
    return UnmodifiableListView(_coffeeCupSize);
  }
}