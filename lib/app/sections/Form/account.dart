import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  final String? userID;
  final String? name;
  final String? email;
  final String? phone;
  final String? photoUrl;
  final String? idNumber;
  final List<dynamic>? deviceTokens;
  final bool? verified;
  final Map<String, dynamic>? verification;
  final int? timestamp;
  final String? surname;
  final String? givenName;
  final String? permanentStateProvinceDistrict;
  final String? dateOfBirth;
  final String? gender;
  final String? identificationMarks;
  final String? educationalQualification;
  final String? religion;
  final String? postalZipCode;
  final String? houseNumberStreet;
  final String? presentStateProvinceDistrict;
  final String? cityOfBirth;
  final String? countryOfBirth;
  final String? nationalityMentioned;
  final String? howDidYouAcquireYourNationality;
  final String? passportType;
  final String? passportNumber;
  final String? countryOfIssue;
  final String? placeOfIssue;
  final String? dateOfIssue;
  final String? dateOfExpiry;
  final String? portOfArrival;
  final String? expectedDateOfArrival;
  final String? typeOfVisa;
  final String? visaNumber;
  final String? visaPlaceOfIssue;
  final String? visaDateOfIssue;

  Account(
      {this.name,
      this.userID,
      this.deviceTokens,
      this.photoUrl,
      this.email,
      this.phone,
      this.verified,
      this.verification,
      this.timestamp,
        this.surname,
        this.givenName,
        this.permanentStateProvinceDistrict,
        this.dateOfBirth,
        this.gender,
        this.identificationMarks,
        this.educationalQualification,
        this.religion,
        this.postalZipCode,
        this.houseNumberStreet,
        this.presentStateProvinceDistrict,
        this.cityOfBirth,
        this.countryOfBirth,
        this.nationalityMentioned,
        this.howDidYouAcquireYourNationality,
        this.passportType,
        this.passportNumber,
        this.countryOfIssue,
        this.placeOfIssue,
        this.dateOfIssue,
        this.dateOfExpiry,
        this.portOfArrival,
        this.expectedDateOfArrival,
        this.typeOfVisa,
        this.visaNumber,
        this.visaPlaceOfIssue,
        this.visaDateOfIssue,
        this.idNumber,
      });

  Map<String, dynamic> toMap() {
    return {
      "userID": userID,
      "name": name,
      "email": email,
      "phone": phone,
      "idNumber": idNumber,
      "surname": surname,
      "givenName": givenName,
      "permanentStateProvinceDistrict": permanentStateProvinceDistrict,
      "dateOfBirth": dateOfBirth,
      "gender": gender,
      "identificationMarks": identificationMarks,
      "educationalQualification": educationalQualification,
      "religion": religion,
      "postalZipCode": postalZipCode,
      "houseNumberStreet": houseNumberStreet,
      "presentStateProvinceDistrict": presentStateProvinceDistrict,
      "cityOfBirth": cityOfBirth,
      "countryOfBirth": countryOfBirth,
      "nationalityMentioned": nationalityMentioned,
      "howDidYouAcquireYourNationality": howDidYouAcquireYourNationality,
      "passportType": passportType,
      "passportNumber": passportNumber,
      "countryOfIssue": countryOfIssue,
      "placeOfIssue": placeOfIssue,
      "dateOfIssue": dateOfIssue,
      "dateOfExpiry": dateOfExpiry,
      "portOfArrival": portOfArrival,
      "expectedDateOfArrival": expectedDateOfArrival,
      "typeOfVisa": typeOfVisa,
      "visaNumber": visaNumber,
      "visaPlaceOfIssue": visaPlaceOfIssue,
      "visaDateOfIssue": visaDateOfIssue,
      "deviceTokens": deviceTokens,
      "verified": verified,
      "verification": verification,
      "timestamp": timestamp,
    };
  }

  factory Account.fromDocument(DocumentSnapshot doc) {
    return Account(
        userID: doc.id,
        name: doc.get("name") ?? "",
        email: doc.get("email") ?? "",
        phone: doc.get("phone") ?? "",
        idNumber: doc.get("idNumber")?? "",
        surname: doc.get("surname") ?? "",
        givenName: doc.get("givenName") ?? "",
        permanentStateProvinceDistrict: doc.get("permanentStateProvinceDistrict") ?? "",
        dateOfBirth: doc.get("dateOfBirth") ?? "",
        gender: doc.get("gender") ?? "",
        identificationMarks: doc.get("identificationMarks") ?? "",
        educationalQualification: doc.get("educationalQualification") ?? "",
        religion: doc.get("religion") ?? "",
        postalZipCode: doc.get("postalZipCode") ?? "",
        houseNumberStreet: doc.get("houseNumberStreet") ?? "",
        presentStateProvinceDistrict: doc.get("presentStateProvinceDistrict") ?? "",
        cityOfBirth: doc.get("cityOfBirth") ?? "",
        countryOfBirth: doc.get("countryOfBirth") ?? "",
        nationalityMentioned: doc.get("nationalityMentioned") ?? "",
        howDidYouAcquireYourNationality: doc.get("howDidYouAcquireYourNationality") ?? "",
        passportType: doc.get("passportType") ?? "",
        passportNumber: doc.get("passportNumber") ?? "",
        countryOfIssue: doc.get("countryOfIssue") ?? "",
        placeOfIssue: doc.get("placeOfIssue") ?? "",
        dateOfIssue: doc.get("dateOfIssue") ?? "",
        dateOfExpiry: doc.get("dateOfExpiry") ?? "",
        portOfArrival: doc.get("portOfArrival") ?? "",
        expectedDateOfArrival: doc.get("expectedDateOfArrival") ?? "",
        typeOfVisa: doc.get("typeOfVisa") ?? "",
        visaNumber: doc.get("visaNumber") ?? "",
        visaPlaceOfIssue: doc.get("visaPlaceOfIssue") ?? "",
        visaDateOfIssue: doc.get("visaDateOfIssue") ?? "",
        photoUrl: doc.get("photoUrl") ?? "",
        deviceTokens: doc.get("deviceTokens") ?? [],
        verified: doc.get("verified") ?? false,
        timestamp: doc.get("timestamp") ?? DateTime.now().millisecondsSinceEpoch,
        verification: doc.get("verification") ?? {});
  }

  factory Account.fromJson(Map<String, dynamic> doc) {
    return Account(
        userID: doc["userID"] ?? "",
        name: doc["name"] ?? "",
        email: doc["email"] ?? "",
        phone: doc["phone"] ?? "",
        idNumber: doc["idNumber"] ?? "",
        surname: doc["surname"] ?? "",
        givenName: doc["givenName"] ?? "",
        permanentStateProvinceDistrict: doc["permanentStateProvinceDistrict"] ?? "",
        dateOfBirth: doc["dateOfBirth"] ?? "",
        gender: doc["gender"] ?? "",
        identificationMarks: doc["identificationMarks"] ?? "",
        educationalQualification: doc["educationalQualification"] ?? "",
        religion: doc["religion"] ?? "",
        postalZipCode: doc["postalZipCode"] ?? "",
        houseNumberStreet: doc["houseNumberStreet"] ?? "",
        presentStateProvinceDistrict: doc["presentStateProvinceDistrict"] ?? "",
        cityOfBirth: doc["cityOfBirth"] ?? "",
        countryOfBirth: doc["countryOfBirth"] ?? "",
        nationalityMentioned: doc["nationalityMentioned"] ?? "",
        howDidYouAcquireYourNationality: doc["howDidYouAcquireYourNationality"] ?? "",
        passportType: doc["passportType"] ?? "",
        passportNumber: doc["passportNumber"] ?? "",
        countryOfIssue: doc["countryOfIssue"] ?? "",
        placeOfIssue: doc["placeOfIssue"] ?? "",
        dateOfIssue: doc["dateOfIssue"] ?? "",
        dateOfExpiry: doc["dateOfExpiry"] ?? "",
        portOfArrival: doc["portOfArrival"] ?? "",
        expectedDateOfArrival: doc["expectedDateOfArrival"] ?? "",
        typeOfVisa: doc["typeOfVisa"] ?? "",
        visaNumber: doc["visaNumber"] ?? "",
        visaPlaceOfIssue: doc["visaPlaceOfIssue"] ?? "",
        visaDateOfIssue: doc["visaDateOfIssue"] ?? "",
        photoUrl: doc["photoUrl"] ?? "",
        verified: doc["verified"] ?? false,
        verification: doc["verification"] ?? {},
        timestamp: doc["timestamp"] ?? DateTime.now().millisecondsSinceEpoch,
        deviceTokens: doc["deviceTokens"] ?? []);
  }

  static String encode(List<Account> accounts) => json.encode(accounts
      .map<Map<String, dynamic>>((account) => account.toMap())
      .toList());

  static List<Account> decode(String accountsString) {
    if (accountsString.isNotEmpty) {
      return (json.decode(accountsString) as List<dynamic>)
          .map<Account>((item) => Account.fromJson(item))
          .toList();
    } else {
      return [];
    }
  }
}
