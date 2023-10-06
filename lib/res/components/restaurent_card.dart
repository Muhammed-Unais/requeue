import 'package:flutter/material.dart';
import 'package:requeue/res/constants/ksize.dart';

class RestarentCard extends StatelessWidget {
  const RestarentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsetsDirectional.all(10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: const Row(
          children: [
            Expanded(
              flex: 2,
              child: Card(
                child: Image(
                  image: AssetImage(
                    "assets/images/rq-logo-OMAR-WHITE.png",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Some title text",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Ksize.kfiveH,
                  Text(
                    "subtitle",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Ksize.kfiveH,
                  Text(
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
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text("4.5")
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
