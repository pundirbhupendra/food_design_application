class Category {
  final String name;
  final int price;
  final String foodImage;

  const Category({this.name, this.price, this.foodImage});
}

List<Category> foodCategories = categories
    .map((item) => Category(
        name: item['name'], price: item['price'], foodImage: item['image']))
    .toList();

var categories = [
  {"name": "Burger", "price": 25, "image": "assets/images/sandwich.png"},
  {"name": "Piza", "price": 15, "image": "assets/images/pizza.png"},
  {"name": "Donuts", 'price': 12, 'image': "assets/images/doughnut.png"},
  {"name": "Angry Whopper", 'price': 350, 'image': "assets/images/burg.png"},
];
