// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/app_styles.dart';
import 'package:ecommerce_app/core/resources/extentions.dart';
import 'package:ecommerce_app/features/Home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/home_model.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({
    super.key,
    required this.index,
    required this.myList,
  });
  int index;
  List<HomeProduct> myList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return myList[index].discount > 0
            ? Banner(
                location: BannerLocation.topStart,
                message: 'Disscount!',
                child: Card(
                  child: Stack(children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(context.height * 0.01),
                          child: CachedNetworkImage(
                              height: context.height * 0.15,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                    size: context.height * 0.04,
                                  ),
                              fit: BoxFit.fill,
                              imageUrl: myList[index].image),
                        ),
                        Text(
                          myList[index].name,
                          maxLines: 1,
                          style:
                              AppStyles.smallCaptions(height: context.height),
                        ),
                        Padding(
                          padding: EdgeInsets.all(context.height * 0.003),
                          child: Row(
                            children: [
                              Text(
                                myList[index].discount <= 0
                                    ? 'price: ${myList[index].price.toInt()}'
                                    : 'old price: ${myList[index].price.toInt()}',
                                maxLines: 1,
                                style: AppStyles.smallCaptions(
                                    height: context.height,
                                    isDis: myList[index].discount <= 0
                                        ? TextDecoration.none
                                        : TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(context.height * 0.003),
                          child: Row(
                            children: [
                              Visibility(
                                visible: myList[index].discount > 0,
                                child: Text(
                                  'new price: ${myList[index].oldPrice.toInt()}',
                                  maxLines: 1,
                                  style: AppStyles.smallCaptions(
                                      height: context.height),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(context.height * 0.003),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                context.read<HomeBloc>().add(AddFavoriteEvent(
                                    id: myList[index].id, index: index));
                              },
                              icon: Icon(
                                myList[index].inFavorites
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: context.height * 0.035,
                              )),
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            //! no sale widget
            : Card(
                child: Stack(children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(context.height * 0.01),
                        child: CachedNetworkImage(
                            height: context.height * 0.15,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  size: context.height * 0.04,
                                ),
                            fit: BoxFit.fill,
                            imageUrl: myList[index].image),
                      ),
                      Text(
                        myList[index].name,
                        maxLines: 1,
                        style: AppStyles.smallCaptions(height: context.height),
                      ),
                      Padding(
                        padding: EdgeInsets.all(context.height * 0.003),
                        child: Row(
                          children: [
                            Text(
                              myList[index].discount <= 0
                                  ? 'price: ${myList[index].price.toInt()}'
                                  : 'old price: ${myList[index].price.toInt()}',
                              maxLines: 1,
                              style: AppStyles.smallCaptions(
                                  height: context.height),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(context.height * 0.003),
                        child: Row(
                          children: [
                            Visibility(
                              visible: myList[index].discount > 0,
                              child: Text(
                                'new price: ${myList[index].oldPrice.toInt()}',
                                maxLines: 1,
                                style: AppStyles.smallCaptions(
                                    height: context.height),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.height * 0.003),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              context.read<HomeBloc>().add(AddFavoriteEvent(
                                  id: myList[index].id, index: index));
                            },
                            icon: Icon(
                              myList[index].inFavorites
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: context.height * 0.035,
                            )),
                      ],
                    ),
                  ),
                ]),
              );
      },
    );
  }
}
