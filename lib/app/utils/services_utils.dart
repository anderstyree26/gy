class ServicesUtils {
  final String name;
  final String icon;
  final List<String> tool;
  final String description;

  ServicesUtils(
      {required this.name,
      required this.icon,
      required this.description,
      required this.tool});
}

List<ServicesUtils> servicesUtils = [
  ServicesUtils(
    name: 'Apply Online',
    icon: 'assets/icons/form.svg',
    description: "Upload photo and passport",
    tool: ['jpg', 'png'],
  ),
  ServicesUtils(
    name: 'Pay eVisa Fee Online',
    icon: 'assets/icons/FEE.svg',
    description: "Using Credit/Debit card/ Payment Wallet",
    tool: ['Mpesa', 'Visa', 'Master Card', "Paypal"],
  ),
  ServicesUtils(
    name: 'Receive ETA online',
    icon: 'assets/icons/ETA1.svg',
    description: "Electronic Travel Authorization/ETA will be sent to your email.",
    tool: ['pdf'],
  ),
  // ServicesUtils(
  //   name: 'Web Development',
  //   icon: 'assets/icons/website.svg',
  //   description:
  //       "Do you have an idea for your next great website? Let's make it a reality.",
  //   tool: ['Flutter', 'Html,css,js', 'Android (Kotlin or Java)'],
  // ),
];
