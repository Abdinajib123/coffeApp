class Productmodel {
  final int pid;
  final String imgurl;
  final String title;
  final String price;
  final String shortdescription;
  final String longdecsription;
  final double rating;
  final bool isSelected;
  final int qty;

  Productmodel(
      {required this.pid,
      required this.imgurl,
      required this.title,
      required this.price,
      required this.shortdescription,
      required this.longdecsription,
      required this.rating,
      this.isSelected = false,
      this.qty = 1});
}
