import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evisa/app/sections/Form/account.dart';
import 'package:evisa/app/sections/Form/fileManager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Authentication {
  Future<String> saveUserInfoToFirestore(Account account) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(account.userID)
        .set(account.toMap());

    return "success+${account.userID}";
  }

  Future<String> loginUserWithEmail({String? email, String? password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      String userID = credential.user!.uid;

      return "success+$userID";
    } catch (e) {
      print(e.toString());

      return "failed";
    }
  }

  Future<String> createUserWithEmail({
    String? name,
    String? idNumber,
    String? email,
    String? password,
    String? phone,
    XFile? pickedFile,
    String? surname,
    String? givenName,
    String? permanentStateProvinceDistrict,
    String? dateOfBirth,
    String? gender,
    String? identificationMarks,
    String? educationalQualification,
    String? religion,
    String? postalZipCode,
    String? houseNumberStreet,
    String? presentStateProvinceDistrict,
    String? cityOfBirth,
    String? countryOfBirth,
    String? nationalityMentioned,
    String? howDidYouAcquireYourNationality,
    String? passportType,
    String? passportNumber,
    String? countryOfIssue,
    String? placeOfIssue,
    String? dateOfIssue,
    String? dateOfExpiry,
    String? portOfArrival,
    String? expectedDateOfArrival,
    String? typeOfVisa,
    String? visaNumber,
    String? visaPlaceOfIssue,
    String? visaDateOfIssue,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      String photoURL = "";

      if (pickedFile != null) {
        photoURL = await FileManager()
            .uploadProfilePhoto(credential.user!.uid, pickedFile);
      }

      Account account = Account(
          surname: surname!,
          givenName: givenName!,
          permanentStateProvinceDistrict: permanentStateProvinceDistrict!,
          dateOfBirth: dateOfBirth!,
          gender: gender!,
          identificationMarks: identificationMarks!,
          educationalQualification: educationalQualification!,
          religion: religion!,
          postalZipCode: postalZipCode!,
          houseNumberStreet: houseNumberStreet!,
          presentStateProvinceDistrict: presentStateProvinceDistrict!,
          cityOfBirth: cityOfBirth!,
          countryOfBirth: countryOfBirth!,
          nationalityMentioned: nationalityMentioned!,
          howDidYouAcquireYourNationality: howDidYouAcquireYourNationality!,
          passportType: passportType!,
          passportNumber: passportNumber!,
          countryOfIssue: countryOfIssue!,
          placeOfIssue: placeOfIssue!,
          dateOfIssue: dateOfIssue!,
          dateOfExpiry: dateOfExpiry!,
          portOfArrival: portOfArrival!,
          expectedDateOfArrival: expectedDateOfArrival!,
          typeOfVisa: typeOfVisa!,
          visaNumber: visaNumber!,
          visaPlaceOfIssue: visaPlaceOfIssue!,
          visaDateOfIssue: visaDateOfIssue!,
          userID: credential.user!.uid,
          email: credential.user!.email,
          phone: phone!,
          timestamp: DateTime.now().millisecondsSinceEpoch,
          photoUrl: photoURL,
          // photoURL: credential.user!.photoURL ?? "",
          verified: false,
          verification: {
            "verified": false,
            "status": "unverified",
            "timestamp": DateTime.now().millisecondsSinceEpoch
          },
          deviceTokens: []);

      String res = await saveUserInfoToFirestore(account);

      return res;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "weak password";
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');

        return "user exists";
      } else {
        return "failed";
      }
    } catch (e) {
      print(e);
      return "failed";
    }
  }
}
