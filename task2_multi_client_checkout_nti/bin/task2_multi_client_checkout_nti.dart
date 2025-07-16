import 'dart:io';

void showMenu() {
  print("Welcome to the store!\n"
      "Available products:\n"
      "1. Keyboard - \$100\n"
      "2. Mouse - \$50\n"
      "3. Monitor - \$300\n"
      "4. USB Cable - \$20\n"
      "5. Headphones - \$150");
}

double calculateTax(double amount)
 {
  return amount * 0.13;
}

double calculateDiscount(double amount) 
{
  return 0; 
}

double calculateDeliveryFee(double distance)
 {
  if (distance <= 10)
   {
    return 20.0;
  } 
  else if (distance <= 20) 
  {
    return 30.0;
  }
   else {
    return 45.0;
  }
}

void main() {
  Map<int, Map<String, dynamic>> products = {
    1: {"name": "Keyboard"   , "price": 100},
    2: {"name": "Mouse"      , "price": 50},
    3: {"name": "Monitor"    , "price": 300},
    4: {"name": "USB Cable"  , "price": 20},
    5: {"name": "Headphones" , "price": 150},
  };

  while (true) {
    showMenu(); 
    double subtotal = 0;

    while (true) {
      print("\nEnter product number to add to cart (0 to finish, or type 'menu' to show products again):");
      String? input = stdin.readLineSync();

      if (input == "menu") {
        showMenu();
        continue;
      }

      int productNumber = int.parse(input!);

      if (productNumber == 0) {
        break;
      }

      if (products.containsKey(productNumber)) {
        print("Enter quantity:");
        int quantity = int.parse(stdin.readLineSync()!);
        double price = (products[productNumber]!["price"] as int).toDouble();
        subtotal += price * quantity;
      } else {
        print("Invalid product number.");
      }
    }

    print("\nPlease enter your name:");
    String? name = stdin.readLineSync();

    print("Please enter your phone number:");
    String? phone = stdin.readLineSync();

    double tax = calculateTax(subtotal);
    double discount = calculateDiscount(subtotal);
    double deliveryFee = 0;

    print("Do you want delivery? (yes/no):");
    String? delivery = stdin.readLineSync();

    if (delivery == "yes") {
      print("Enter delivery distance in km:");
      double distance = double.parse(stdin.readLineSync()!);
      deliveryFee = calculateDeliveryFee(distance);
    }

    double total = subtotal + tax + deliveryFee - discount;
print("Receipt for $name\n" "Phone: $phone\n"
  "Subtotal: \$${subtotal.toStringAsFixed(2)}\n"
  "Tax (13%): \$${tax.toStringAsFixed(2)}\n"
  "Discount: \$${discount.toStringAsFixed(2)}\n"
  "Delivery Fee: \$${deliveryFee.toStringAsFixed(2)}\n"
  "Total amount to pay: \$${total.toStringAsFixed(2)}\n"
  "Thank you for shopping with us, $name!\n");
    print("Ready for next customer...\n");
  }
}