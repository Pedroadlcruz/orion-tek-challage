class CompanyModel {
  final String name;
  final String? logo;
  const CompanyModel({required this.name, this.logo});

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        name: json['name'] ?? "unknown",
        logo: json['logo'] ??
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtH6ctIDoPfhmlQreh9wC8fy65XzroD6O5Xg&usqp=CAU",
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'logo': logo,
      };

  @override
  String toString() => toJson().toString();
}
