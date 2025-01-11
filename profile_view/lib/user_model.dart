/*
{
      "gender": "female",
      "name": {
        "title": "Miss",
        "first": "Avery",
        "last": "Gagné"
      },
      "location": {
        "street": {
          "number": 7408,
          "name": "Arctic Way"
        },
        "city": "Notre Dame de Lourdes",
        "state": "New Brunswick",
        "country": "Canada",
        "postcode": "Z6M 7C9",
        "coordinates": {
          "latitude": "-68.0480",
          "longitude": "151.5323"
        },
        "timezone": {
          "offset": "+11:00",
          "description": "Magadan, Solomon Islands, New Caledonia"
        }
      },
      "email": "avery.gagne@example.com",
      "login": {
        "uuid": "351fb293-e652-42a1-aa67-82548114b834",
        "username": "heavylion223",
        "password": "heather",
        "salt": "AxjlNg4P",
        "md5": "44a883229dd4485d63efa548245eafdf",
        "sha1": "e83af6d03f3ccf574134273e4f05f0de7cd0de4a",
        "sha256": "4e8e63924a3fc226cbbf91138b51705303aa3f6131b30e375eeee26e7bc98a1e"
      },
      "dob": {
        "date": "1965-10-07T23:35:23.124Z",
        "age": 59
      },
      "registered": {
        "date": "2008-06-03T07:08:13.708Z",
        "age": 16
      },
      "phone": "D13 S52-2687",
      "cell": "M74 X17-2934",
      "id": {
        "name": "SIN",
        "value": "826762007"
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/48.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/48.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/48.jpg"
      },
      "nat": "CA"
    }
*/

class User
{
  final String name;
  final String email;
  final String phone;
  final String picture;
  final String gender;
  final String city;
  final String country;

  User({required this.name, required this.email, required this.phone, required this.picture, required this.gender, required this.city, required this.country});

  factory User.fromJson(Map<String, dynamic> json)
  {
    return User(
      name: json['name']['title'] + ' ' + json['name']['first'] + ' ' + json['name']['last'],
      email: json['email'],
      phone: json['phone'],
      picture: json['picture']['large'],
      gender: json['gender'],
      city: json['location']['city'],
      country: json['location']['country']
    );
  }
}