import 'package:http/http.dart' as http;
import "dart:convert";

class Place {
  final String placeName;
  final String imageUrl;
  final double rating;

  Place({
    required this.placeName,
    required this.imageUrl,
    required this.rating,
  });
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      placeName: json['placeName'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
    );
  }
}

class PlaceService {
  Future<List<Place>> getPlaces() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/place'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      final results = parsed['results'];
      return results
          .map<Place>((json) => Place.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
