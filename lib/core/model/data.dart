class ModelFood {
  String title;
  String ImageUrl;
  String rate;
  String time;
  String discription;

  ModelFood(
      {required this.title,
      required this.ImageUrl,
      required this.rate,
      required this.time,
      required this.discription});

  factory ModelFood.fromMap(Map<String, dynamic> json) {
    return ModelFood(
      title: json['title'] ?? "", // fallback to empty string
      ImageUrl: json['imageUrl'] ?? "",
      rate: (json['rate'] ?? 0).toString(),
      time: (json['time'] ?? 0).toString(),
      discription: json['description'] ?? ""
    );
  }



      Map<String , dynamic> tomap() {
return {
  "title" : title,
  "imageurl" : ImageUrl,
  "rate" : rate,
  "time" : time,
  "description" : discription
  };
}



}


