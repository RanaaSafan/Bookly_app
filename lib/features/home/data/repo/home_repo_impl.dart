import 'package:booky_app/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api_service.dart';
import '../../../../core/errors/failers.dart';
import '../models/books.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apisevice;

  HomeRepoImpl({required this.apisevice});

  @override
  Future<Either<Failers,List<Books>>> FetchAllBooks() async{
    try {
      var data = await apisevice.getBooks( endpoint: 'volumes?Filtering=free-ebooks&q=all');
      List<Books> books = [];

      for (var i in data["items"]) {
        books.add(Books.fromJson(i));
      }
      return right(books);
    } catch (e) {
        return left(ErrorService(error: e.toString()));
    }

  }

  @override
  Future<Either<Failers,List<Books>>> FetchNewestBooks() async{
    try {
      var data = await apisevice.getBooks( endpoint: 'volumes?Filtering=free-ebooks&q=scary');
      List<Books> books = [];

      for (var i in data["items"]) {
        books.add(Books.fromJson(i));
      }
      return right(books);
    } catch (e) {
      return left(ErrorService(error: e.toString()));
    }

  }

}