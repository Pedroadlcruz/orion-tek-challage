class CompanyModel {
  final String id;
  final String name;
  final String? logo;
  const CompanyModel({required this.name, required this.id, this.logo});

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json['id'] ?? "unknown",
        name: json['name'] ?? "unknown",
        logo: json['logo'] ??
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtH6ctIDoPfhmlQreh9wC8fy65XzroD6O5Xg&usqp=CAU",
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'logo': logo,
      };

  @override
  String toString() => toJson().toString();
}
