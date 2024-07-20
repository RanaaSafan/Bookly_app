import 'package:booky_app/features/home/presentation_home/views_home/widgets_home/book_details.dart';
import 'package:flutter/material.dart';
import 'package:booky_app/features/home/data/models/books.dart';

class AllBooks extends StatelessWidget {
  final Books book;

  const AllBooks({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? thumbnailUrl = book.volumeInfo?.imageLinks?.thumbnail;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetails(book: book)));
        },
        child: Container(
          height: 230,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: _buildBookImage(thumbnailUrl),
          ),
        ),
      ),
    );
  }

  Widget _buildBookImage(String? thumbnailUrl) {
    if (thumbnailUrl != null && thumbnailUrl.isNotEmpty) {
      if (thumbnailUrl.startsWith('http')) {
        // Handle network images
        return Image.network(
          thumbnailUrl,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/images/book1.jpeg', fit: BoxFit.fill,);
          },
        );
      } else if (thumbnailUrl.startsWith('assets')) {
        // Handle local assets

        return Image.asset('assets/images/book1.jpeg', fit: BoxFit.fill,);
      }
    }

    // Fallback to a default image asset if thumbnailUrl is null or unrecognized format
    return Image.asset('assets/images/book1.jpeg', fit: BoxFit.fill,);

  }
}
