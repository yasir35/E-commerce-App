class CategoriesModel {
  final int id;
  final String name;
  final String image;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,
  });
}

List<CategoriesModel> categories = [
  CategoriesModel(id: 0, name: "Sneakers", image: "assets/images/Sneakers.png"),
  CategoriesModel(id: 1, name: "Formal", image: "assets/images/Formals.png"),
  CategoriesModel(id: 2, name: "Boots", image: "assets/images/Boots.png"),
  CategoriesModel(id: 3, name: "Jackets", image: "assets/images/Jackets.png"),
  CategoriesModel(id: 4, name: "Shirts", image: "assets/images/Shirts.png"),
];
