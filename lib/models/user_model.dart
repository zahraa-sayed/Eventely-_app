class UserModel {
  static UserModel? currentUser;
  String id;
  String name;
  String email;
  List<String> favouriteEventsIds;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.favouriteEventsIds,
  });

  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        favouriteEventsIds: (json["favouriteEventsIds"] as List<dynamic>)
            .map((favEventId) => favEventId.toString())
            .toList(),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "favouriteEventsIds": favouriteEventsIds,
  };
}
