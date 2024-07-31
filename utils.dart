import 'dart:io';
import 'dart:convert';

import 'models/product.dart';
import 'models/user.dart';

class Utils {
  File file = File('user.txt');
  File productFile = File('product.txt');

  List<User> users = [];
  List<Product> products = [];

// void Read(){

// }
  // File user_file = File('userFile.txt');
  // File product_file = File('productFile.txt');

  // void readLists() {

  //   var json_users = user_file.readAsString();
  //   var json_products = product_file.readAsString();
  //   print(json_users);
  //   print(json_products);
  //}

  bool login(String email, String password) {
    List<dynamic> users_dymamic = jsonDecode(file.readAsStringSync());
    users = users_dymamic.map((e) => User.fromJson(e)).toList();

    for (User user in users) {
      if (user.email == email && user.password == password) {
        print('Login successful.');
        return true;
      }
    }
    print('Invalid username or password.');
    return false;
  }

  bool Register(
      String firstName, String lastName, String email, String password) {
    List<dynamic> users_dymamic = jsonDecode(file.readAsStringSync());
    users = users_dymamic.map((e) => User.fromJson(e)).toList();

    for (User user in users) {
      if (user.email == email) {
        print('User already exists.');
        return false;
      }
    }
    users.add(User(firstName, lastName, email, password));
    List<dynamic> jsonUsers = users.map((users) => User.toJson(users)).toList();
    file.writeAsStringSync(json.encode(jsonUsers));
    print(jsonUsers);
    print(users);

    return true;
  }

  void getUserInfo() {
    for (User user in users) {
      print(user);
    }
  }

  String addProduct(String productName, int barCode, int cost, int cell) {
    products.add(Product(productName, barCode, cost, cell));
    print(products);
    List<Map<String, dynamic>> jsonProducts =
        products.map((product) => Product.toJson(product)).toList();
    productFile.writeAsStringSync('$jsonProducts');
    print(jsonProducts);

    return 'The $productName have been added successfully.';
  }

  bool updateProduct(
      String newProductName, int newCode, int newCost, int newCell) {
    for (Product product in products)
      if (product.barCode == newCode) {
        product.productName = newProductName;
        product.cost = newCost;
        product.cell = newCell;
        print('Product $newProductName has been updated.');
        products.add(Product("$newProductName", newCode, newCost, newCell));
        return true;
      }
    print('Product not found.');
    return false;
  }

  bool deleteProduct(int code) {
    for (Product product in products) {
      if (product.barCode == code) {
        products.remove(product);
        print('Product $code deleted successfully.');
        return true;
      }
    }
    print('Product code doesn`t exist in the List.');
    return false;
  }

  void getAllProducts() {
    for (Product product in products) {
      print(product.toString());
    }
  }
}
