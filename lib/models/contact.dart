class Contact {

  String id;
  String user;
  String phone;
  String image;
  String check_in;
  

  Contact({this.id = "",
      this.user = "",
      this.phone = "",
      this.image = "",
      this.check_in = "",
      });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      user: json['user'],
      phone: json['phone'],
      image: json['image'],
      check_in: json['check-in']
      
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['check-in'] = this.check_in;
    return data;
  }

}