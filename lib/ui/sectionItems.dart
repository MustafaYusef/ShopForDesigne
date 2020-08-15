import 'package:Shope_desgine/blocs/productsBloc.dart';
import 'package:Shope_desgine/constans.dart';
import 'package:Shope_desgine/repastory/repastory.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custumUi/circularProgress.dart';

class SectionsItemsScreen extends StatefulWidget {
  int id;
  int idCategory;
  String title;
  SectionsItemsScreen({Key key, this.id, this.title, this.idCategory})
      : super(key: key);

  @override
  _SectionsItemsScreenState createState() => _SectionsItemsScreenState();
}

class _SectionsItemsScreenState extends State<SectionsItemsScreen> {
  int _current = 0;
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
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: BlocProvider(create: (context) {
          return ProductsBloc(Repo: Repastory())
            ..add(FetchProductsByCategory(id: widget.idCategory));
        }, child:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          if (state is ProductsUninitialized) {
            return Center(
              child:
                  Container(width: 40, height: 40, child: circularProgress()),
            );
          }

          if (state is ProductsLoaded) {
            return Container(
              color: Theme.of(context).primaryColor,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_current > 0) {
                                  _current--;
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: _current == 0
                                  ? Container()
                                  : Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.grey,
                                      size: 26,
                                    ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 30),
                              child: CarouselSlider.builder(
                                itemCount: state.allProducts.data.length,
                                height: MediaQuery.of(context).size.height / 2,
                                viewportFraction: 1.0,
                                enableInfiniteScroll: true,
                                autoPlay: false,
                                aspectRatio: 2.0,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                pauseAutoPlayOnTouch: Duration(seconds: 2),
                                enlargeCenterPage: true,
                                onPageChanged: (int index) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                                scrollDirection: Axis.horizontal,
                                itemBuilder:
                                    (BuildContext context, int itemIndex) =>
                                        ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Stack(
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 400,
                                                imageUrl: imageUrl +
                                                    state.allProducts
                                                        .data[_current].image,
                                                placeholder: (context, url) =>
                                                    Image.asset(
                                                        "assets/images/fff.jpg"),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Image.asset(
                                                        "assets/images/fff.jpg"),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_current <
                                    state.allProducts.data.length - 1) {
                                  _current++;
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child:
                                  _current == state.allProducts.data.length - 1
                                      ? Container()
                                      : Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.grey,
                                          size: 26,
                                        ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.allProducts.data.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                      imageUrl: imageUrl +
                                          state.allProducts.data[index].image,
                                      placeholder: (context, url) =>
                                          Image.asset("assets/images/fff.jpg"),
                                      errorWidget: (context, url, error) =>
                                          Image.asset("assets/images/fff.jpg"),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        })));
  }
}
