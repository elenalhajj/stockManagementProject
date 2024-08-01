class Product {
  String? productName;
  int? barCode;
  int? cost;
  int? cell;

  Product(String productName, int barCode, int cost, int cell) {
    this.productName = productName;
    this.barCode = barCode;
    this.cost = cost;
    this.cell = cell;
  }
  String toString() {
    return 'The product name: ${this.productName}, bar code: ${this.barCode}, cost of the product: ${this.cost}, and the celled product: ${this.cell}';
  }

  static Map<String, dynamic> toJson(Product product) {
    return {
      "productName": product.productName,
      "barCode": product.barCode,
      "cost": product.cost,
      "cell": product.cell,
    };
  }

  static Product fromJson(Map<String, dynamic> jsonn) {
    return Product(
        jsonn["productName"], jsonn["barCode"], jsonn["cost"], jsonn["cell"]);
  }
}
