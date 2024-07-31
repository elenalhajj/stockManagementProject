import 'dart:io';
import 'models/user.dart';
import 'utils.dart';

Utils utils = new Utils();

void main() {
//   // write to file'
  //  productFile.writeAsStringSync('{"name":"elena","age":13}');
//   print('File written.');

  // print('File written.');
  String? authentication_option;
  do {
    print(
        'Hello World!\n\nPlease enter an option : \n\n1 - Login\n2 - Register \n3 - Exit\n');

    authentication_option = stdin.readLineSync();

    switch (authentication_option) {
      case "1":
        loginMenu();
        productMenu();

        break;

      case "2":
        registerMenu();
        productMenu();

        break;

      case "3":
        break;
    }
  } while (authentication_option != '3');
















  
  utils.getUserInfo();

  void usersList() {
    List<User> users = [];
    for (User user in users) {
      print(user);
    }
  }
}

void productMenu() {
  String? product_option;
  Utils productShop = new Utils();
  do {
    print(
        'Please enter an option: \n1- Add product:\n2- Get all product:\n3- Update product:\n4- Delete product:\n5- Exit.');
    product_option = stdin.readLineSync();
    switch (product_option) {
      case "1":
        print("Hello, please add the product you want.");
        print('Enter the product name:');
        String? productName = stdin.readLineSync();
        print('Enter the barCode:');
        int? barCode = int.parse(stdin.readLineSync()!);
        print('Enter the cost:');
        int? cost = int.parse(stdin.readLineSync()!);
        print('Enter the cell:');
        int cell = int.parse(stdin.readLineSync()!);
        print(productShop.addProduct("$productName", barCode, cost, cell));
        break;

      case "2":
        print('Please get all product infos.');
        productShop.getAllProducts();

        break;

      case "3":
        print('Please enter the new product you want.');
        print('Product new name:');
        String? newProductName = stdin.readLineSync();
        print('Product new barCode:');
        int? newCode = int.parse(stdin.readLineSync()!);
        print('Product new cost:');
        int? newCost = int.parse(stdin.readLineSync()!);
        print('Product new cells:');
        int? newCell = int.parse(stdin.readLineSync()!);
        print(productShop.updateProduct(
            "$newProductName", newCode, newCost, newCell));

        break;

      case "4":
        print('Delete the product you want.');
        print('Enter product name:');
        int? code = int.parse(stdin.readLineSync()!);
        productShop.deleteProduct(code);
        break;

      case "5":
        break;
    }
  } while (product_option != '5');
}

void loginMenu() {
  print('Please enter your Email: ');
  String? email = stdin.readLineSync();
  print('Please enter your Password: ');
  String? password = stdin.readLineSync();
  Utils utils = new Utils();
  utils.login("$email", "$password");
}

void registerMenu() {
  print('Please enter your first name.');
  String? firstName = stdin.readLineSync();
  print('Please enter your last name.');
  String? lastName = stdin.readLineSync();
  String? newEmail;
  bool conatainEmailconditions = false;
  print('Please enter your new email.');
  String? Ad = '@';
  String? Com = '.';
  newEmail = stdin.readLineSync();
  do {
    if (newEmail?.contains(Ad) == true && newEmail?.contains(Com) == true) {
      break;
    } else {
      print('Invalid email, please enter your email again:');
      newEmail = stdin.readLineSync();
    }
  } while (conatainEmailconditions == false);

  print('Please enter your new password.');
  String? newPassword = stdin.readLineSync();

  utils.Register("$firstName", "$lastName", "$newEmail", "$newPassword");
}
