import 'package:Shope_desgine/blocs/categoryBloc.dart';
import 'package:Shope_desgine/constans.dart';
import 'package:Shope_desgine/repastory/repastory.dart';
import 'package:Shope_desgine/ui/sectionItems.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../custumUi/circularProgress.dart';
import '../custumUi/networkError.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) {
          return CategoryBloc(Repo: Repastory())..add(FetchAllCategory());
        },
        child: Container(
            margin: EdgeInsets.only(top: 10),
            child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
              if (state is CategoryNetworkError) {
                return Container(
                    height: MediaQuery.of(context).size.height - 200,
                    child: networkError("لا يوجد اتصال", true));
              }
              if (state is CategoryLoaded) {
                return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ResponsiveGridList(
                        desiredItemWidth:
                            (MediaQuery.of(context).size.width / 2) - 10,
                        minSpacing: 5,
                        children: state.allCatgory.data.map((data) {
                          return sectionCard(data.title, data.image, data.id);
                        }).toList()));
              }
              if (state is CategoryUninitialized) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Container(
                        width: 40, height: 40, child: circularProgress()),
                  ),
                );
              }
            })
            // Column(
            //   children: <Widget>[
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[

            //            sectionCard(
            //                 "الآثاث المنزلي", "assets/images/sec1.png"),
            //         sectionCard("مطابخ", "assets/images/sec2.png"),
            //       ],
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         sectionCard("ديكورات", "assets/images/sec3.png"),
            //         sectionCard("طاولات", "assets/images/sec4.png"),
            //       ],
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         sectionCard("غرف نوم", "assets/images/sec5.png"),
            //         sectionCard("آثاث مكتبي", "assets/images/sec6.png"),
            //       ],
            //     )
            //   ],
            // ),
            ),
      ),
    );
  }
}

class sectionCard extends StatelessWidget {
  String title;
  String image;
  int id;
  sectionCard(this.title, this.image, this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return SectionsItemsScreen(id: 0, title: title, idCategory: id);
          }));
        },
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: CachedNetworkImage(
                    width: 300,
                    height: 150,
                    fit: BoxFit.fill,
                    imageUrl: imageUrl + image,
                    placeholder: (context, url) =>
                        Image.asset("assets/images/sec1.png"),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/sec1.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
