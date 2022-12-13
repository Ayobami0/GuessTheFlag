import "dart:math";


getRandomCountry(countries){
  // generates a new Random object
  final random = Random();

  // generate a random index based on the list length
  // and use it to retrieve the element
  var country = countries[random.nextInt(countries.length)];

  return country;
}
