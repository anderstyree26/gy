import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:evisa/app/sections/Form/account.dart';
import 'package:evisa/app/sections/Form/auth.dart';
import 'package:evisa/app/sections/Form/fileManager.dart';
import 'package:evisa/app/sections/Form/loader.dart';
import 'package:evisa/app/sections/home/home.dart';
import 'package:evisa/app/widgets/navbar_logo.dart';
import 'package:evisa/core/color/colors.dart';
import 'package:evisa/core/color/colors.dart';
import 'package:evisa/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:evisa/core/res/responsive.dart';

import 'dart:io';
import 'package:uuid/uuid.dart';

import 'package:evisa/core/res/responsive_size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class FormDesktop extends StatefulWidget {
  const FormDesktop({super.key});

  @override
  State<FormDesktop> createState() => _FormDesktopState();
}

class _FormDesktopState extends State<FormDesktop> {
  bool isSignUp = false;
  int _activeStepIndex = 0;
  ///use iscomplete for firebase data
  bool isComplete = false;
  String countryOfBirth = '--Select your Country Of Birth--';
  String fatherCountryOfBirth = "--Select your Father's Country Of Birth--";
  String motherCountryOfBirth = "--Select your Mother's Country Of Birth--";
  String countryOfIssue = '--Select your Country Of Issue--';
  String presentCountry = '--Select your Present Country--';
  String nationality = '--Select your nationality--';
  String fatherNationality = "--Select your Father's nationality--";
  String motherNationality = "--Select your Mother's nationality--";
  String nationalityMentioned = '--Select your nationality mentioned therein--';
  String passportType = '--Select type of passport--';
  String religion = '--Select your religion--';
  String gender = '--Select your gender--';
  String portOfArrival = '--Select your port of arrival--';
  String expectedPortOfExit = 'Select your Expected Port Of Exit';
  String visaService = '--Select your Visa Service--';
  String typeOfVisa = '--Select your Visa Type--';
  String? changedYourName;
  String? visitedBefore;
  String? livedForTwoYears;
  String? visitExtendRejected;
  String? Q1;
  String? Q2;
  String? Q3;
  String? Q4;
  String? Q5;
  String? Q6;
  String educationalQualification = 'Select your Educational Qualification';
  String howDidYouAcquireYourNationality = 'Birth';
  String maritalStatus = 'Select your Marital Status';

  final dateOfBirth = TextEditingController();
  final expectedDateOfArrival = TextEditingController();
  final surname = TextEditingController();
  final fatherName = TextEditingController();
  final motherName = TextEditingController();
  final givenName = TextEditingController();
  final cityOfBirth = TextEditingController();
  final fatherCityOfBirth = TextEditingController();
  final motherCityOfBirth = TextEditingController();
  final presentCity = TextEditingController();
  final permanentCity = TextEditingController();
  final presentStateProvinceDistrict = TextEditingController();
  final permanentStateProvinceDistrict = TextEditingController();
  final passportNumber = TextEditingController();
  final dateOfIssue = TextEditingController();
  final visaDateOfIssue = TextEditingController();
  final dateOfExpiry = TextEditingController();
  final placeOfIssue = TextEditingController();
  final visaPlaceOfIssue = TextEditingController();
  final fatherPlaceOfBirth = TextEditingController();
  final motherPlaceOfBirth = TextEditingController();
  final identificationMarks = TextEditingController();
  final houseNumberStreet = TextEditingController();
  final visitedAddress = TextEditingController();
  final visitedCities = TextEditingController();
  final permanentHouseNumberStreet = TextEditingController();
  final phone = TextEditingController();
  final postalZipCode = TextEditingController();
  final email = TextEditingController();
  final retypeEmail = TextEditingController();
  final password = TextEditingController();
  final cPassword = TextEditingController();
  final idNumber = TextEditingController();
  final amount = TextEditingController();
  final placesToVisit = TextEditingController();
  final visaNumber = TextEditingController();
  final byWhom = TextEditingController();
  final countriesVisited = TextEditingController();

  // String accountType = 'Tenant';
  bool _checked = false;
  bool showPassword = false;
  bool showCPassword = true;
  XFile? pickedFile;

