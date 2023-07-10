import 'package:bow_wow/Connectivity/Constants/collection_constants.dart';
import 'package:bow_wow/UI/HomePage/Bloc/home_state.dart';
import 'package:bow_wow/UI/HomePage/Pages/AdoptedPetsListPage/adopted_pets.dart';
import 'package:bow_wow/UI/HomePage/Pages/AllPetsListPage/all_pets_page.dart';
import 'package:bow_wow/UI/HomePage/Pages/UnAdoptedPetsListPage/unadopted_list_page.dart';
import 'package:bow_wow/Utils/Constants/string_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Cubit<HomeState>{
  HomeBloc(super.initialState);

  int currentIndex = 0;

  var pages = const [
    AllPetsListPage(),
    UnAdoptedListPage(),
    AdoptedPetsPage()
  ];

  var pageTitles = [
    Strings.allTitle,
    Strings.unAdoptedTitle,
    Strings.adopted
  ];

  void makeSelection(int? index) {
    currentIndex = index!;
    emit(ChangeState());
  }

  void addImage() {
    FirebaseFirestore.instance.collection(CollectionConstants.pets).add(
        {
          "age_months": 4,
          "age_years": 5,
          "description": "description",
          "image_url": "https://img.freepik.com/premium-vector/cute-bulldog-cartoon-illustration-sticker-design-baby-pet-animal_805767-21.jpg?w=2000",
          "is_adopted": false,
          "is_liked": false,
          "location": "Indirapuram",
          "name": "Dobby",
          "owner_contact": "+918700492168",
          "owner_name": "Mohana Venkatraman",
          "sex": "Male",
          "weight": 4,
          "profile_image": "https://picsum.photos/id/14/200/300",
          "breed": "Bull Dog"
        }
    );
  }


}