class PriceData {

  PriceData({this.selectedCoffee, this.selectedCupSize});

  String selectedCoffee, selectedCupSize;

  // getting the coffee cost based on your selection
  double getPrice() {
    double coffeePrice;

    if (selectedCoffee == 'Capetuno' && selectedCupSize == 'Regular') {
      coffeePrice = num.parse((110 * 1.1).toStringAsFixed(2));
    } else if (selectedCoffee == 'Capetuno' && selectedCupSize == 'Medium') {
      coffeePrice = num.parse((110 * 2.5).toStringAsFixed(2));
    } else if (selectedCoffee == 'Capetuno' && selectedCupSize == 'Large') {
      coffeePrice = num.parse((110 * 3.1).toStringAsFixed(2));
    } else if (selectedCoffee == 'Espresso' && selectedCupSize == 'Regular') {
      coffeePrice = num.parse((75 * 1.1).toStringAsFixed(2));
    } else if (selectedCoffee == 'Espresso' && selectedCupSize == 'Medium') {
      coffeePrice = num.parse((75 * 2.5).toStringAsFixed(2));
    } else if (selectedCoffee == 'Espresso' && selectedCupSize == 'Large') {
      // value = ;
      coffeePrice = num.parse((75 * 3.1).toStringAsFixed(2));
    } else if (selectedCoffee == 'Latte' && selectedCupSize == 'Regular') {
      coffeePrice = num.parse((50 * 1.1).toStringAsFixed(2));
    } else if (selectedCoffee == 'Latte' && selectedCupSize == 'Medium') {
      coffeePrice = num.parse((50 * 2.5).toStringAsFixed(2));
    } else if (selectedCoffee == 'Latte' && selectedCupSize == 'Large') {
      coffeePrice = num.parse((50 * 3.1).toStringAsFixed(2));
    }

    return coffeePrice;
  }

}