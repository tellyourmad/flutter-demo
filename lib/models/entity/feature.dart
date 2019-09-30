/// 专题

/// 模块布局方式
enum FeatureBlockLayoutType {
  BACKGROUND,
  SEARCHBAR,
  STATUSBAR,
  BANNER,
  ICON,
  MIXN,
  MIX1,
  MIX2,
  MIX3,
  MIX4,
  MIX5,
  PROMOTION,
  COUPONS,
}

/// 模块中，子元素链接类型
enum FeatureBlockItemLinkType {
  ARTICLE, // 文章
  CATEGORY, // 分类
  STORE, // 店铺
  PRODUCT, // 商品
  PROMOTION_PAGE, // 专题
  PROMOTION, // 活动
  SECKILL, // 秒杀活动
  TELEPHONE, // 手机号
  SZB_BROADCAST, // 上直播
  MEMBRANE, // 膜品
}

class Feature {
  Feature._();
}
