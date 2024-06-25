import 'dart:convert';

abstract class CategoryWiseNewsDataSource {
  Future<Either<AppException, CategoryWiseNewsResponseForHome>>
      fetchCategoryWiseNews({String local = "en", required String category});
  // Future<Either<AppException, PaginatedResponse>> searchPaginatedProducts(
  //     {required int skip, required String query});
}

class SliderRemoteDataSource extends CategoryWiseNewsDataSource {
  final NetworkService networkService;
  SliderRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, CategoryWiseNewsResponseForHome>>
      fetchCategoryWiseNews(
          {String local = "en", required String category}) async {
    final response = await networkService.get(
      '$local/home/$category',
    );

    return response.fold(
      (l) => Left(l),
      (r) {
        final jsonData = r.data;
        if (jsonData == null) {
          return Left(
            AppException(
              identifier: 'fetchPaginatedData',
              statusCode: 0,
              message: 'The data is not in the valid format',
            ),
          );
        }
        final paginatedResponse = CategoryWiseNewsResponseForHome.fromJson(
            jsonData, jsonDecode(jsonEncode(jsonData)));
        return Right(paginatedResponse);
      },
    );
  }

  // @override
  // Future<Either<AppException, PaginatedResponse>> searchPaginatedProducts(
  //     {required int skip, required String query}) async {
  //   final response = await networkService.get(
  //     '/products/search?q=$query',
  //     queryParameters: {
  //       'skip': skip,
  //       'limit': PRODUCTS_PER_PAGE,
  //     },
  //   );

  //   return response.fold(
  //     (l) => Left(l),
  //     (r) {
  //       final jsonData = r.data;
  //       if (jsonData == null) {
  //         return Left(
  //           AppException(
  //             identifier: 'search PaginatedData',
  //             statusCode: 0,
  //             message: 'The data is not in the valid format.',
  //           ),
  //         );
  //       }
  //       final paginatedResponse =
  //           PaginatedResponse.fromJson(jsonData, jsonData['products'] ?? []);
  //       return Right(paginatedResponse);
  //     },
  //   );
  // }
}
