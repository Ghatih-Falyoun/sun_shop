import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sun_shop/core/helpers/constants.dart';
import 'package:sun_shop/core/helpers/shared_prefrences.dart';
import 'package:sun_shop/features/sinup/logic/cubit/singup_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SingupCubit extends Cubit<SingupState> {
  SingupCubit() : super(SingupState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();

  void printt() {
    print('thats fansy');
  }

  Future<void> singup() async {
    emit(SingupState.loading());
    try {
      final response =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await response.user?.updateDisplayName(nameController.text);
      emit(SingupState.success());
      createOrUpdateUser();
      SharedPrefHelper.setData(Constants.UserId, response.user?.uid);
    } on FirebaseAuthException catch (e) {
      emitError(e);
    }
  }

  void emitError(FirebaseAuthException e) {
    String massage = e.code;
    if (e.code == 'email-already-in-use') {
      massage = "This email is already exict Please try to log in";
    }
    print(e.toString());
    emit(SingupState.error(massage));
  }

// Function to create or update a user document
  Future<void> createOrUpdateUser() async {
    // Get the current user from Firebase Authentication
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Get the UID of the current user
      String uid = currentUser.uid;

      // Reference to the Firestore document using the UID
      DocumentReference userDocRef =
          FirebaseFirestore.instance.collection('customer').doc(uid);

      // User data to be stored
      Map<String, dynamic> userData = {
        'name': currentUser.displayName ?? 'Anonymous',
        'email': currentUser.email ?? '',
        'createdAt': Timestamp.now(),
        'wishlist': [], // Initialize empty wishlist array
        'favorites': [], // Initialize empty favorites array
        // Add other user-specific fields here
      };

       
          FirebaseFirestore.instance.collection('customer').doc(uid).collection('wishlist');

      // Set or update the user document
      await userDocRef.set(userData, SetOptions(merge: true));
    }
  }
}
