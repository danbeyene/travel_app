class DataModel {
  String name = '';
  String description = '';
  int price = 0;
  int stars = 0;
  int people = 0;
  String img = '';
  String location = '';
  DataModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.stars,
      required this.people,
      required this.img,
      required this.location});
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json['name'],
        description: json['description'],
        price: json['price'],
        stars: json['stars'],
        people: json['people'],
        img: json['img'],
        location: json['location']);
  }

  //  DataModel.fromJson(Map<String,dynamic> json){
  //   json['name']=name;
  //   json['description']=description;
  //   json['price']=price;
  //   json['stars']=stars;
  //   json['people']=people;
  //   json['img']=img;
  //   json['location']=location;
  // }
  Map<String, dynamic> toJson() {
    // Map<String,dynamic> data = <String,dynamic>{};
    // data['name']=name;
    // data['description']=description;
    // data['price']=price;
    // data['stars']=stars;
    // data['people']=people;
    // data['img']=img;
    // data['location']=location;
    // return data;
    return {
      'name': name,
      'description': description,
      'price': price,
      'stars': stars,
      'people': people,
      'img': img,
      'location': location
    };
  }
}