  void handleAuth(BuildContext context) async {
    await context.read<Loader>().switchLoadingState(true);

    String res = "";

    if (isSignUp) {
      res = await Authentication().createUserWithEmail(
        email: email.text.trim(),
        password: password.text.trim(),
        phone: phone.text.trim(),
        // accountType: accountType,
        idNumber: idNumber.text.trim(),
        surname: surname.text.trim(),
        givenName: givenName.text.trim(),
        permanentStateProvinceDistrict: permanentStateProvinceDistrict.text.trim(),
        dateOfBirth: dateOfBirth.text.trim(),
        gender: gender,
        identificationMarks: identificationMarks.text.trim(),
        educationalQualification: educationalQualification,
        religion: religion,
        postalZipCode: postalZipCode.text.trim(),
        houseNumberStreet: houseNumberStreet.text.trim(),
        presentStateProvinceDistrict: presentStateProvinceDistrict.text.trim(),
        cityOfBirth: cityOfBirth.text.trim(),
        countryOfBirth: countryOfBirth,
        nationalityMentioned: nationalityMentioned,
        howDidYouAcquireYourNationality: howDidYouAcquireYourNationality,
        passportType: passportType,
        passportNumber: passportNumber.text.trim(),
        countryOfIssue: countryOfIssue,
        placeOfIssue: placeOfIssue.text.trim(),
        dateOfIssue: dateOfIssue.text.trim(),
        dateOfExpiry: dateOfExpiry.text.trim(),
        portOfArrival: portOfArrival,
        expectedDateOfArrival: expectedDateOfArrival.text.trim(),
        typeOfVisa: typeOfVisa,
        visaNumber: visaNumber.text.trim(),
        visaPlaceOfIssue: visaPlaceOfIssue.text.trim(),
        visaDateOfIssue: visaDateOfIssue.text.trim(),
      );

    } else {
      res = "User Already Exists!";
    }

    String verificationResult = "";
    await context.read<Loader>().switchLoadingState(false);

    if (res.split("+").first == "success") {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(res.split("+").last)
          .get()
          .then((value) {
        Account account = Account.fromDocument(value);

        // context.read<EKodi>().switchUser(account);
      });

      Route route = MaterialPageRoute(builder: (context) => const HomePage());

      Navigator.pushReplacement(context, route);
    } else if (verificationResult == "unverified") {
      Fluttertoast.showToast(
          msg: "Your email is unverified!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER_LEFT,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "User Already Exists!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER_LEFT,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void handleLoginAuth(BuildContext context) async {
    await context.read<Loader>().switchLoadingState(true);
    String res = "";

    if (isSignUp = true) {
      res = await Authentication().loginUserWithEmail(
        email: email.text.trim(),
        password: password.text.trim(),
      );
    } else {
      res = "User Doesn't Exist! Create account instead";
    }

    String verificationResult = "";
    // await Navigator.push(context, MaterialPageRoute(builder: (context)=> const VerifyEmailPage()));

    await context.read<Loader>().switchLoadingState(false);

    if (res.split("+").first == "success") {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(res.split("+").last)
          .get()
          .then((value) {
        Account account = Account.fromDocument(value);

        // context.read<EKodi>().switchUser(account);
      });

      Route route = MaterialPageRoute(builder: (context) => const HomePage());

      Navigator.pushReplacement(context, route);
    } else if (verificationResult == "unverified") {
      Fluttertoast.showToast(
          msg: "Your email is unverified!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER_LEFT,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "User Already Exists!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER_LEFT,
          timeInSecForIosWeb: 4,
          backgroundColor: Colors.blueAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  //FirebaseAuth auth = FirebaseAuth.instance;
  final ImagePicker _picker = ImagePicker();

  Future pickImageFromGallery(BuildContext context) async {
    final XFile? photo = await FileManager().pickPhoto(
      context: context,
      imageSource: ImageSource.gallery,
      cameraDevice: CameraDevice.front,
    );

    if (photo != null) {
      setState(() {
        pickedFile = photo;
      });
    } else {
      // User canceled the picker
    }
  }

  Widget displayPickedFile() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: kIsWeb
          ? Image.network(
        pickedFile!.path,
        height: 300.0,
        width: 300.0,
        fit: BoxFit.cover,
        errorBuilder: (context, obj, stacktrace) {
          return Text("Error");
        },
      )
          : Image.file(
        File(pickedFile!.path),
        height: 300.0,
        width: 300.0,
        fit: BoxFit.cover,
      ),
    );
  }


  List<Step> stepList() => [
    Step(
      state: _activeStepIndex >= 0 ? StepState.indexed : StepState.complete,
      isActive: _activeStepIndex >= 0,
      title: const Text("Visa Application"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ///passportType
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your passport type--",
                      "Emergency",
                      "Diplomatic",
                      "Official/Service",
                      "Public Affairs"
                    ],
                    hint: "--Select your passport type--",
                    onChanged: (v) {
                      setState(() {
                        passportType = v!;
                      });
                    },
                    selectedItem: "--Select your passport type--"),
              ),

              ///nationality
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your nationality--",
                      "Afghan",
                      "Albanian",
                      "Algerian",
                      "American",
                      "Andorran",
                      "Angolan",
                      "Anguillan",
                      "Citizen of Antigua and Barbuda",
                      "Argentine",
                      "Armenian",
                      "Australian",
                      "Austrian",
                      "Azerbaijani",
                      "Bahamian",
                      "Bahraini",
                      "Bangladeshi",
                      "Barbadian",
                      "Belarusian",
                      "Belgian",
                      "Belizean",
                      "Beninese",
                      "Bermudian",
                      "Bhutanese",
                      "Bolivian",
                      "Citizen of Bosnia and Herzegovina",
                      "Botswanan",
                      "Brazilian",
                      "British",
                      "British Virgin Islander",
                      "Bruneian",
                      "Bulgarian",
                      "Burkinan",
                      "Burmese",
                      "Burundian",
                      "Cambodian",
                      "Cameroonian",
                      "Canadian",
                      "Cape Verdean",
                      "Cayman Islander",
                      "Central African",
                      "Chadian",
                      "Chilean",
                      "Chinese",
                      "Colombian",
                      "Comoran",
                      "Congolese (Congo)",
                      "Congolese (DRC)",
                      "Cook Islander",
                      "Costa Rican",
                      "Croatian",
                      "Cuban",
                      "Cymraes",
                      "Cymro",
                      "Cypriot",
                      "Czech",
                      "Danish",
                      "Djiboutian",
                      "Dominican",
                      "Citizen of the Dominican Republic",
                      "Dutch",
                      "East Timorese",
                      "Ecuadorean",
                      "Egyptian",
                      "Emirati",
                      "English",
                      "Equatorial Guinean",
                      "Eritrean",
                      "Estonian",
                      "Ethiopian",
                      "Faroese",
                      "Fijian",
                      "Filipino",
                      "Finnish",
                      "French",
                      "Gabonese",
                      "Gambian",
                      "Georgian",
                      "German",
                      "Ghanaian",
                      "Gibraltarian",
                      "Greek",
                      "Greenlandic",
                      "Grenadian",
                      "Guamanian",
                      "Guatemalan",
                      "Citizen of Guinea-Bissau",
                      "Guinean",
                      "Guyanese",
                      "Haitian",
                      "Honduran",
                      "Hong Konger",
                      "Hungarian",
                      "Icelandic",
                      "Indian",
                      "Indonesian",
                      "Iranian",
                      "Iraqi",
                      "Irish",
                      "Israeli",
                      "Italian",
                      "Ivorian",
                      "Jamaican",
                      "Japanese",
                      "Jordanian",
                      "Kazakh",
                      "Kenyan",
                      "Kittitian",
                      "Citizen of Kiribati",
                      "Kosovan",
                      "Kuwaiti",
                      "Kyrgyz",
                      "Lao",
                      "Latvian",
                      "Lebanese",
                      "Liberian",
                      "Libyan",
                      "Liechtenstein citizen",
                      "Lithuanian",
                      "Luxembourger",
                      "Macanese",
                      "Macedonian",
                      "Malagasy",
                      "Malawian",
                      "Malaysian",
                      "Maldivian",
                      "Malian",
                      "Maltese",
                      "Marshallese",
                      "Martiniquais",
                      "Mauritanian",
                      "Mauritian",
                      "Mexican",
                      "Micronesian",
                      "Moldovan",
                      "Monegasque",
                      "Mongolian",
                      "Montenegrin",
                      "Montserratian",
                      "Moroccan",
                      "Mosotho",
                      "Mozambican",
                      "Namibian",
                      "Nauruan",
                      "Nepalese",
                      "New Zealander",
                      "Nicaraguan",
                      "Nigerian",
                      "Nigerien",
                      "Niuean",
                      "North Korean",
                      "Northern Irish",
                      "Norwegian",
                      "Omani",
                      "Pakistani",
                      "Palauan",
                      "Palestinian",
                      "Panamanian",
                      "Papua New Guinean",
                      "Paraguayan",
                      "Peruvian",
                      "Pitcairn Islander",
                      "Polish",
                      "Portuguese",
                      "Prydeinig",
                      "Puerto Rican",
                      "Qatari",
                      "Romanian",
                      "Russian",
                      "Rwandan",
                      "Salvadorean",
                      "Sammarinese",
                      "Samoan",
                      "Sao Tomean",
                      "Saudi Arabian",
                      "Scottish",
                      "Senegalese",
                      "Serbian",
                      "Citizen of Seychelles",
                      "Sierra Leonean",
                      "Singaporean",
                      "Slovak",
                      "Slovenian",
                      "Solomon Islander",
                      "Somali",
                      "South African",
                      "South Korean",
                      "South Sudanese",
                      "Spanish",
                      "Sri Lankan",
                      "St Helenian",
                      "St Lucian",
                      "Stateless",
                      "Sudanese",
                      "Surinamese",
                      "Swazi",
                      "Swedish",
                      "Swiss",
                      "Syrian",
                      "Taiwanese",
                      "Tajik",
                      "Tanzanian",
                      "Thai",
                      "Togolese",
                      "Tongan",
                      "Trinidadian",
                      "Tristanian",
                      "Tunisian",
                      "Turkish",
                      "Turkmen",
                      "Turks and Caicos Islander",
                      "Tuvaluan",
                      "Ugandan",
                      "Ukrainian",
                      "Uruguayan",
                      "Uzbek"
                          "Vatican citizen",
                      "Citizen of Vanuatu",
                      "Venezuelan",
                      "Vietnamese",
                      "Vincentian",
                      "Wallisian	Welsh",
                      "Yemeni"
                    ],
                    hint: "--Select your nationality--",
                    onChanged: (v) {
                      setState(() {
                        nationality = v!;
                      });
                    },
                    selectedItem: "--Select your nationality--"),
              ),

              ///portOfArrival
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your port of arrival--",
                      "Cheddi Jagan International Airport",
                      "Eugene F.Correira International Airport",
                      "Kaieteur International Airport",
                    ],
                    hint: "--Select your port of arrival--",
                    onChanged: (v) {
                      setState(() {
                        portOfArrival = v!;
                      });
                    },
                    selectedItem: "--Select your port of arrival--"),
              ),

              ///expectedPortOfExit
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your Expected Port Of Exit--",
                      "Cheddi Jagan International Airport",
                      "Eugene F.Correira International Airport",
                      "Kaieteur International Airport",
                    ],
                    hint: "--Select your Expected Port Of Exit--",
                    onChanged: (v) {
                      setState(() {
                        expectedPortOfExit = v!;
                      });
                    },
                    selectedItem: "--Select your Expected Port Of Exit--"),
              ),

              ///DOB
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: dateOfBirth,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Date of Birth DD/MM/YYYY",
                    prefixIcon: const Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                    hintText: "Date of Birth DD/MM/YYYY",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///email
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email Address",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    hintText: "Email Address",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              ///retypeEmail
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: retypeEmail,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Retype Email Address",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    hintText: "Retype Email Address",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),

              ///expectedDateOfArrival
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: expectedDateOfArrival,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Expected Date of Arrival DD/MM/YYYY",
                    prefixIcon: const Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                    hintText: "Expected Date of Arrival DD/MM/YYYY",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///visaService
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your Visa Service--",
                      "Conference Visa",
                      "Tourist Visa",
                      "Medical Visa",
                      "Medical Attendant Visa"
                    ],
                    hint: "--Select your Visa Service--",
                    onChanged: (v) {
                      setState(() {
                        visaService = v!;
                      });
                    },
                    selectedItem: "--Select your Visa Service--"),
              ),

              ///placesToVisit
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: placesToVisit,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Places To Be Visited",
                    prefixIcon: const Icon(
                      Icons.location_on_sharp,
                      color: Colors.grey,
                    ),
                    hintText: "Places To Be Visited",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///end here

              // ///service fee
              // Padding(
              //   padding: const EdgeInsets.all(5.0),
              //   child: TextField(
              //     controller: amount,
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       labelText: "Service Fee",
              //       prefixIcon: const Icon(
              //         Icons.money,
              //         color: Colors.grey,
              //       ),
              //       hintText: "Service Fee",
              //     ),
              //     obscureText: false,
              //     keyboardType: TextInputType.number,
              //   ),
              // ),
              ///password
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(showPassword
                          ? Icons.visibility
                          : Icons.visibility_off_outlined),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: showPassword,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: cPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm Password",
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.grey,
                    ),
                    hintText: "Confirm Password",
                    suffixIcon: IconButton(
                      icon: Icon(showCPassword
                          ? Icons.visibility
                          : Icons.visibility_off_outlined),
                      onPressed: () {
                        setState(() {
                          showCPassword = !showCPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: showCPassword,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    Step(
      state: _activeStepIndex >= 1 ? StepState.indexed : StepState.complete,
      isActive: _activeStepIndex >= 1,
      title: const Text("Application Details"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ///surname
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: surname,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Surname according to Passport",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "Surname according to Passport",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///givenName
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: givenName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Given Name/s according to Passport",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "Given Name/s according to Passport",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///Have you ever changed your name?
              ///changedYourName
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text("Have you ever changed your name?",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.baloo2(
                          fontSize: 16.0,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RadioListTile(
                          title: Text("Yes"),
                          value: "Yes",
                          groupValue: changedYourName,
                          onChanged: (value) {
                            setState(() {
                              changedYourName = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("No"),
                          value: "No",
                          groupValue: changedYourName,
                          onChanged: (value) {
                            setState(() {
                              changedYourName = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///gender
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your gender--",
                      "Male",
                      "Female",
                      "Other",
                    ],
                    hint: "--Select your gender--",
                    onChanged: (v) {
                      setState(() {
                        gender = v!;
                      });
                    },
                    selectedItem: "--Select your gender--"),
              ),

              ///DOB
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Date Of Birth: ${dateOfBirth.text}'),
              ),

              ///Town/CityOfBirth
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: cityOfBirth,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Town/City Of Birth",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "Town/City Of Birth",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///countryOfBirth
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your Country Of Birth--",
                      "Afghanistan",
                      "Albania",
                      "Algeria",
                      "Andorra",
                      "Angola",
                      "Antigua and Barbuda",
                      "Argentina",
                      "Armenia",
                      "Australia",
                      "Austria",
                      "Austrian Empire",
                      "Azerbaijan",
                      "Baden",
                      "The Bahamas",
                      "Bahrain",
                      "Bangladesh",
                      "Barbados",
                      "Bavaria",
                      "Belarus",
                      "Belgium",
                      "Belize",
                      "Benin (Dahomey)",
                      "Bolivia",
                      "Bosnia and Herzegovina",
                      "Botswana",
                      "Brazil",
                      "Brunei",
                      "Bulgaria",
                      "Burkina Faso (Upper Volta)",
                      "Burma",
                      "Burundi",
                      "Cabo Verde",
                      "Cambodia",
                      "Cameroon",
                      "Canada",
                      "Cayman Islands",
                      "Central African Republic",
                      "Central American Federation",
                      "Chad",
                      "Chile",
                      "China",
                      "Colombia",
                      "Comoros",
                      "Congo Free State",
                      "Costa Rica",
                      "Cote d’Ivoire (Ivory Coast)",
                      "Croatia",
                      "Cuba",
                      "Cyprus",
                      "Czechia",
                      "Czechoslovakia",
                      "Democratic Republic of the Congo",
                      "Denmark",
                      "Djibouti",
                      "Dominica",
                      "Dominican Republic",
                      "Duchy of Brunswick-Lüneburg",
                      "Duchy of Parma",
                      "East Germany (German Democratic Republic)",
                      "Ecuador",
                      "Egypt",
                      "El Salvador",
                      "Equatorial Guinea",
                      "Eritrea",
                      "Estonia",
                      "Eswatini",
                      "Ethiopia",
                      "Federal Government of Germany (1848-49)",
                      "Fiji",
                      "Finland",
                      "France",
                      "Gabon",
                      "Gambia",
                      "Georgia",
                      "Germany",
                      "Ghana",
                      "Grand Duchy of Tuscany",
                      "Greece",
                      "Grenada",
                      "Guatemala",
                      "Guinea",
                      "Guinea-Bissau",
                      // "Guyana",
                      "Haiti",
                      "Hanover",
                      "Hanseatic Republics",
                      "Hawaii",
                      "Hesse",
                      "Holy See",
                      "Honduras",
                      "Hungary",
                      "Iceland",
                      "India",
                      "Indonesia",
                      "Iran",
                      "Iraq",
                      "Ireland",
                      "Israel",
                      "Italy",
                      "Jamaica",
                      "Japan",
                      "Jordan",
                      "Kazakhstan",
                      "Kenya",
                      "Kingdom of Serbia/Yugoslavia",
                      "Kiribati",
                      "Korea",
                      "Kosovo",
                      "Kuwait",
                      "Kyrgyzstan",
                      "Laos",
                      "Latvia",
                      "Lebanon",
                      "Lesotho",
                      "Lew Chew (Loochoo)",
                      "Liberia",
                      "Libya",
                      "Liechtenstein",
                      "Lithuania",
                      "Luxembourg",
                      "Madagascar",
                      "Malawi",
                      "Malaysia",
                      "Maldives",
                      "Mali",
                      "Malta",
                      "Marshall Islands",
                      "Mauritania",
                      "Mauritius",
                      "Mecklenburg-Schwerin",
                      "Mecklenburg-Strelitz",
                      "Mexico",
                      "Micronesia",
                      "Moldova",
                      "Monaco",
                      "Mongolia",
                      "Montenegro",
                      "Morocco",
                      "Mozambique",
                      "Namibia",
                      "Nassau",
                      "Nauru",
                      "Nepal",
                      "Netherlands",
                      "New Zealand",
                      "Nicaragua",
                      "Niger",
                      "Nigeria",
                      "North German Confederation",
                      "North German Union",
                      "North Macedonia",
                      "North Korea"
                          "Norway",
                      "Oldenburg",
                      "Oman",
                      "Orange Free State",
                      "Pakistan",
                      "Palau",
                      "Panama",
                      "Papal States",
                      "Papua New Guinea",
                      "Paraguay",
                      "Peru",
                      "Philippines",
                      "Piedmont-Sardinia",
                      "Poland",
                      "Portugal",
                      "Qatar",
                      "Republic of Genoa",
                      "Republic of the Congo",
                      "Romania",
                      "Russia",
                      "Rwanda",
                      "Saint Kitts and Nevis",
                      "Saint Lucia",
                      "Saint Vincent and the Grenadines",
                      "Samoa",
                      "San Marino",
                      "Sao Tome and Principe",
                      "Saudi Arabia",
                      "Schaumburg-Lippe",
                      "Senegal",
                      "Serbia",
                      "Seychelles",
                      "Sierra Leone",
                      "Singapore",
                      "Slovakia",
                      "Slovenia",
                      "Solomon Islands",
                      "Somalia",
                      "South Africa",
                      "South Korea",
                      "South Sudan",
                      "Soviet Union",
                      "Spain",
                      "Sri Lanka",
                      "Sudan",
                      "Suriname",
                      "Sweden",
                      "Switzerland",
                      "Syria",
                      "Tajikistan",
                      "Tanzania",
                      "Thailand",
                      "Timor-Leste",
                      "Togo",
                      "Tonga",
                      "Trinidad and Tobago",
                      "Tunisia",
                      "Turkey",
                      "Turkmenistan",
                      "Tuvalu",
                      "Two Sicilies",
                      "Uganda",
                      "Ukraine",
                      "United Arab Emirates",
                      "United Kingdom",
                      "Uruguay",
                      "Uzbekistan",
                      "Vanuatu",
                      "Venezuela",
                      "Vietnam",
                      "Württemberg",
                      "Yemen",
                      "Zambia",
                      "Zimbabwe",
                    ],
                    hint: "--Select your Country Of Birth--",
                    onChanged: (v) {
                      setState(() {
                        countryOfBirth = v!;
                      });
                    },
                    selectedItem: "--Select your Country Of Birth--"),
              ),

              ///idNumber
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: idNumber,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Citizenship/National ID Number",
                    prefixIcon: Icon(
                      Icons.badge_outlined,
                      color: Colors.grey,
                    ),
                    hintText: "Citizenship/National ID Number",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.number,
                ),
              ),

              ///religion
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your religion--",
                      "Atheist",
                      "Christian",
                      "Jew",
                      "Islam",
                      "Other",
                    ],
                    hint: "--Select your religion--",
                    onChanged: (v) {
                      setState(() {
                        religion = v!;
                      });
                    },
                    selectedItem: "--Select your religion--"),
              ),

              ///identificationMarks
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: identificationMarks,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Visible Identification Marks",
                    prefixIcon: Icon(
                      Icons.badge_outlined,
                      color: Colors.grey,
                    ),
                    hintText: "Visible Identification Marks",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///educationalQualification
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your Educational Qualification--",
                      "Secondary (High School)",
                      "Trade/Technical/Vocational training",
                      "Undergraduate (College or University)",
                      "Graduate",
                      "Postgraduate (Masters or Doctorate)",
                    ],
                    hint: "--Select your Educational Qualification--",
                    onChanged: (v) {
                      setState(() {
                        educationalQualification = v!;
                      });
                    },
                    selectedItem: "--Select your Educational Qualification--"),
              ),

              ///nationality
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Nationality: $nationality'),
              ),

              ///How did you acquire your Nationality?
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("How did you acquire your Nationality?",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.baloo2(
                      fontSize: 16.0,
                    )),
              ),

              ///howDidYouAcquireYourNationality
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    DropdownSearch<String>(
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        items: const [
                          "Birth",
                          "Naturalization",
                          "Adoption",
                          "Marriage",
                        ],
                        hint: "Birth",
                        onChanged: (v) {
                          setState(() {
                            howDidYouAcquireYourNationality = v!;
                          });
                        },
                        selectedItem: "Birth"),
                  ],
                ),
              ),

              ///Have you lived for at least 2years in the country where you are applying visa?
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text(
                      "Have you lived for at least 2years in the country where you are applying visa?",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.baloo2(
                        fontSize: 16.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RadioListTile(
                          title: Text("Yes"),
                          value: "Yes",
                          groupValue: livedForTwoYears,
                          onChanged: (value) {
                            setState(() {
                              livedForTwoYears = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("No"),
                          value: "No",
                          groupValue: livedForTwoYears,
                          onChanged: (value) {
                            setState(() {
                              livedForTwoYears = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    Step(
      state: _activeStepIndex >= 2 ? StepState.indexed : StepState.complete,
      isActive: _activeStepIndex >= 2,
      title: const Text("Passport Details"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ///Passport Details
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Passport Details",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.baloo2(
                      fontSize: 16.0,
                    )),
              ),

              ///passportNumber
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: passportNumber,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Passport Number",
                    prefixIcon: Icon(
                      Icons.badge_outlined,
                      color: Colors.grey,
                    ),
                    hintText: "Passport Number",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///placeOfIssue
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: placeOfIssue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Place Of Issue",
                    prefixIcon: const Icon(
                      Icons.location_city,
                      color: Colors.grey,
                    ),
                    hintText: "Place Of Issue",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///dateOfIssue
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: dateOfIssue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Date Of Issue DD/MM/YYYY",
                    prefixIcon: const Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                    hintText: "Date Of Issue DD/MM/YYYY",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///dateOfExpiry
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: dateOfIssue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Date Of Expiry DD/MM/YYYY",
                    prefixIcon: const Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                    hintText: "Date Of Expiry DD/MM/YYYY",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///countryOfIssue
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your Country Of Issue--",
                      "Afghanistan",
                      "Albania",
                      "Algeria",
                      "Andorra",
                      "Angola",
                      "Antigua and Barbuda",
                      "Argentina",
                      "Armenia",
                      "Australia",
                      "Austria",
                      "Austrian Empire",
                      "Azerbaijan",
                      "Baden",
                      "The Bahamas",
                      "Bahrain",
                      "Bangladesh",
                      "Barbados",
                      "Bavaria",
                      "Belarus",
                      "Belgium",
                      "Belize",
                      "Benin (Dahomey)",
                      "Bolivia",
                      "Bosnia and Herzegovina",
                      "Botswana",
                      "Brazil",
                      "Brunei",
                      "Bulgaria",
                      "Burkina Faso (Upper Volta)",
                      "Burma",
                      "Burundi",
                      "Cabo Verde",
                      "Cambodia",
                      "Cameroon",
                      "Canada",
                      "Cayman Islands",
                      "Central African Republic",
                      "Central American Federation",
                      "Chad",
                      "Chile",
                      "China",
                      "Colombia",
                      "Comoros",
                      "Congo Free State",
                      "Costa Rica",
                      "Cote d’Ivoire (Ivory Coast)",
                      "Croatia",
                      "Cuba",
                      "Cyprus",
                      "Czechia",
                      "Czechoslovakia",
                      "Democratic Republic of the Congo",
                      "Denmark",
                      "Djibouti",
                      "Dominica",
                      "Dominican Republic",
                      "Duchy of Brunswick-Lüneburg",
                      "Duchy of Parma",
                      "East Germany (German Democratic Republic)",
                      "Ecuador",
                      "Egypt",
                      "El Salvador",
                      "Equatorial Guinea",
                      "Eritrea",
                      "Estonia",
                      "Eswatini",
                      "Ethiopia",
                      "Federal Government of Germany (1848-49)",
                      "Fiji",
                      "Finland",
                      "France",
                      "Gabon",
                      "Gambia",
                      "Georgia",
                      "Germany",
                      "Ghana",
                      "Grand Duchy of Tuscany",
                      "Greece",
                      "Grenada",
                      "Guatemala",
                      "Guinea",
                      "Guinea-Bissau",
                      // "Guyana",
                      "Haiti",
                      "Hanover",
                      "Hanseatic Republics",
                      "Hawaii",
                      "Hesse",
                      "Holy See",
                      "Honduras",
                      "Hungary",
                      "Iceland",
                      "India",
                      "Indonesia",
                      "Iran",
                      "Iraq",
                      "Ireland",
                      "Israel",
                      "Italy",
                      "Jamaica",
                      "Japan",
                      "Jordan",
                      "Kazakhstan",
                      "Kenya",
                      "Kingdom of Serbia/Yugoslavia",
                      "Kiribati",
                      "Korea",
                      "Kosovo",
                      "Kuwait",
                      "Kyrgyzstan",
                      "Laos",
                      "Latvia",
                      "Lebanon",
                      "Lesotho",
                      "Lew Chew (Loochoo)",
                      "Liberia",
                      "Libya",
                      "Liechtenstein",
                      "Lithuania",
                      "Luxembourg",
                      "Madagascar",
                      "Malawi",
                      "Malaysia",
                      "Maldives",
                      "Mali",
                      "Malta",
                      "Marshall Islands",
                      "Mauritania",
                      "Mauritius",
                      "Mecklenburg-Schwerin",
                      "Mecklenburg-Strelitz",
                      "Mexico",
                      "Micronesia",
                      "Moldova",
                      "Monaco",
                      "Mongolia",
                      "Montenegro",
                      "Morocco",
                      "Mozambique",
                      "Namibia",
                      "Nassau",
                      "Nauru",
                      "Nepal",
                      "Netherlands",
                      "New Zealand",
                      "Nicaragua",
                      "Niger",
                      "Nigeria",
                      "North German Confederation",
                      "North German Union",
                      "North Macedonia",
                      "North Korea"
                          "Norway",
                      "Oldenburg",
                      "Oman",
                      "Orange Free State",
                      "Pakistan",
                      "Palau",
                      "Panama",
                      "Papal States",
                      "Papua New Guinea",
                      "Paraguay",
                      "Peru",
                      "Philippines",
                      "Piedmont-Sardinia",
                      "Poland",
                      "Portugal",
                      "Qatar",
                      "Republic of Genoa",
                      "Republic of the Congo",
                      "Romania",
                      "Russia",
                      "Rwanda",
                      "Saint Kitts and Nevis",
                      "Saint Lucia",
                      "Saint Vincent and the Grenadines",
                      "Samoa",
                      "San Marino",
                      "Sao Tome and Principe",
                      "Saudi Arabia",
                      "Schaumburg-Lippe",
                      "Senegal",
                      "Serbia",
                      "Seychelles",
                      "Sierra Leone",
                      "Singapore",
                      "Slovakia",
                      "Slovenia",
                      "Solomon Islands",
                      "Somalia",
                      "South Africa",
                      "South Korea",
                      "South Sudan",
                      "Soviet Union",
                      "Spain",
                      "Sri Lanka",
                      "Sudan",
                      "Suriname",
                      "Sweden",
                      "Switzerland",
                      "Syria",
                      "Tajikistan",
                      "Tanzania",
                      "Thailand",
                      "Timor-Leste",
                      "Togo",
                      "Tonga",
                      "Trinidad and Tobago",
                      "Tunisia",
                      "Turkey",
                      "Turkmenistan",
                      "Tuvalu",
                      "Two Sicilies",
                      "Uganda",
                      "Ukraine",
                      "United Arab Emirates",
                      "United Kingdom",
                      "Uruguay",
                      "Uzbekistan",
                      "Vanuatu",
                      "Venezuela",
                      "Vietnam",
                      "Württemberg",
                      "Yemen",
                      "Zambia",
                      "Zimbabwe",
                    ],
                    hint: "--Select your Country Of Issue--",
                    onChanged: (v) {
                      setState(() {
                        countryOfIssue = v!;
                      });
                    },
                    selectedItem: "--Select your Country Of Issue--"),
              ),

              ///nationalityMentioned
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your nationality mentioned therein--",
                      "Afghan",
                      "Albanian",
                      "Algerian",
                      "American",
                      "Andorran",
                      "Angolan",
                      "Anguillan",
                      "Citizen of Antigua and Barbuda",
                      "Argentine",
                      "Armenian",
                      "Australian",
                      "Austrian",
                      "Azerbaijani",
                      "Bahamian",
                      "Bahraini",
                      "Bangladeshi",
                      "Barbadian",
                      "Belarusian",
                      "Belgian",
                      "Belizean",
                      "Beninese",
                      "Bermudian",
                      "Bhutanese",
                      "Bolivian",
                      "Citizen of Bosnia and Herzegovina",
                      "Botswanan",
                      "Brazilian",
                      "British",
                      "British Virgin Islander",
                      "Bruneian",
                      "Bulgarian",
                      "Burkinan",
                      "Burmese",
                      "Burundian",
                      "Cambodian",
                      "Cameroonian",
                      "Canadian",
                      "Cape Verdean",
                      "Cayman Islander",
                      "Central African",
                      "Chadian",
                      "Chilean",
                      "Chinese",
                      "Colombian",
                      "Comoran",
                      "Congolese (Congo)",
                      "Congolese (DRC)",
                      "Cook Islander",
                      "Costa Rican",
                      "Croatian",
                      "Cuban",
                      "Cymraes",
                      "Cymro",
                      "Cypriot",
                      "Czech",
                      "Danish",
                      "Djiboutian",
                      "Dominican",
                      "Citizen of the Dominican Republic",
                      "Dutch",
                      "East Timorese",
                      "Ecuadorean",
                      "Egyptian",
                      "Emirati",
                      "English",
                      "Equatorial Guinean",
                      "Eritrean",
                      "Estonian",
                      "Ethiopian",
                      "Faroese",
                      "Fijian",
                      "Filipino",
                      "Finnish",
                      "French",
                      "Gabonese",
                      "Gambian",
                      "Georgian",
                      "German",
                      "Ghanaian",
                      "Gibraltarian",
                      "Greek",
                      "Greenlandic",
                      "Grenadian",
                      "Guamanian",
                      "Guatemalan",
                      "Citizen of Guinea-Bissau",
                      "Guinean",
                      "Guyanese",
                      "Haitian",
                      "Honduran",
                      "Hong Konger",
                      "Hungarian",
                      "Icelandic",
                      "Indian",
                      "Indonesian",
                      "Iranian",
                      "Iraqi",
                      "Irish",
                      "Israeli",
                      "Italian",
                      "Ivorian",
                      "Jamaican",
                      "Japanese",
                      "Jordanian",
                      "Kazakh",
                      "Kenyan",
                      "Kittitian",
                      "Citizen of Kiribati",
                      "Kosovan",
                      "Kuwaiti",
                      "Kyrgyz",
                      "Lao",
                      "Latvian",
                      "Lebanese",
                      "Liberian",
                      "Libyan",
                      "Liechtenstein citizen",
                      "Lithuanian",
                      "Luxembourger",
                      "Macanese",
                      "Macedonian",
                      "Malagasy",
                      "Malawian",
                      "Malaysian",
                      "Maldivian",
                      "Malian",
                      "Maltese",
                      "Marshallese",
                      "Martiniquais",
                      "Mauritanian",
                      "Mauritian",
                      "Mexican",
                      "Micronesian",
                      "Moldovan",
                      "Monegasque",
                      "Mongolian",
                      "Montenegrin",
                      "Montserratian",
                      "Moroccan",
                      "Mosotho",
                      "Mozambican",
                      "Namibian",
                      "Nauruan",
                      "Nepalese",
                      "New Zealander",
                      "Nicaraguan",
                      "Nigerian",
                      "Nigerien",
                      "Niuean",
                      "North Korean",
                      "Northern Irish",
                      "Norwegian",
                      "Omani",
                      "Pakistani",
                      "Palauan",
                      "Palestinian",
                      "Panamanian",
                      "Papua New Guinean",
                      "Paraguayan",
                      "Peruvian",
                      "Pitcairn Islander",
                      "Polish",
                      "Portuguese",
                      "Prydeinig",
                      "Puerto Rican",
                      "Qatari",
                      "Romanian",
                      "Russian",
                      "Rwandan",
                      "Salvadorean",
                      "Sammarinese",
                      "Samoan",
                      "Sao Tomean",
                      "Saudi Arabian",
                      "Scottish",
                      "Senegalese",
                      "Serbian",
                      "Citizen of Seychelles",
                      "Sierra Leonean",
                      "Singaporean",
                      "Slovak",
                      "Slovenian",
                      "Solomon Islander",
                      "Somali",
                      "South African",
                      "South Korean",
                      "South Sudanese",
                      "Spanish",
                      "Sri Lankan",
                      "St Helenian",
                      "St Lucian",
                      "Stateless",
                      "Sudanese",
                      "Surinamese",
                      "Swazi",
                      "Swedish",
                      "Swiss",
                      "Syrian",
                      "Taiwanese",
                      "Tajik",
                      "Tanzanian",
                      "Thai",
                      "Togolese",
                      "Tongan",
                      "Trinidadian",
                      "Tristanian",
                      "Tunisian",
                      "Turkish",
                      "Turkmen",
                      "Turks and Caicos Islander",
                      "Tuvaluan",
                      "Ugandan",
                      "Ukrainian",
                      "Uruguayan",
                      "Uzbek"
                          "Vatican citizen",
                      "Citizen of Vanuatu",
                      "Venezuelan",
                      "Vietnamese",
                      "Vincentian",
                      "Wallisian	Welsh",
                      "Yemeni"
                    ],
                    hint: "--Select your nationality mentioned therein--",
                    onChanged: (v) {
                      setState(() {
                        nationalityMentioned = v!;
                      });
                    },
                    selectedItem:
                    "--Select your nationality mentioned therein--"),
              ),
            ],
          ),
        ),
      ),
    ),
    Step(
      state: _activeStepIndex >= 3 ? StepState.indexed : StepState.complete,
      isActive: _activeStepIndex >= 3,
      title: const Text("Address"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ///Present address
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Present Address",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.baloo2(
                      fontSize: 16.0,
                    )),
              ),

              ///houseNumber/Street
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: houseNumberStreet,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Present House Number/Street",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "Present House Number/Street",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///presentCity
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: presentCity,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Present Village/Town/City",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "Present Village/Town/City",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///presentCountry
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your Present Country--",
                      "Afghanistan",
                      "Albania",
                      "Algeria",
                      "Andorra",
                      "Angola",
                      "Antigua and Barbuda",
                      "Argentina",
                      "Armenia",
                      "Australia",
                      "Austria",
                      "Austrian Empire",
                      "Azerbaijan",
                      "Baden",
                      "The Bahamas",
                      "Bahrain",
                      "Bangladesh",
                      "Barbados",
                      "Bavaria",
                      "Belarus",
                      "Belgium",
                      "Belize",
                      "Benin (Dahomey)",
                      "Bolivia",
                      "Bosnia and Herzegovina",
                      "Botswana",
                      "Brazil",
                      "Brunei",
                      "Bulgaria",
                      "Burkina Faso (Upper Volta)",
                      "Burma",
                      "Burundi",
                      "Cabo Verde",
                      "Cambodia",
                      "Cameroon",
                      "Canada",
                      "Cayman Islands",
                      "Central African Republic",
                      "Central American Federation",
                      "Chad",
                      "Chile",
                      "China",
                      "Colombia",
                      "Comoros",
                      "Congo Free State",
                      "Costa Rica",
                      "Cote d’Ivoire (Ivory Coast)",
                      "Croatia",
                      "Cuba",
                      "Cyprus",
                      "Czechia",
                      "Czechoslovakia",
                      "Democratic Republic of the Congo",
                      "Denmark",
                      "Djibouti",
                      "Dominica",
                      "Dominican Republic",
                      "Duchy of Brunswick-Lüneburg",
                      "Duchy of Parma",
                      "East Germany (German Democratic Republic)",
                      "Ecuador",
                      "Egypt",
                      "El Salvador",
                      "Equatorial Guinea",
                      "Eritrea",
                      "Estonia",
                      "Eswatini",
                      "Ethiopia",
                      "Federal Government of Germany (1848-49)",
                      "Fiji",
                      "Finland",
                      "France",
                      "Gabon",
                      "Gambia",
                      "Georgia",
                      "Germany",
                      "Ghana",
                      "Grand Duchy of Tuscany",
                      "Greece",
                      "Grenada",
                      "Guatemala",
                      "Guinea",
                      "Guinea-Bissau",
                      // "Guyana",
                      "Haiti",
                      "Hanover",
                      "Hanseatic Republics",
                      "Hawaii",
                      "Hesse",
                      "Holy See",
                      "Honduras",
                      "Hungary",
                      "Iceland",
                      "India",
                      "Indonesia",
                      "Iran",
                      "Iraq",
                      "Ireland",
                      "Israel",
                      "Italy",
                      "Jamaica",
                      "Japan",
                      "Jordan",
                      "Kazakhstan",
                      "Kenya",
                      "Kingdom of Serbia/Yugoslavia",
                      "Kiribati",
                      "Korea",
                      "Kosovo",
                      "Kuwait",
                      "Kyrgyzstan",
                      "Laos",
                      "Latvia",
                      "Lebanon",
                      "Lesotho",
                      "Lew Chew (Loochoo)",
                      "Liberia",
                      "Libya",
                      "Liechtenstein",
                      "Lithuania",
                      "Luxembourg",
                      "Madagascar",
                      "Malawi",
                      "Malaysia",
                      "Maldives",
                      "Mali",
                      "Malta",
                      "Marshall Islands",
                      "Mauritania",
                      "Mauritius",
                      "Mecklenburg-Schwerin",
                      "Mecklenburg-Strelitz",
                      "Mexico",
                      "Micronesia",
                      "Moldova",
                      "Monaco",
                      "Mongolia",
                      "Montenegro",
                      "Morocco",
                      "Mozambique",
                      "Namibia",
                      "Nassau",
                      "Nauru",
                      "Nepal",
                      "Netherlands",
                      "New Zealand",
                      "Nicaragua",
                      "Niger",
                      "Nigeria",
                      "North German Confederation",
                      "North German Union",
                      "North Macedonia",
                      "North Korea"
                          "Norway",
                      "Oldenburg",
                      "Oman",
                      "Orange Free State",
                      "Pakistan",
                      "Palau",
                      "Panama",
                      "Papal States",
                      "Papua New Guinea",
                      "Paraguay",
                      "Peru",
                      "Philippines",
                      "Piedmont-Sardinia",
                      "Poland",
                      "Portugal",
                      "Qatar",
                      "Republic of Genoa",
                      "Republic of the Congo",
                      "Romania",
                      "Russia",
                      "Rwanda",
                      "Saint Kitts and Nevis",
                      "Saint Lucia",
                      "Saint Vincent and the Grenadines",
                      "Samoa",
                      "San Marino",
                      "Sao Tome and Principe",
                      "Saudi Arabia",
                      "Schaumburg-Lippe",
                      "Senegal",
                      "Serbia",
                      "Seychelles",
                      "Sierra Leone",
                      "Singapore",
                      "Slovakia",
                      "Slovenia",
                      "Solomon Islands",
                      "Somalia",
                      "South Africa",
                      "South Korea",
                      "South Sudan",
                      "Soviet Union",
                      "Spain",
                      "Sri Lanka",
                      "Sudan",
                      "Suriname",
                      "Sweden",
                      "Switzerland",
                      "Syria",
                      "Tajikistan",
                      "Tanzania",
                      "Thailand",
                      "Timor-Leste",
                      "Togo",
                      "Tonga",
                      "Trinidad and Tobago",
                      "Tunisia",
                      "Turkey",
                      "Turkmenistan",
                      "Tuvalu",
                      "Two Sicilies",
                      "Uganda",
                      "Ukraine",
                      "United Arab Emirates",
                      "United Kingdom",
                      "Uruguay",
                      "Uzbekistan",
                      "Vanuatu",
                      "Venezuela",
                      "Vietnam",
                      "Württemberg",
                      "Yemen",
                      "Zambia",
                      "Zimbabwe",
                    ],
                    hint: "--Select your Present Country--",
                    onChanged: (v) {
                      setState(() {
                        presentCountry = v!;
                      });
                    },
                    selectedItem: "--Select your Present Country--"),
              ),

              ///presentStateProvinceDistrict
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: presentStateProvinceDistrict,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Present State/Province/District",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "Present State/Province/District",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///postalZipCode
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: postalZipCode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Postal/Zip Code",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "Postal/Zip Code",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///phone
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IntlPhoneField(
                    controller: phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'US',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  )),

              ///email
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Email: ${email.text}'),
              ),

              ///Permanent address
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Permanent Address",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.baloo2(
                    fontSize: 16.0,
                  ),
                ),
              ),

              ///permanentHouseNumber/Street
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: permanentHouseNumberStreet,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Permanent House Number/Street",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "Permanent Town/City Of Birth",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///permanentCity
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: permanentCity,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Permanent Village/Town/City",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "Permanent Village/Town/City",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///permanentStateProvinceDistrict
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: permanentStateProvinceDistrict,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Permanent State/Province/District",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "Permanent State/Province/District",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    Step(
      state: _activeStepIndex >= 4 ? StepState.indexed : StepState.complete,
      isActive: _activeStepIndex >= 4,
      title: const Text("Family Details"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ///father details
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Father's Details",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.baloo2(
                      fontSize: 16.0,
                    )),
              ),

              ///fatherName
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: fatherName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Father's name",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "Father's name",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///fatherNationality
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your Father's Nationality--",
                      "Afghan",
                      "Albanian",
                      "Algerian",
                      "American",
                      "Andorran",
                      "Angolan",
                      "Anguillan",
                      "Citizen of Antigua and Barbuda",
                      "Argentine",
                      "Armenian",
                      "Australian",
                      "Austrian",
                      "Azerbaijani",
                      "Bahamian",
                      "Bahraini",
                      "Bangladeshi",
                      "Barbadian",
                      "Belarusian",
                      "Belgian",
                      "Belizean",
                      "Beninese",
                      "Bermudian",
                      "Bhutanese",
                      "Bolivian",
                      "Citizen of Bosnia and Herzegovina",
                      "Botswanan",
                      "Brazilian",
                      "British",
                      "British Virgin Islander",
                      "Bruneian",
                      "Bulgarian",
                      "Burkinan",
                      "Burmese",
                      "Burundian",
                      "Cambodian",
                      "Cameroonian",
                      "Canadian",
                      "Cape Verdean",
                      "Cayman Islander",
                      "Central African",
                      "Chadian",
                      "Chilean",
                      "Chinese",
                      "Colombian",
                      "Comoran",
                      "Congolese (Congo)",
                      "Congolese (DRC)",
                      "Cook Islander",
                      "Costa Rican",
                      "Croatian",
                      "Cuban",
                      "Cymraes",
                      "Cymro",
                      "Cypriot",
                      "Czech",
                      "Danish",
                      "Djiboutian",
                      "Dominican",
                      "Citizen of the Dominican Republic",
                      "Dutch",
                      "East Timorese",
                      "Ecuadorean",
                      "Egyptian",
                      "Emirati",
                      "English",
                      "Equatorial Guinean",
                      "Eritrean",
                      "Estonian",
                      "Ethiopian",
                      "Faroese",
                      "Fijian",
                      "Filipino",
                      "Finnish",
                      "French",
                      "Gabonese",
                      "Gambian",
                      "Georgian",
                      "German",
                      "Ghanaian",
                      "Gibraltarian",
                      "Greek",
                      "Greenlandic",
                      "Grenadian",
                      "Guamanian",
                      "Guatemalan",
                      "Citizen of Guinea-Bissau",
                      "Guinean",
                      "Guyanese",
                      "Haitian",
                      "Honduran",
                      "Hong Konger",
                      "Hungarian",
                      "Icelandic",
                      "Indian",
                      "Indonesian",
                      "Iranian",
                      "Iraqi",
                      "Irish",
                      "Israeli",
                      "Italian",
                      "Ivorian",
                      "Jamaican",
                      "Japanese",
                      "Jordanian",
                      "Kazakh",
                      "Kenyan",
                      "Kittitian",
                      "Citizen of Kiribati",
                      "Kosovan",
                      "Kuwaiti",
                      "Kyrgyz",
                      "Lao",
                      "Latvian",
                      "Lebanese",
                      "Liberian",
                      "Libyan",
                      "Liechtenstein citizen",
                      "Lithuanian",
                      "Luxembourger",
                      "Macanese",
                      "Macedonian",
                      "Malagasy",
                      "Malawian",
                      "Malaysian",
                      "Maldivian",
                      "Malian",
                      "Maltese",
                      "Marshallese",
                      "Martiniquais",
                      "Mauritanian",
                      "Mauritian",
                      "Mexican",
                      "Micronesian",
                      "Moldovan",
                      "Monegasque",
                      "Mongolian",
                      "Montenegrin",
                      "Montserratian",
                      "Moroccan",
                      "Mosotho",
                      "Mozambican",
                      "Namibian",
                      "Nauruan",
                      "Nepalese",
                      "New Zealander",
                      "Nicaraguan",
                      "Nigerian",
                      "Nigerien",
                      "Niuean",
                      "North Korean",
                      "Northern Irish",
                      "Norwegian",
                      "Omani",
                      "Pakistani",
                      "Palauan",
                      "Palestinian",
                      "Panamanian",
                      "Papua New Guinean",
                      "Paraguayan",
                      "Peruvian",
                      "Pitcairn Islander",
                      "Polish",
                      "Portuguese",
                      "Prydeinig",
                      "Puerto Rican",
                      "Qatari",
                      "Romanian",
                      "Russian",
                      "Rwandan",
                      "Salvadorean",
                      "Sammarinese",
                      "Samoan",
                      "Sao Tomean",
                      "Saudi Arabian",
                      "Scottish",
                      "Senegalese",
                      "Serbian",
                      "Citizen of Seychelles",
                      "Sierra Leonean",
                      "Singaporean",
                      "Slovak",
                      "Slovenian",
                      "Solomon Islander",
                      "Somali",
                      "South African",
                      "South Korean",
                      "South Sudanese",
                      "Spanish",
                      "Sri Lankan",
                      "St Helenian",
                      "St Lucian",
                      "Stateless",
                      "Sudanese",
                      "Surinamese",
                      "Swazi",
                      "Swedish",
                      "Swiss",
                      "Syrian",
                      "Taiwanese",
                      "Tajik",
                      "Tanzanian",
                      "Thai",
                      "Togolese",
                      "Tongan",
                      "Trinidadian",
                      "Tristanian",
                      "Tunisian",
                      "Turkish",
                      "Turkmen",
                      "Turks and Caicos Islander",
                      "Tuvaluan",
                      "Ugandan",
                      "Ukrainian",
                      "Uruguayan",
                      "Uzbek"
                          "Vatican citizen",
                      "Citizen of Vanuatu",
                      "Venezuelan",
                      "Vietnamese",
                      "Vincentian",
                      "Wallisian	Welsh",
                      "Yemeni"
                    ],
                    hint: "--Select your Father's Nationality--",
                    onChanged: (v) {
                      setState(() {
                        fatherNationality = v!;
                      });
                    },
                    selectedItem: "--Select your Father's Nationality--"),
              ),

              ///fatherPlaceOfBirth
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: fatherPlaceOfBirth,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Father's Place Of Birth",
                    prefixIcon: const Icon(
                      Icons.location_city,
                      color: Colors.grey,
                    ),
                    hintText: "Father's Place Of Birth",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///fatherCountryOfBirth
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your Father's Country Of Birth--",
                      "Afghanistan",
                      "Albania",
                      "Algeria",
                      "Andorra",
                      "Angola",
                      "Antigua and Barbuda",
                      "Argentina",
                      "Armenia",
                      "Australia",
                      "Austria",
                      "Austrian Empire",
                      "Azerbaijan",
                      "Baden",
                      "The Bahamas",
                      "Bahrain",
                      "Bangladesh",
                      "Barbados",
                      "Bavaria",
                      "Belarus",
                      "Belgium",
                      "Belize",
                      "Benin (Dahomey)",
                      "Bolivia",
                      "Bosnia and Herzegovina",
                      "Botswana",
                      "Brazil",
                      "Brunei",
                      "Bulgaria",
                      "Burkina Faso (Upper Volta)",
                      "Burma",
                      "Burundi",
                      "Cabo Verde",
                      "Cambodia",
                      "Cameroon",
                      "Canada",
                      "Cayman Islands",
                      "Central African Republic",
                      "Central American Federation",
                      "Chad",
                      "Chile",
                      "China",
                      "Colombia",
                      "Comoros",
                      "Congo Free State",
                      "Costa Rica",
                      "Cote d’Ivoire (Ivory Coast)",
                      "Croatia",
                      "Cuba",
                      "Cyprus",
                      "Czechia",
                      "Czechoslovakia",
                      "Democratic Republic of the Congo",
                      "Denmark",
                      "Djibouti",
                      "Dominica",
                      "Dominican Republic",
                      "Duchy of Brunswick-Lüneburg",
                      "Duchy of Parma",
                      "East Germany (German Democratic Republic)",
                      "Ecuador",
                      "Egypt",
                      "El Salvador",
                      "Equatorial Guinea",
                      "Eritrea",
                      "Estonia",
                      "Eswatini",
                      "Ethiopia",
                      "Federal Government of Germany (1848-49)",
                      "Fiji",
                      "Finland",
                      "France",
                      "Gabon",
                      "Gambia",
                      "Georgia",
                      "Germany",
                      "Ghana",
                      "Grand Duchy of Tuscany",
                      "Greece",
                      "Grenada",
                      "Guatemala",
                      "Guinea",
                      "Guinea-Bissau",
                      // "Guyana",
                      "Haiti",
                      "Hanover",
                      "Hanseatic Republics",
                      "Hawaii",
                      "Hesse",
                      "Holy See",
                      "Honduras",
                      "Hungary",
                      "Iceland",
                      "India",
                      "Indonesia",
                      "Iran",
                      "Iraq",
                      "Ireland",
                      "Israel",
                      "Italy",
                      "Jamaica",
                      "Japan",
                      "Jordan",
                      "Kazakhstan",
                      "Kenya",
                      "Kingdom of Serbia/Yugoslavia",
                      "Kiribati",
                      "Korea",
                      "Kosovo",
                      "Kuwait",
                      "Kyrgyzstan",
                      "Laos",
                      "Latvia",
                      "Lebanon",
                      "Lesotho",
                      "Lew Chew (Loochoo)",
                      "Liberia",
                      "Libya",
                      "Liechtenstein",
                      "Lithuania",
                      "Luxembourg",
                      "Madagascar",
                      "Malawi",
                      "Malaysia",
                      "Maldives",
                      "Mali",
                      "Malta",
                      "Marshall Islands",
                      "Mauritania",
                      "Mauritius",
                      "Mecklenburg-Schwerin",
                      "Mecklenburg-Strelitz",
                      "Mexico",
                      "Micronesia",
                      "Moldova",
                      "Monaco",
                      "Mongolia",
                      "Montenegro",
                      "Morocco",
                      "Mozambique",
                      "Namibia",
                      "Nassau",
                      "Nauru",
                      "Nepal",
                      "Netherlands",
                      "New Zealand",
                      "Nicaragua",
                      "Niger",
                      "Nigeria",
                      "North German Confederation",
                      "North German Union",
                      "North Macedonia",
                      "North Korea"
                          "Norway",
                      "Oldenburg",
                      "Oman",
                      "Orange Free State",
                      "Pakistan",
                      "Palau",
                      "Panama",
                      "Papal States",
                      "Papua New Guinea",
                      "Paraguay",
                      "Peru",
                      "Philippines",
                      "Piedmont-Sardinia",
                      "Poland",
                      "Portugal",
                      "Qatar",
                      "Republic of Genoa",
                      "Republic of the Congo",
                      "Romania",
                      "Russia",
                      "Rwanda",
                      "Saint Kitts and Nevis",
                      "Saint Lucia",
                      "Saint Vincent and the Grenadines",
                      "Samoa",
                      "San Marino",
                      "Sao Tome and Principe",
                      "Saudi Arabia",
                      "Schaumburg-Lippe",
                      "Senegal",
                      "Serbia",
                      "Seychelles",
                      "Sierra Leone",
                      "Singapore",
                      "Slovakia",
                      "Slovenia",
                      "Solomon Islands",
                      "Somalia",
                      "South Africa",
                      "South Korea",
                      "South Sudan",
                      "Soviet Union",
                      "Spain",
                      "Sri Lanka",
                      "Sudan",
                      "Suriname",
                      "Sweden",
                      "Switzerland",
                      "Syria",
                      "Tajikistan",
                      "Tanzania",
                      "Thailand",
                      "Timor-Leste",
                      "Togo",
                      "Tonga",
                      "Trinidad and Tobago",
                      "Tunisia",
                      "Turkey",
                      "Turkmenistan",
                      "Tuvalu",
                      "Two Sicilies",
                      "Uganda",
                      "Ukraine",
                      "United Arab Emirates",
                      "United Kingdom",
                      "Uruguay",
                      "Uzbekistan",
                      "Vanuatu",
                      "Venezuela",
                      "Vietnam",
                      "Württemberg",
                      "Yemen",
                      "Zambia",
                      "Zimbabwe",
                    ],
                    hint: "--Select your Father's Country Of Birth--",
                    onChanged: (v) {
                      setState(() {
                        fatherCountryOfBirth = v!;
                      });
                    },
                    selectedItem:
                    "--Select your Father's Country Of Birth--"),
              ),
              SizedBox(height: 10),

              ///mother details
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Mother's Details",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.baloo2(
                      fontSize: 16.0,
                    )),
              ),

              ///motherName
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: motherName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mother's name",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "Mother's name",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///motherNationality
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your Mother's Nationality--",
                      "Afghan",
                      "Albanian",
                      "Algerian",
                      "American",
                      "Andorran",
                      "Angolan",
                      "Anguillan",
                      "Citizen of Antigua and Barbuda",
                      "Argentine",
                      "Armenian",
                      "Australian",
                      "Austrian",
                      "Azerbaijani",
                      "Bahamian",
                      "Bahraini",
                      "Bangladeshi",
                      "Barbadian",
                      "Belarusian",
                      "Belgian",
                      "Belizean",
                      "Beninese",
                      "Bermudian",
                      "Bhutanese",
                      "Bolivian",
                      "Citizen of Bosnia and Herzegovina",
                      "Botswanan",
                      "Brazilian",
                      "British",
                      "British Virgin Islander",
                      "Bruneian",
                      "Bulgarian",
                      "Burkinan",
                      "Burmese",
                      "Burundian",
                      "Cambodian",
                      "Cameroonian",
                      "Canadian",
                      "Cape Verdean",
                      "Cayman Islander",
                      "Central African",
                      "Chadian",
                      "Chilean",
                      "Chinese",
                      "Colombian",
                      "Comoran",
                      "Congolese (Congo)",
                      "Congolese (DRC)",
                      "Cook Islander",
                      "Costa Rican",
                      "Croatian",
                      "Cuban",
                      "Cymraes",
                      "Cymro",
                      "Cypriot",
                      "Czech",
                      "Danish",
                      "Djiboutian",
                      "Dominican",
                      "Citizen of the Dominican Republic",
                      "Dutch",
                      "East Timorese",
                      "Ecuadorean",
                      "Egyptian",
                      "Emirati",
                      "English",
                      "Equatorial Guinean",
                      "Eritrean",
                      "Estonian",
                      "Ethiopian",
                      "Faroese",
                      "Fijian",
                      "Filipino",
                      "Finnish",
                      "French",
                      "Gabonese",
                      "Gambian",
                      "Georgian",
                      "German",
                      "Ghanaian",
                      "Gibraltarian",
                      "Greek",
                      "Greenlandic",
                      "Grenadian",
                      "Guamanian",
                      "Guatemalan",
                      "Citizen of Guinea-Bissau",
                      "Guinean",
                      "Guyanese",
                      "Haitian",
                      "Honduran",
                      "Hong Konger",
                      "Hungarian",
                      "Icelandic",
                      "Indian",
                      "Indonesian",
                      "Iranian",
                      "Iraqi",
                      "Irish",
                      "Israeli",
                      "Italian",
                      "Ivorian",
                      "Jamaican",
                      "Japanese",
                      "Jordanian",
                      "Kazakh",
                      "Kenyan",
                      "Kittitian",
                      "Citizen of Kiribati",
                      "Kosovan",
                      "Kuwaiti",
                      "Kyrgyz",
                      "Lao",
                      "Latvian",
                      "Lebanese",
                      "Liberian",
                      "Libyan",
                      "Liechtenstein citizen",
                      "Lithuanian",
                      "Luxembourger",
                      "Macanese",
                      "Macedonian",
                      "Malagasy",
                      "Malawian",
                      "Malaysian",
                      "Maldivian",
                      "Malian",
                      "Maltese",
                      "Marshallese",
                      "Martiniquais",
                      "Mauritanian",
                      "Mauritian",
                      "Mexican",
                      "Micronesian",
                      "Moldovan",
                      "Monegasque",
                      "Mongolian",
                      "Montenegrin",
                      "Montserratian",
                      "Moroccan",
                      "Mosotho",
                      "Mozambican",
                      "Namibian",
                      "Nauruan",
                      "Nepalese",
                      "New Zealander",
                      "Nicaraguan",
                      "Nigerian",
                      "Nigerien",
                      "Niuean",
                      "North Korean",
                      "Northern Irish",
                      "Norwegian",
                      "Omani",
                      "Pakistani",
                      "Palauan",
                      "Palestinian",
                      "Panamanian",
                      "Papua New Guinean",
                      "Paraguayan",
                      "Peruvian",
                      "Pitcairn Islander",
                      "Polish",
                      "Portuguese",
                      "Prydeinig",
                      "Puerto Rican",
                      "Qatari",
                      "Romanian",
                      "Russian",
                      "Rwandan",
                      "Salvadorean",
                      "Sammarinese",
                      "Samoan",
                      "Sao Tomean",
                      "Saudi Arabian",
                      "Scottish",
                      "Senegalese",
                      "Serbian",
                      "Citizen of Seychelles",
                      "Sierra Leonean",
                      "Singaporean",
                      "Slovak",
                      "Slovenian",
                      "Solomon Islander",
                      "Somali",
                      "South African",
                      "South Korean",
                      "South Sudanese",
                      "Spanish",
                      "Sri Lankan",
                      "St Helenian",
                      "St Lucian",
                      "Stateless",
                      "Sudanese",
                      "Surinamese",
                      "Swazi",
                      "Swedish",
                      "Swiss",
                      "Syrian",
                      "Taiwanese",
                      "Tajik",
                      "Tanzanian",
                      "Thai",
                      "Togolese",
                      "Tongan",
                      "Trinidadian",
                      "Tristanian",
                      "Tunisian",
                      "Turkish",
                      "Turkmen",
                      "Turks and Caicos Islander",
                      "Tuvaluan",
                      "Ugandan",
                      "Ukrainian",
                      "Uruguayan",
                      "Uzbek"
                          "Vatican citizen",
                      "Citizen of Vanuatu",
                      "Venezuelan",
                      "Vietnamese",
                      "Vincentian",
                      "Wallisian	Welsh",
                      "Yemeni"
                    ],
                    hint: "--Select your Mother's Nationality--",
                    onChanged: (v) {
                      setState(() {
                        motherNationality = v!;
                      });
                    },
                    selectedItem: "--Select your Mother's Nationality--"),
              ),

              ///motherPlaceOfBirth
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: motherPlaceOfBirth,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mother's Place Of Birth",
                    prefixIcon: const Icon(
                      Icons.location_city,
                      color: Colors.grey,
                    ),
                    hintText: "Mother's Place Of Birth",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///motherCountryOfBirth
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your Mother's Country Of Birth--",
                      "Afghanistan",
                      "Albania",
                      "Algeria",
                      "Andorra",
                      "Angola",
                      "Antigua and Barbuda",
                      "Argentina",
                      "Armenia",
                      "Australia",
                      "Austria",
                      "Austrian Empire",
                      "Azerbaijan",
                      "Baden",
                      "The Bahamas",
                      "Bahrain",
                      "Bangladesh",
                      "Barbados",
                      "Bavaria",
                      "Belarus",
                      "Belgium",
                      "Belize",
                      "Benin (Dahomey)",
                      "Bolivia",
                      "Bosnia and Herzegovina",
                      "Botswana",
                      "Brazil",
                      "Brunei",
                      "Bulgaria",
                      "Burkina Faso (Upper Volta)",
                      "Burma",
                      "Burundi",
                      "Cabo Verde",
                      "Cambodia",
                      "Cameroon",
                      "Canada",
                      "Cayman Islands",
                      "Central African Republic",
                      "Central American Federation",
                      "Chad",
                      "Chile",
                      "China",
                      "Colombia",
                      "Comoros",
                      "Congo Free State",
                      "Costa Rica",
                      "Cote d’Ivoire (Ivory Coast)",
                      "Croatia",
                      "Cuba",
                      "Cyprus",
                      "Czechia",
                      "Czechoslovakia",
                      "Democratic Republic of the Congo",
                      "Denmark",
                      "Djibouti",
                      "Dominica",
                      "Dominican Republic",
                      "Duchy of Brunswick-Lüneburg",
                      "Duchy of Parma",
                      "East Germany (German Democratic Republic)",
                      "Ecuador",
                      "Egypt",
                      "El Salvador",
                      "Equatorial Guinea",
                      "Eritrea",
                      "Estonia",
                      "Eswatini",
                      "Ethiopia",
                      "Federal Government of Germany (1848-49)",
                      "Fiji",
                      "Finland",
                      "France",
                      "Gabon",
                      "Gambia",
                      "Georgia",
                      "Germany",
                      "Ghana",
                      "Grand Duchy of Tuscany",
                      "Greece",
                      "Grenada",
                      "Guatemala",
                      "Guinea",
                      "Guinea-Bissau",
                      // "Guyana",
                      "Haiti",
                      "Hanover",
                      "Hanseatic Republics",
                      "Hawaii",
                      "Hesse",
                      "Holy See",
                      "Honduras",
                      "Hungary",
                      "Iceland",
                      "India",
                      "Indonesia",
                      "Iran",
                      "Iraq",
                      "Ireland",
                      "Israel",
                      "Italy",
                      "Jamaica",
                      "Japan",
                      "Jordan",
                      "Kazakhstan",
                      "Kenya",
                      "Kingdom of Serbia/Yugoslavia",
                      "Kiribati",
                      "Korea",
                      "Kosovo",
                      "Kuwait",
                      "Kyrgyzstan",
                      "Laos",
                      "Latvia",
                      "Lebanon",
                      "Lesotho",
                      "Lew Chew (Loochoo)",
                      "Liberia",
                      "Libya",
                      "Liechtenstein",
                      "Lithuania",
                      "Luxembourg",
                      "Madagascar",
                      "Malawi",
                      "Malaysia",
                      "Maldives",
                      "Mali",
                      "Malta",
                      "Marshall Islands",
                      "Mauritania",
                      "Mauritius",
                      "Mecklenburg-Schwerin",
                      "Mecklenburg-Strelitz",
                      "Mexico",
                      "Micronesia",
                      "Moldova",
                      "Monaco",
                      "Mongolia",
                      "Montenegro",
                      "Morocco",
                      "Mozambique",
                      "Namibia",
                      "Nassau",
                      "Nauru",
                      "Nepal",
                      "Netherlands",
                      "New Zealand",
                      "Nicaragua",
                      "Niger",
                      "Nigeria",
                      "North German Confederation",
                      "North German Union",
                      "North Macedonia",
                      "North Korea"
                          "Norway",
                      "Oldenburg",
                      "Oman",
                      "Orange Free State",
                      "Pakistan",
                      "Palau",
                      "Panama",
                      "Papal States",
                      "Papua New Guinea",
                      "Paraguay",
                      "Peru",
                      "Philippines",
                      "Piedmont-Sardinia",
                      "Poland",
                      "Portugal",
                      "Qatar",
                      "Republic of Genoa",
                      "Republic of the Congo",
                      "Romania",
                      "Russia",
                      "Rwanda",
                      "Saint Kitts and Nevis",
                      "Saint Lucia",
                      "Saint Vincent and the Grenadines",
                      "Samoa",
                      "San Marino",
                      "Sao Tome and Principe",
                      "Saudi Arabia",
                      "Schaumburg-Lippe",
                      "Senegal",
                      "Serbia",
                      "Seychelles",
                      "Sierra Leone",
                      "Singapore",
                      "Slovakia",
                      "Slovenia",
                      "Solomon Islands",
                      "Somalia",
                      "South Africa",
                      "South Korea",
                      "South Sudan",
                      "Soviet Union",
                      "Spain",
                      "Sri Lanka",
                      "Sudan",
                      "Suriname",
                      "Sweden",
                      "Switzerland",
                      "Syria",
                      "Tajikistan",
                      "Tanzania",
                      "Thailand",
                      "Timor-Leste",
                      "Togo",
                      "Tonga",
                      "Trinidad and Tobago",
                      "Tunisia",
                      "Turkey",
                      "Turkmenistan",
                      "Tuvalu",
                      "Two Sicilies",
                      "Uganda",
                      "Ukraine",
                      "United Arab Emirates",
                      "United Kingdom",
                      "Uruguay",
                      "Uzbekistan",
                      "Vanuatu",
                      "Venezuela",
                      "Vietnam",
                      "Württemberg",
                      "Yemen",
                      "Zambia",
                      "Zimbabwe",
                    ],
                    hint: "--Select your Mother's Country Of Birth--",
                    onChanged: (v) {
                      setState(() {
                        motherCountryOfBirth = v!;
                      });
                    },
                    selectedItem:
                    "--Select your Mother's Country Of Birth--"),
              ),
              SizedBox(height: 10),

              ///Applicant's Marital status
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Applicant's Marital status",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.baloo2(
                      fontSize: 16.0,
                    )),
              ),

              ///Marital status
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your Marital Status--",
                      "Single",
                      "Married",
                      // "Divorced",
                      // "Widowed",
                    ],
                    hint: "--Select your Marital Status--",
                    onChanged: (v) {
                      setState(() {
                        maritalStatus = v!;
                      });
                    },
                    selectedItem: "--Select your Marital Status--"),
              ),
            ],
          ),
        ),
      ),
    ),
    Step(
      state: _activeStepIndex >= 5 ? StepState.indexed : StepState.complete,
      isActive: _activeStepIndex >= 5,
      title: const Text("Previous Visa/Currently valid Visa Details"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ///Have you ever visited Guyana before?
              ///visitedBefore
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text(
                      "Have you ever visited Guyana before?",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.baloo2(
                        fontSize: 16.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RadioListTile(
                          title: Text("Yes"),
                          value: "Yes",
                          groupValue: visitedBefore,
                          onChanged: (value) {
                            setState(() {
                              visitedBefore = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("No"),
                          value: "No",
                          groupValue: visitedBefore,
                          onChanged: (value) {
                            setState(() {
                              visitedBefore = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///visitedAddress
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: visitedAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "List Visited Addresses in Guyana",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: "List Visited Address in Guyana",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///visitedCities
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: visitedCities,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Visited Village/Town/City in Guyana",
                    prefixIcon: const Icon(
                      Icons.location_city,
                      color: Colors.grey,
                    ),
                    hintText: "Visited Village/Town/City in Guyana",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///visaNumber
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: visaNumber,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Last/Current Guyana Visa Number",
                    prefixIcon: Icon(
                      Icons.numbers,
                      color: Colors.grey,
                    ),
                    hintText: "Last/Current Guyana Visa Number",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.number,
                ),
              ),

              ///typeOfVisa
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownSearch<String>(
                    mode: Mode.MENU,
                    showSelectedItems: true,
                    items: const [
                      "--Select your Visa Type--",
                      "Conference Visa",
                      "Tourist Visa",
                      "Medical Visa",
                      "Medical Attendant Visa"
                    ],
                    hint: "--Select your Visa Type--",
                    onChanged: (v) {
                      setState(() {
                        typeOfVisa = v!;
                      });
                    },
                    selectedItem: "--Select your Visa Type--"),
              ),

              ///visaPlaceOfIssue
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: visaPlaceOfIssue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Visa Place Of Issue",
                    prefixIcon: const Icon(
                      Icons.location_city,
                      color: Colors.grey,
                    ),
                    hintText: "Visa Place Of Issue",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///visaDateOfIssue
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: visaDateOfIssue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Visa Date Of Issue DD/MM/YYYY",
                    prefixIcon: const Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                    hintText: "Visa Date Of Issue DD/MM/YYYY",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///Has permission to visit or extend stay in Guyana previously been refused?
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text(
                        "Has permission to visit or extend stay in Guyana previously been refused?",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.baloo2(
                          fontSize: 16.0,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RadioListTile(
                          title: Text("Yes"),
                          value: "Yes",
                          groupValue: visitExtendRejected,
                          onChanged: (value) {
                            setState(() {
                              visitExtendRejected = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("No"),
                          value: "No",
                          groupValue: visitExtendRejected,
                          onChanged: (value) {
                            setState(() {
                              visitExtendRejected = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///byWhom
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: byWhom,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "If so, when and by whom (Control No. & Date)",
                    prefixIcon: const Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                    hintText: "If so, when and by whom (Control No. & Date)",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),

              ///countriesVisited10years
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: countriesVisited,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Countries Visited In The Last 10years",
                    prefixIcon: const Icon(
                      Icons.map,
                      color: Colors.grey,
                    ),
                    hintText: "Countries Visited In The Last 10years",
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    Step(
      state: _activeStepIndex >= 6 ? StepState.indexed : StepState.complete,
      isActive: _activeStepIndex >= 6,
      title: const Text("Additional Questions Details"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ///Have you ever been arrested/prosecuted/convicted by Court of Law of any country?
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text(
                        "Have you ever been arrested/prosecuted/convicted by Court of Law of any country?",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.baloo2(
                          fontSize: 16.0,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RadioListTile(
                          title: Text("Yes"),
                          value: "Yes",
                          groupValue: Q1,
                          onChanged: (value) {
                            setState(() {
                              Q1 = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("No"),
                          value: "No",
                          groupValue: Q1,
                          onChanged: (value) {
                            setState(() {
                              Q1 = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///Have you ever been refused entry/deported by any country including Guyana?
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text(
                        "Have you ever been refused entry/deported by any country including Guyana?",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.baloo2(
                          fontSize: 16.0,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RadioListTile(
                          title: Text("Yes"),
                          value: "Yes",
                          groupValue: Q2,
                          onChanged: (value) {
                            setState(() {
                              Q2 = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("No"),
                          value: "No",
                          groupValue: Q2,
                          onChanged: (value) {
                            setState(() {
                              Q2 = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///Have you ever been engaged in Human trafficking/ Drug trafficking/ Child Abuse/ Crime against women/ Economic offense/ Financial fraud?
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text(
                        "Have you ever been engaged in Human trafficking/ Drug traficking/ Child Abuse/ Crime against women/ Economic offense/ Financial fraud?",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.baloo2(
                          fontSize: 16.0,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RadioListTile(
                          title: Text("Yes"),
                          value: "Yes",
                          groupValue: Q3,
                          onChanged: (value) {
                            setState(() {
                              Q3 = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("No"),
                          value: "No",
                          groupValue: Q3,
                          onChanged: (value) {
                            setState(() {
                              Q3 = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///Have you ever been engaged in Cyber crime/ Terrorist activities/ Sabotage/ Espionage/ Genocide/ Political killing/ other act of violence?
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text(
                        "Have you ever been engaged in Cyber crime/ Terrorist activities/ Sabotage/ Espionage/ Genocide/ Political killing/ other act of violence?",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.baloo2(
                          fontSize: 16.0,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RadioListTile(
                          title: Text("Yes"),
                          value: "Yes",
                          groupValue: Q4,
                          onChanged: (value) {
                            setState(() {
                              Q4 = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("No"),
                          value: "No",
                          groupValue: Q4,
                          onChanged: (value) {
                            setState(() {
                              Q4 = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///Have you ever by any means or medium, expressed views that justify or glorify terrorist violence or that may encourage others to terrorist acts or other serious criminal acts?
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text(
                        "Have you ever by any means or medium, expressed views that justify or glorify terrorist violence or that may encourage others to terrorist acts or other serious criminal acts?",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.baloo2(
                          fontSize: 16.0,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RadioListTile(
                          title: Text("Yes"),
                          value: "Yes",
                          groupValue: Q5,
                          onChanged: (value) {
                            setState(() {
                              Q5 = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("No"),
                          value: "No",
                          groupValue: Q5,
                          onChanged: (value) {
                            setState(() {
                              Q5 = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///Have you sought asylum (political or otherwise) in any country?
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text(
                        "Have you sought asylum (political or otherwise) in any country?",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.baloo2(
                          fontSize: 16.0,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RadioListTile(
                          title: Text("Yes"),
                          value: "Yes",
                          groupValue: Q6,
                          onChanged: (value) {
                            setState(() {
                              Q6 = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text("No"),
                          value: "No",
                          groupValue: Q6,
                          onChanged: (value) {
                            setState(() {
                              Q6 = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///agree we are not liable for any false statement
              Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _checked,
                          onChanged: (bool? value) {
                            setState(() {
                              _checked = value!;
                            });
                          },
                          activeColor: primaryColor,
                        ),
                        const Text(
                            "I hereby declare that the information furnished above is correct to the best of my knowledge and belief. In case the information is found false at any stage, I am liable for legal action/deportation/blacklisting or any other action as deemed fit by the Government of Guyana.")
                      ])),
            ],
          ),
        ),
      ),
    ),
    Step(
      state: _activeStepIndex >= 7 ? StepState.indexed : StepState.complete,
      isActive: _activeStepIndex >= 7,
      title: const Text("Upload Photograph"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Text(
                  "Kindly ensure that the uploaded photo is as per specification mentioned below"),
              Stack(
                children: [
                  pickedFile != null
                      ? displayPickedFile()
                      : ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                        height: 300,
                        width: 300,
                        child: Icon(Icons.person)),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: IconButton(
                          hoverColor: Colors.transparent,
                          onPressed: () => pickImageFromGallery(context),
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Text("Photo Specifications",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 5),
              const Text("1. Format JPEG"
                  "\n 2. Size minimum 10 KB, Maximum 1 MB"
                  "\n 3. The minimum dimensions are 350 pixels (width) x 350 pixels (height)"
                  "\n 4. Recent front facing photograph with white background to be uploaded by the applicant"
                  "\n 5. Do not crop the Passport Image to use it as your recent photograph. Upload clear front facing with preferable white/light coloured background"
                  "\n 6. The application is liable to be rejected if the uploaded photograph are not clear and as per specification."),
            ],
          ),
        ),
      ),
    ),
    Step(
      state:
      _activeStepIndex >= 8 ? StepState.indexed : StepState.complete,
      isActive: _activeStepIndex >= 8,
      title: const Text("Upload Document"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Text(
                  "Kindly ensure that the uploaded document is as per specification mentioned below"),
              Stack(
                children: [
                  pickedFile != null
                      ? displayPickedFile()
                      : CircleAvatar(
                    radius: 50.0,
                    backgroundColor: primaryColor.withOpacity(0.1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Icon(Icons.person),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: CircleAvatar(
                        backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                        child: IconButton(
                          hoverColor: Colors.transparent,
                          onPressed: () => pickImageFromGallery(context),
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Text("Document Specifications",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(height: 5),
              const Text(
                  "1. All documents uploaded by the applicant must be in English language, failing to meet this requirement your eVisa application will be liable to rejection"
                      "\n 2. Format PDF"
                      "\n 3. Size minimum 10 KB, Maximum 300 KB"
                      "\n 4. Passport Upload - Photo page of Passport containing personal details like name, date of birth, nationality, expiry date etc. to be uploaded by the applicant"
                      "\n 5. Photo page of Passport uploaded should be of the same passport whose details are provided in Passport Details Section"
                      "\n 6. The application is liable to be rejected if the uploaded photograph are not clear and as per specification."),
            ],
          ),
        ),
      ),
    ),
    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 9,
        title: const Text("Confirm"),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ///Applicant's Details
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Applicant's Details",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.baloo2(
                        fontSize: 16.0,
                      )),
                ),
                Stack(
                  children: [
                    pickedFile != null
                        ? displayPickedFile()
                        : CircleAvatar(
                      radius: 50.0,
                      backgroundColor: primaryColor.withOpacity(0.1),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: CircleAvatar(
                          backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                          child: IconButton(
                            hoverColor: Colors.transparent,
                            onPressed: () => pickImageFromGallery(context),
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text('Name: ${surname.text} " "${givenName.text}'),
                Text('Phone: ${phone.text}'),
                Text('Email: ${email.text}'),
                Text(
                    'Permanent State/Province/District: ${permanentStateProvinceDistrict.text}'),
                Text('idNumber: ${idNumber.text}'),
                Text('Date Of Birth: ${dateOfBirth.text}'),
                Text('Gender: $gender'),
                Text('Identification Marks: ${identificationMarks.text}'),
                Text('Educational Qualification: $educationalQualification'),
                Text('Religion: $religion'),
                Text('Postal/Zip Code: ${postalZipCode.text}'),
                Text(
                    'Present House Number/Street: ${houseNumberStreet.text}'),
                Text(
                    'Present State/Province/District: ${presentStateProvinceDistrict.text}'),
                Text('Town/CityOfBirth: ${cityOfBirth.text}'),
                Text('Country Of Birth: $countryOfBirth'),
                Text('Nationality: $nationalityMentioned'),
                Text('Citizen by: $howDidYouAcquireYourNationality'),
                const SizedBox(height: 10),

                ///Passport Details
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Passport Details",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.baloo2(
                        fontSize: 16.0,
                      )),
                ),
                Text('Passport Type: $passportType'),
                Text('Passport Number: ${passportNumber.text}'),
                Text('Passport Country Of Issue: $countryOfIssue'),
                Text('Passport Place Of Issue: ${placeOfIssue.text}'),
                Text('Passport Date Of Issue: ${dateOfIssue.text}'),
                Text('Passport Date Of Expiry: ${dateOfExpiry.text}'),
                Text('Port Of Arrival: $portOfArrival'),
                Text(
                    'Expected Date Of Arrival: ${expectedDateOfArrival.text}'),
                const SizedBox(height: 10),

                ///Visa Details
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Visa Details",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.baloo2(
                        fontSize: 16.0,
                      )),
                ),
                Text('Type Of Visa: $typeOfVisa'),
                Text('Visa Number: ${visaNumber.text}'),
                Text('Visa Place Of Issue: ${visaPlaceOfIssue.text}'),
                Text('Visa Date Of Issue: ${visaDateOfIssue.text}'),
                const SizedBox(height: 20),
                const Text('ServiceFee: USD 100'),
                Text('Password: *****'),
                ElevatedButton(
                  onPressed: () => setState(() {
                    isComplete = false;
                    _activeStepIndex = 0;
                    surname.clear();
                    phone.clear();
                    email.clear();
                    idNumber.clear();
                    amount.clear();
                  }),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    textStyle: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ),
        )),
  ];

  _handlePaymentInitialization() async {
    final Customer customer = Customer(email: "${email.text}");

    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: "FLWPUBK_TEST-e232f7255b5818e3323adea6f475a988-X",
        currency: 'USD',
        redirectUrl: 'https://facebook.com',
        txRef: Uuid().v1(),
        amount: '100',
        customer: customer,
        paymentOptions: "card, payattitude, barter, bank transfer, ussd",
        customization: Customization(title: "Online Visa Service Fee"),
        isTestMode: true);
    final ChargeResponse response = await flutterwave.charge();
    Fluttertoast.showToast(
      msg: "Payment Successful!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER_LEFT,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    print("${response.toJson()}");
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stepper(
        onStepTapped: (step) => setState(() => _activeStepIndex = step),
        type: StepperType.vertical,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          final isLastStep = _activeStepIndex == stepList().length - 1;

          if (isLastStep) {
            // setState(() => isComplete = true);
            print('complete');
            _handlePaymentInitialization;
            ///send data to server
          } else {
            setState(() => _activeStepIndex += 1);
          }
        },
        onStepCancel: _activeStepIndex == 0
            ? null
            : () => setState(() => _activeStepIndex -= 1),
        controlsBuilder:
            (BuildContext context, ControlsDetails controls) {
          final isLastStep = _activeStepIndex == stepList().length - 1;
          return Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: isLastStep
                      ? ElevatedButton(
                      onPressed: controls.onStepContinue,
                      child: Text('Confirm'))
                      : ElevatedButton(
                      onPressed: controls.onStepContinue,
                      child: Text('Next')),
                ),
                const SizedBox(width: 12),
                if (_activeStepIndex != 0)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: controls.onStepCancel,
                      child: Text('Back'),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
