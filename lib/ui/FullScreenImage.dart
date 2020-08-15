import 'package:Shope_desgine/constans.dart';
import 'package:Shope_desgine/models/productsModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatefulWidget {
  List<Datum> images;
  int current;
  FullScreenImage(this.images, this.current);

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            "معرض الصور",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CarouselSlider.builder(
          itemCount: widget.images.length,
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          autoPlay: false,
          aspectRatio: 2.0,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: Duration(seconds: 2),
          enlargeCenterPage: true,
          onPageChanged: (int index) {
            setState(() {
              widget.current = index;
            });
          },
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int itemIndex) => Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    imageUrl: imageUrl + widget.images[widget.current].image,
                    placeholder: (context, url) =>
                        Image.asset("assets/images/fff.jpg"),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/fff.jpg"),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
