class Address {
  final String city;
  final String country;
  final String? district;
  final String? village;
  final String? streetNumber;
  final String? homeNumber;

  Address({required this.city, required this.country,  this.district,  this.village,  this.streetNumber,  this.homeNumber});
}