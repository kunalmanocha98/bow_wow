import 'package:bow_wow/Connectivity/Constants/collection_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreCalls {

  Future<void> adoptPet(String id) {
    return FirebaseFirestore.instance
        .collection(CollectionConstants.pets)
        .doc(id)
        .update({CollectionConstants.isAdopted: true});
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllPets() {
    return FirebaseFirestore.instance
        .collection(CollectionConstants.pets)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAdoptedPets() {
    return FirebaseFirestore.instance
        .collection(CollectionConstants.pets)
        .where(CollectionConstants.isAdopted, isEqualTo: true)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUnAdoptedPets() {
    return FirebaseFirestore.instance
        .collection(CollectionConstants.pets)
        .where(CollectionConstants.isAdopted, isEqualTo: false)
        .get();
  }
}
