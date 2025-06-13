
/*
가 : Asset 클래스
나 : IntangibleAsset 클래스(무형자산)
다 : Patent 클새스(특허권)
 */

abstract class Asset {
  String name;
  int price;

  Asset(this.name, this.price);
}
