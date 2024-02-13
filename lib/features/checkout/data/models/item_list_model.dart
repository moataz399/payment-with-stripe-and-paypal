class ItemListModel {
  List<OrderItemModel>? orders;

  ItemListModel({this.orders});

  ItemListModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      orders = <OrderItemModel>[];
      json['items'].forEach((v) {
        orders!.add(OrderItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (orders != null) {
      data['items'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItemModel {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  OrderItemModel({this.name, this.quantity, this.price, this.currency});

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    data['currency'] = currency;
    return data;
  }
}