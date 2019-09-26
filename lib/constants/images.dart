class Images {
  Images._();

  static const Map<String, dynamic> root_navigation_bar =
      const <String, dynamic>{
    'home': const <bool, String>{
      true: 'assets/images/home-active.png',
      false: 'assets/images/home-inactive.png',
    },
    'category': const <bool, String>{
      true: 'assets/images/category-active.png',
      false: 'assets/images/category-inactive.png',
    },
    'cart': const <bool, String>{
      true: 'assets/images/cart-active.png',
      false: 'assets/images/cart-inactive.png',
    },
    'mine': const <bool, String>{
      true: 'assets/images/mine-active.png',
      false: 'assets/images/mine-inactive.png',
    }
  };

  static const String mine_header = 'assets/images/mine-header.png';

  static const String login_logo = 'assets/images/login-logo.png';

  
}
