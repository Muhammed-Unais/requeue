import 'package:flutter/material.dart';
import 'package:requeue/res/constants/ksize.dart';

class RestarentCard extends StatelessWidget {
  const RestarentCard(
      {super.key, required this.image, required this.titile, this.rating});

  final String? image;
  final String? titile;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shadowColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsetsDirectional.all(10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                surfaceTintColor: Colors.white,
                child: image == null || image!.isEmpty
                    ? Image.asset(
                        "assets/images/rq-logo-OMAR-WHITE.png",
                        height: 100,
                      )
                    : Image(
                        height: 100,
                        image: NetworkImage(
                          "https://cdn.requeue.net/media/logos/$image",
                        ),
                      ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titile ?? "No titile",
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Ksize.kfiveH,
                  const Text(
                    "subtitle",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Ksize.kfiveH,
                  const Text(
                    "staus text",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      Text(
                        rating == null ? 0.0.toString() : rating.toString(),
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
