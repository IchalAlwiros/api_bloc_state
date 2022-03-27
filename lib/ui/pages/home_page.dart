import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_with_bloc/cubit/resto_cubit.dart';
import 'package:state_with_bloc/ui/widgets/resto_tile.dart';

import '../../models/resto_models.dart';
import '../../theme/theme.dart';
import '../widgets/resto_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomaScreenState();
}

class _HomaScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<RestoCubit>().getResto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 50,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Howdy,',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Ichal Wira',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                'assets/pic_filled.png',
              ))),
            )
          ],
        ),
      );
    }

    Widget popularDestinations(RestaurantModel resto) {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: resto.restaurants.length,
            itemBuilder: (context, index) {
              //print('ini dari popular ${resto.restaurants[index]}');
              return CustomDestinationsCard(
                resto.restaurants[index],
              );
            },
          ),
        ),
      );

      // children: const [
      //   CustomDestinationsCard(
      //     name: 'Lake Ciliwung',
      //     imagerl: 'assets/image 7.png',
      //     city: 'Tangerang',
      //     ratings: 4.8,
      //   ),
      //   CustomDestinationsCard(
      //     name: 'Lake Ciliwung',
      //     imagerl: 'assets/image 7.png',
      //     city: 'Tangerang',
      //     ratings: 4.8,
      //   ),
      //   CustomDestinationsCard(
      //     name: 'Lake Ciliwung',
      //     imagerl: 'assets/image 7.png',
      //     city: 'Tangerang',
      //     ratings: 4.8,
      //   ),
      // ],
      // )
      //   ),
      // );
    }

    Widget newDestinatios(RestaurantModel resto) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          right: defaultMargin,
          left: defaultRadius,
          bottom: 110,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restaurant List',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),

            Column(
              children: resto.restaurants.map((Restaurants restolist) {
                return DestinationsTile(restolist);
              }).toList(),
            )
            // SizedBox(
            //   height: 300,
            //   child: ListView.builder(
            //       itemCount: resto.restaurants.length,
            //       itemBuilder: (context, index) {
            //         return DestinationsTile(resto.restaurants[index]);
            //       }),
            // )

            // DestinationsTile(
            //   name: 'Danau Beratan',
            //   city: 'Singaraja',
            //   imageUrl: 'assets/image 12.png',
            //   ratings: 4.5,
            // ),
            // DestinationsTile(
            //   name: 'Danau Beratan',
            //   city: 'Singaraja',
            //   imageUrl: 'assets/image 12.png',
            //   ratings: 4.5,
            // ),
            // DestinationsTile(
            //   name: 'Danau Beratan',
            //   city: 'Singaraja',
            //   imageUrl: 'assets/image 12.png',
            //   ratings: 4.5,
            // ),
          ],
        ),
      );
    }

    return BlocConsumer<RestoCubit, RestoState>(listener: (context, state) {
      print(' ini dari state Lisview${state}');
      // TODO: implement listener
      if (state is RestoFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: redColor,
            content: Text(state.error),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is RestoSuccess) {
        print(' ini dari state Lisview${state.resto.restaurants}');
        return ListView(
          children: [
            header(),
            popularDestinations(state.resto),
            newDestinatios(state.resto),
          ],
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
