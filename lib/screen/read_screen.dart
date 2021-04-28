import 'package:anna_comic/state/state_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      var comic = watch(comicSelected).state;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              '${comic.name.toUpperCase()}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Center(
          child: (context.read(chapterSelected).state.links == null ||
                  context.read(chapterSelected).state.links.length == 0)
              ? Text('This chapter is translating...')
              : CarouselSlider(
                  items: context
                      .read(chapterSelected)
                      .state
                      .links
                      .map((e) => Builder(
                            builder: (context) {
                              return Image.network(e, fit: BoxFit.cover);
                            },
                          ))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: false,
                      height: MediaQuery.of(context).size.height,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                      initialPage: 0),
                ),
        ),
      );
    });
  }
}
