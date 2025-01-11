class User
{
  final String title;
  final String subtitle;
  final String publisher;
  final String picture;
  final String price;
  final String description;
  final String buyLink;


  User({required this.title, required this.subtitle, required this.publisher, required this.picture, required this.price, required this.description, required this.buyLink});

  factory User.fromJson(Map<String, dynamic> json)
  {
    return User(
       title: json['volumeInfo']['title'] ?? 'No Title',
      subtitle: json['volumeInfo']['subtitle'] ?? '',
      publisher: json['volumeInfo']['publisher'] ?? 'Unknown Publisher',
      picture: json['volumeInfo']['imageLinks']['thumbnail'] ?? '',
      price: json['saleInfo']['retailPrice'] != null
          ? '${json['saleInfo']['retailPrice']['amount']} ${json['saleInfo']['retailPrice']['currencyCode']}'
          : 'Free',
      description: json['volumeInfo']['description'] ?? 'No Description',
      buyLink: json['saleInfo']['buyLink'] ?? '', 
    );
  }
}