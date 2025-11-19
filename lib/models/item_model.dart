import 'dart:convert';

List<ItemModel> itemModelFromJson(String str) => List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
    String pk;
    int userId;
    String userUsername;
    String name;
    int price;
    String description;
    String thumbnail;
    String category;
    String createdAt;
    int newsViews;

    ItemModel({
        required this.pk,
        required this.userId,
        required this.userUsername,
        required this.name,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.createdAt,
        required this.newsViews,
    });

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        pk: json["pk"].toString(),
        userId: json["user_id"],
        userUsername: json["user_username"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        createdAt: json["created_at"],
        newsViews: json["news_views"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "user_id": userId,
        "user_username": userUsername,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "created_at": createdAt,
        "news_views": newsViews,
    };
}