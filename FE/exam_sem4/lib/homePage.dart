import 'package:flutter/material.dart';
import 'package:exam_sem4/detailsPage.dart';
import 'package:exam_sem4/placeServices.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Place>> futurePlaces;

  @override
  void initState() {
    super.initState();
    futurePlaces = PlaceService().getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Place List")),
        body: Center(
          child: FutureBuilder<List<Place>>(
            future: futurePlaces,
            initialData: [],
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      Place place = snapshot.data![index];
                      return ListTile(
                        leading:
                            Image.network(place.imageUrl),
                        title: Text(place.placeName),
                        subtitle:
                            Text('Rating:${place.placeRating}'),
                        onTap: () {
                          openPage(context, place);
                        },
                      );
                    },
                    separatorBuilder: ((context, index) {
                      return const Divider(color: Colors.black26);
                    }),
                    itemCount: snapshot.data!.length);
              } else if (snapshot.hasError) {
                return Text('ERROR: ${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
          ),
        ));
  }

  openPage(context, Place place) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailsPage()));
  }
}
