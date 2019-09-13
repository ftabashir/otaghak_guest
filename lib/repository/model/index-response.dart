class IndexResponse {
  int status;
  String message;
  List<Box> data;

  IndexResponse({this.status, this.message, this.data});

  IndexResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['data'] != null) {
      data = new List<Box>();
      json['data'].forEach((v) {
        data.add(new Box.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Box {
  String categoryName;
  String code;
  String type;
  List<Room> rooms;
  List<Contents> contents;

  Box({this.categoryName, this.code, this.type, this.rooms, this.contents});

  Box.fromJson(Map<String, dynamic> json) {
    categoryName = json['CategoryName'];
    code = json['Code'];
    type = json['Type'];
    if (json['Rooms'] != null) {
      rooms = new List<Room>();
      json['Rooms'].forEach((v) {
        rooms.add(new Room.fromJson(v));
      });
    }
    if (json['Contents'] != null) {
      contents = new List<Contents>();
      json['Contents'].forEach((v) {
        contents.add(new Contents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryName'] = this.categoryName;
    data['Code'] = this.code;
    data['Type'] = this.type;
    if (this.rooms != null) {
      data['Rooms'] = this.rooms.map((v) => v.toJson()).toList();
    }
    if (this.contents != null) {
      data['Contents'] = this.contents.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Room {
  String imageSourceFileName;
  int objectId;
  String title;
  double basePrice;
  int personCapacity;
  int babyCapacity;
  int childrenCapacity;
  String score;
  String imageSizeCode;
  String imageUrl;
  double longitude;
  double latitude;
  String cityName;
  String houseTypeName;
  bool myFavorite;
  double discount;
  double afterDiscountPrice;
  String discountPublishedDateTime;
  String discountExpirationDateTime;
  int bedrooms;

  Room(
      {this.imageSourceFileName,
        this.objectId,
        this.title,
        this.basePrice,
        this.personCapacity,
        this.babyCapacity,
        this.childrenCapacity,
        this.score,
        this.imageSizeCode,
        this.imageUrl,
        this.longitude,
        this.latitude,
        this.cityName,
        this.houseTypeName,
        this.myFavorite,
        this.discount,
        this.afterDiscountPrice,
        this.discountPublishedDateTime,
        this.discountExpirationDateTime,
        this.bedrooms});

  Room.fromJson(Map<String, dynamic> json) {
    imageSourceFileName = json['ImageSourceFileName'];
    objectId = json['ObjectId'];
    title = json['Title'];
    basePrice = json['BasePrice'];
    personCapacity = json['PersonCapacity'];
    babyCapacity = json['BabyCapacity'];
    childrenCapacity = json['ChildrenCapacity'];
    score = json['Score'];
    imageSizeCode = json['ImageSizeCode'];
    imageUrl = json['ImageUrl'];
    longitude = json['Longitude'];
    latitude = json['Latitude'];
    cityName = json['CityName'];
    houseTypeName = json['HouseTypeName'];
    myFavorite = json['MyFavorite'];
    discount = json['Discount'];
    afterDiscountPrice = json['AfterDiscountPrice'];
    discountPublishedDateTime = json['DiscountPublishedDateTime'];
    discountExpirationDateTime = json['DiscountExpirationDateTime'];
    bedrooms = json['Bedrooms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageSourceFileName'] = this.imageSourceFileName;
    data['ObjectId'] = this.objectId;
    data['Title'] = this.title;
    data['BasePrice'] = this.basePrice;
    data['PersonCapacity'] = this.personCapacity;
    data['BabyCapacity'] = this.babyCapacity;
    data['ChildrenCapacity'] = this.childrenCapacity;
    data['Score'] = this.score;
    data['ImageSizeCode'] = this.imageSizeCode;
    data['ImageUrl'] = this.imageUrl;
    data['Longitude'] = this.longitude;
    data['Latitude'] = this.latitude;
    data['CityName'] = this.cityName;
    data['HouseTypeName'] = this.houseTypeName;
    data['MyFavorite'] = this.myFavorite;
    data['Discount'] = this.discount;
    data['AfterDiscountPrice'] = this.afterDiscountPrice;
    data['DiscountPublishedDateTime'] = this.discountPublishedDateTime;
    data['DiscountExpirationDateTime'] = this.discountExpirationDateTime;
    data['Bedrooms'] = this.bedrooms;
    return data;
  }
}

class Contents {
  String imageSourceFileName;
  int objectId;
  String title;
  String upperTitle;
  String body;
  String imageSizeCode;
  String imageUrl;
  double averagePrice;

  Contents(
      {this.imageSourceFileName,
        this.objectId,
        this.title,
        this.upperTitle,
        this.body,
        this.imageSizeCode,
        this.imageUrl,
        this.averagePrice});

  Contents.fromJson(Map<String, dynamic> json) {
    imageSourceFileName = json['ImageSourceFileName'];
    objectId = json['ObjectId'];
    title = json['Title'];
    upperTitle = json['UpperTitle'];
    body = json['Body'];
    imageSizeCode = json['ImageSizeCode'];
    imageUrl = json['ImageUrl'];
    averagePrice = json['AveragePrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ImageSourceFileName'] = this.imageSourceFileName;
    data['ObjectId'] = this.objectId;
    data['Title'] = this.title;
    data['UpperTitle'] = this.upperTitle;
    data['Body'] = this.body;
    data['ImageSizeCode'] = this.imageSizeCode;
    data['ImageUrl'] = this.imageUrl;
    data['AveragePrice'] = this.averagePrice;
    return data;
  }
}
