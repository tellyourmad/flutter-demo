
/// 活动

/// 活动类型
enum ActivityType {
  SECOND_KILL, // 秒杀
  SINGLE_PRODUCT, // 单品
  PURCHASE_RESTRICTION, // 限购
  GROUPON, // 拼团
  BUNDLE, // 组合促销
  CONDITION_MARK_DOWN, //满减
  CONDITION_DISCOUNT, //满折
  CONDITION_COUPON, //满赠
  SECOND_HALF_PRICE, //第二件折扣
}


/// 活动门槛类型
enum ActivityThresholdType{
  PIECE, // 数量
  PRICE, // 总价
}
