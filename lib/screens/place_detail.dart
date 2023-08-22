import 'package:favorite_place/models/place.dart';
import 'package:flutter/material.dart';

class PlaceDetail extends StatelessWidget {
  final Place place;
  const PlaceDetail({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(place.title),
        ),
        body: Stack(
          children: [
            Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ],
        )

        // Center(
        //   child: Text(
        //     place.title,
        //     style: Theme.of(context)
        //         .textTheme
        //         .bodyLarge!
        //         .copyWith(color: Theme.of(context).colorScheme.onBackground),
        //   ),
        // ),
        );
  }
}
