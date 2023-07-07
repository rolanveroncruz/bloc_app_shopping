// ignore_for_file: prefer_const_constructors

import 'package:bloc_app/screens/home/bloc/bloc/home_bloc.dart';
import 'package:bloc_app/screens/home/ui/product_tile_widget.dart';
import 'package:bloc_app/screens/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/ui/cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigateToCartPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          } else if (state is HomeNavigateToWishlistPageActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Wishlist()));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return Scaffold(body: Center(child: CircularProgressIndicator()));

            case HomeLoadedSuccessState:
              {
                final successState = state as HomeLoadedSuccessState;
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    title: const Text('Grocery App'),
                    actions: [
                      IconButton(
                          onPressed: () {
                            homeBloc.add(HomeWishlistButtonNavigateEvent());
                          },
                          icon: Icon(Icons.favorite_border)),
                      IconButton(
                          onPressed: () {
                            homeBloc.add(HomeCartButtonNavigateEvent());
                          },
                          icon: Icon(Icons.shopping_bag_outlined))
                    ],
                  ),
                  body: ListView.builder(
                      itemCount: successState.products.length,
                      itemBuilder: (context, index) {
                        return ProductTileWidget(
                          productDataModel: successState.products[index],
                        );
                      }),
                );
              }
            case HomeErrorState:
              {
                return Scaffold(body: Center(child: Text('Error')));
              }
            default:
              return SizedBox();
          }
        });
  }
}
