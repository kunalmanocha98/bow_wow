import 'package:cloud_firestore/cloud_firestore.dart';

class ListItem {
  int? ageMonths;
  int? ageYears;
  String? description;
  String? imageUrl;
  bool? isAdopted;
  bool? isLiked;
  String? location;
  String? name;
  String? ownerContact;
  String? ownerName;
  String? sex;
  String? breed;
  int? weight;
  String? documentId;
  String? profileImage;

  ListItem(
      {this.ageMonths,
        this.ageYears,
        this.description,
        this.imageUrl,
        this.isAdopted,
        this.isLiked,
        this.location,
        this.name,
        this.ownerContact,
        this.ownerName,
        this.sex,
        this.weight,
        this.breed,
        this.profileImage
      });

  ListItem.fromFireStore(QueryDocumentSnapshot<Map<String,dynamic>> data){
    ageMonths = data.data()['age_months'];
    ageYears = data.data()['age_years'];
    description = data.data()['description'];
    imageUrl = data.data()['image_url'];
    isAdopted = data.data()['is_adopted'];
    isLiked = data.data()['is_liked'];
    location = data.data()['location'];
    name = data.data()['name'];
    ownerContact = data.data()['owner_contact'];
    ownerName = data.data()['owner_name'];
    sex = data.data()['sex'];
    weight = data.data()['weight'];
    breed = data.data()['breed'];
    profileImage = data.data()['profile_image'];
    documentId = data.id;
  }

  ListItem.fromJson(Map<String, dynamic> json) {
    ageMonths = json['age_months'];
    ageYears = json['age_years'];
    description = json['description'];
    imageUrl = json['image_url'];
    isAdopted = json['is_adopted'];
    isLiked = json['is_liked'];
    location = json['location'];
    name = json['name'];
    ownerContact = json['owner_contact'];
    ownerName = json['owner_name'];
    sex = json['sex'];
    weight = json['weight'];
    breed = json['breed'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age_months'] = ageMonths;
    data['age_years'] = ageYears;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['is_adopted'] = isAdopted;
    data['is_liked'] = isLiked;
    data['location'] = location;
    data['name'] = name;
    data['owner_contact'] = ownerContact;
    data['owner_name'] = ownerName;
    data['sex'] = sex;
    data['weight'] = weight;
    data['breed'] = breed;
    data['profile_image'] = profileImage ;
    return data;
  }
}