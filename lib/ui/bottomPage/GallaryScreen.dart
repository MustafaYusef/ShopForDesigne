import 'package:Shope_desgine/blocs/productsBloc.dart';
import 'package:Shope_desgine/constans.dart';
import 'package:Shope_desgine/repastory/repastory.dart';
import 'package:Shope_desgine/ui/FullScreenImage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../custumUi/circularProgress.dart';
import '../custumUi/networkError.dart';

class GallaryScreen extends StatefulWidget {
  GallaryScreen({Key key}) : super(key: key);

  @override
  _GallaryScreenState createState() => _GallaryScreenState();
}

class _GallaryScreenState extends State<GallaryScreen> {
  List<String> images = [
    "https://p.rmjo.in/productSquare/9dfflsa6-500x500.jpg",
    "https://p.rmjo.in/productSquare/fg7dypr5-500x500.jpg",
    "https://media.architecturaldigest.com/photos/5e1390eb757dbd0008847bf7/16:9/w_2560%2Cc_limit/GettyImages-1171911666.jpg",
    "https://images.contentful.com/5de70he6op10/7ka1kL1GKLjrS07iSPcKn/78bdabe0a2e0fde04cba1a1ccaa213fb/Furniture__Gateway_LP_SS_06.jpg",
    "https://www.ikea.com/images/dining-sets-03d1940e32032e44c82af0c827a2494a.jpg?f=s",
    "https://specials-images.forbesimg.com/imageserve/943910360/960x0.jpg?fit=scale",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT1DwNeleeAhcEhFUQq7S3SORZNDrER_N-ZUo4tOjdKbqJM7ak8jhRcpRD5hPW21YhWyMg-wIx-nqx87A&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTF2SYHjUmVdzW9Usgzq4IhS3Tyfm6BDqW1QBZ0-K-CzLs1kpZs-E86FSzugywdJi9g0dvtcYJBh_98GQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQQnrOXh82vyD1R80WjQcQQ_OmyUCVJlj6row&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSn4iSmZf8f2rrRrU7gQZKBKG1Ui4XWzW4TlJ-YZL3R169y1FL711vrQAu-FyCj_pMZaNhvv07A0MeOZw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTvUDnP_uxaSUJDvPoXG31CCpGxQVeU8EUVjw&usqp=CAU",
    "https://www.ikea.com/images/tv-and-media-furniture-8caa0b90cede97a760606041ce35f1f8.jpg?f=s",
    "https://i.pinimg.com/600x315/42/c6/3c/42c63cc7261605671f9b768d927b551f.jpg",
    "https://cdn.shopify.com/s/files/1/0044/1208/0217/products/VALENTINA_HIGH_BACK_OFFICE_CHAIR_BLACK_OIVALENTINAHBBLK_LS_2000x.jpg?v=1565266968",
    "https://4.imimg.com/data4/BJ/YX/ANDROID-3446679/product-500x500.jpeg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQAqrxq9GMejMXST6al5geLs69HxDswDIH_lldinb6kTbVMoq77PwEBXTvl1vE_KfpzecsU4Vt5sm5Wvg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTf46GEumlVL2VzOgaGO9--znK236zLk-hLOw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQq3dfSSJW6OFTa4jNsMqayRBv-BiIy9ZmFpQ&usqp=CAU"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: BlocProvider(create: (context) {
        return ProductsBloc(Repo: Repastory())..add(FetchAllProducts());
      }, child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsUninitialized) {
            return Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child:
                    Container(width: 40, height: 40, child: circularProgress()),
              ),
            );
          }
          if(state is ProductsNetworkError){
             
                return networkError("لا يوجد اتصال",false);
              
          }
          if (state is ProductsLoaded) {
            return Column(
              children: <Widget>[
                Container(
                    child: Expanded(
                  child: ResponsiveGridList(
                      desiredItemWidth: 100,
                      minSpacing: 5,
                      children: state.allProducts.data.map((image) {
                        return Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:
                                //  Image.network(
                                //     "https://p.rmjo.in/productSquare/9dfflsa6-500x500.jpg")
                                InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 500),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return FullScreenImage(state.allProducts.data,
                                      state.allProducts.data.indexOf(image));
                                    },
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return Align(
                                        child: FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        ),
                                      );
                                    },
                                  ),
                                );

                              },
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                                imageUrl:imageUrl+ image.image,
                                placeholder: (context, url) =>
                                    Image.asset("assets/images/fff.jpg"),
                                errorWidget: (context, url, error) =>
                                    Image.asset("assets/images/fff.jpg"),
                              ),
                            ),
                          ),
                        );
                      }).toList()),
                )),
              ],
            );
          }
        },
      )),
    );
  }
}
