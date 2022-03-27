import 'package:flutter/material.dart';
import 'package:state_with_bloc/models/resto_models.dart';

import '../../service/resto_service.dart';
import '../../theme/theme.dart';

class DestinationsTile extends StatelessWidget {
  // final String? name, city, imageUrl;
  // final double? ratings;
  final Restaurants resto;
  const DestinationsTile(
    this.resto, {
    Key? key,
    // @required this.name,
    // @required this.city,
    // required this.imageUrl,
    // required this.ratings
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      // imageUrl!,
                      "${RestoService.baseUrlImage}${resto.pictureId}"),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // name!,
                    resto.name!,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    // city!,
                    resto.name!,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 19,
                  height: 19,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                    'assets/Star 1.png',
                  ))),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${resto.ratings}',
                  // ratings.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
