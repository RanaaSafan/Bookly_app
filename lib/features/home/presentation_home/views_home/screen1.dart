
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/NewestBooks_view.dart';
import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/list_viewBooks.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles.dart';
import 'widgets_home/AppBar.dart';

class Screen1 extends StatefulWidget   {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: APPBAR(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.red, Colors.pinkAccent, Colors.pink],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ListViewBooks()),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: Text("  Best Saller",style: Stlyes.textStyle24,)),
            NewestBooksView(),
          ],
        ),
      ),
    );
  }
}