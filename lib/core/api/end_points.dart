class EndPoints {
  static const String register = '/auth/signup';
  static const String login = '/auth/signin';
  static const String getAllCategories = '/categories';
  static const String getSubCategories = '/subcategories';
  static const String getAllBrands = '/brands';
  static const String getAllProducts = '/products';
  static const String wishlist = '/wishlist';
  static const String addresses = '/addresses';
  static const String cart = '/cart';

  ///--- Payment ---///
  static const String authToken = '/auth/tokens';
  static const String orderId = '/ecommerce/orders';
  static const String requestToken = '/acceptance/payment_keys';
  static const String getRefCode = '/acceptance/payments/pay';
}
