class ProductPOJO {


  late final String _id;
  late final String _productName;
  late List<dynamic> _image;
  late String _productDescription;
  late bool _productAvailable;
  late String _productLocation;
  late String _productPrice;


  late String _productCoverImage;


  late final String id;
  late final String productName;
  late List<dynamic> image;
  late String productDescription;
  late bool productAvailable;
  late String productLocation;
  late String productPrice;
  late String categoryId;
  late int productQunatity;
  late String sellerId;
  late String productBrand;
  late String productId;


  late String productCoverImage;

  ProductPOJO({required this.id,required this.productName,required this.image,required this.productDescription,required this.productLocation,
    required this.productPrice,required this.productCoverImage,required this.categoryId, required this.sellerId, required this.productQunatity,
  required this.productBrand,required this.productId});

  // String get productCoverImage => _productCoverImage;
  //
  // set productCoverImage(String value) {
  //   _productCoverImage = value;
  // }
  //
  // String get productPrice => _productPrice;
  //
  // set productPrice(String value) {
  //   _productPrice = value;
  // }
  //
  // String get productLocation => _productLocation;
  //
  // set productLocation(String value) {
  //   _productLocation = value;
  // }
  //
  // bool get productAvailable => _productAvailable;
  //
  // set productAvailable(bool value) {
  //   _productAvailable = value;
  // }
  //
  // String get productDescription => _productDescription;
  //
  // set productDescription(String value) {
  //   _productDescription = value;
  // }
  //
  // List<dynamic> get image => _image;
  //
  // set image(List<dynamic> value) {
  //   _image = value;
  // }
  //
  // String get productName => _productName;
  //
  // set productName(String value) {
  //   _productName = value;
  // }
  //
  // String get id => _id;
  //
  // set id(String value) {
  //   _id = value;
  // }
}