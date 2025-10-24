import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/category_models.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseService {
  static const String usersCollection = "Users"; // Single source of truth

  static Future<UserCredential> register(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static Future<UserCredential> login(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  static CollectionReference<UserModel> getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollectionRef = db
        .collection(usersCollection)
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
    );
    return usersCollectionRef;
  }

  static Future<void> addUserToFireStore(UserModel user) {
    CollectionReference<UserModel> usersCollectionRef = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollectionRef.doc(user.id);
    return userDocument.set(user);
  }

  static Future<UserModel?> getUsersFromFireStoreById(String uid) async {
    try {
      CollectionReference<UserModel> usersCollectionRef = getUsersCollection();
      DocumentReference<UserModel> userDocument = usersCollectionRef.doc(uid);
      DocumentSnapshot<UserModel> documentSnapshot = await userDocument.get();

      if (documentSnapshot.exists) {
        return documentSnapshot.data();
      }
      return null;
    } catch (e) {
      print("Error fetching user: $e");
      return null;
    }
  }

  static CollectionReference<EventModel> getEventsCollection(
      BuildContext context,) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection = db
        .collection("Events")
        .withConverter<EventModel>(
      fromFirestore: (snapshot, _) =>
          EventModel.fromJson(snapshot.data()!, context),
      toFirestore: (event, _) => event.toJson(),
    );
    return eventsCollection;
  }

  static Future<void> addEventToFireStore(EventModel event,
      BuildContext context,) {
    CollectionReference<EventModel> eventsCollection = getEventsCollection(
      context,
    );
    DocumentReference<EventModel> eventDocument = eventsCollection.doc();
    event.eventId = eventDocument.id;
    return eventDocument.set(event);
  }

  static Future<List<EventModel>> getEvents(BuildContext context,
      CategoryModels category,) async {
    CollectionReference<EventModel> eventsCollection = getEventsCollection(
      context,
    );
    QuerySnapshot<EventModel> querySnapshot = await eventsCollection.where(
        "categoryId", isEqualTo: category.id == "0" ? null : category.id)
        .orderBy("dateTime")
        .get();
    List<EventModel> events = querySnapshot.docs
        .map((documentSnapshot) => documentSnapshot.data())
        .toList();
    return events;
    //   if (category.id == "0") {
    //     return events;
    //   }
    //   events = events
    //       .where((events) => events.category.id == category.id)
    //       .toList();
    //   return events;
    // }
  }
}
