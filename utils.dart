import 'dart:io';
import 'dart:convert';
import 'models/product.dart';
import 'models/user.dart';

class Utils {
  File userFile = File('user.json');
  File productFile = File('product.json');

  List<User> users = [];
  List<Product> products = [];

  bool login(String email, String password) {
    List<dynamic> users_dymamic = jsonDecode(userFile.readAsStringSync());
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
    List<dynamic> users_dymamic = jsonDecode(userFile.readAsStringSync());
    users = users_dymamic.map((e) => User.fromJson(e)).toList();

    for (User user in users) {
      if (user.email == email) {
        print('User already exists.');
        return false;
      }
    }
    users.add(User(firstName, lastName, email, password));
    List<dynamic> jsonUsers = users.map((users) => User.toJson(users)).toList();
    userFile.writeAsStringSync(json.encode(jsonUsers));
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
    List<dynamic> products_dymamic = jsonDecode(productFile.readAsStringSync());
    products = products_dymamic.map((e) => Product.fromJson(e)).toList();

    products.add(Product(productName, barCode, cost, cell));
    print(products);

    List<dynamic> jsonProducts =
        products.map((products) => Product.toJson(products)).toList();
    productFile.writeAsStringSync(json.encode(jsonProducts));

    return 'The $productName have been added successfully.';
  }

  bool updateProduct(
      String newProductName, int newCode, int newCost, int newCell) {
    List<dynamic> products_dymamic = jsonDecode(productFile.readAsStringSync());
    products = products_dymamic.map((e) => Product.fromJson(e)).toList();
    for (Product product in products)
      if (product.barCode == newCode) {
        product.productName = newProductName;
        product.cost = newCost;
        product.cell = newCell;
        print('Product $newProductName has been updated.');
        List<dynamic> jsonProducts =
            products.map((products) => Product.toJson(products)).toList();
        productFile.writeAsStringSync(json.encode(jsonProducts));
        products.add(Product("$newProductName", newCode, newCost, newCell));

        return true;
      }
    print('Product not found.');
    return false;
  }

  bool deleteProduct(int code) {
    List<dynamic> products_dymamic = jsonDecode(productFile.readAsStringSync());
    products = products_dymamic.map((e) => Product.fromJson(e)).toList();
    for (Product product in products) {
      if (product.barCode == code) {
        products.remove(product);

        List<dynamic> jsonProducts =
            products.map((products) => Product.toJson(products)).toList();
        productFile.writeAsStringSync(json.encode(jsonProducts));

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
