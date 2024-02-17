class Catelogmodel{
  static List<Item> items = [
    // Item(id : 4, name:"4", desc:"4", price:888, color:"4", image:"https://images.unsplash.com/photo-1566275529824-cca6d008f3da?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  ];
}
class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({ required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});

  factory Item.frommap(Map<String,dynamic>map){
    return Item(
      id:map['id'],
      name:map['name'],
      desc: map['desc'],
      price:map['price'],
      color:map['color'],
      image:map['image'],
    );
  }
  toMap() => {
    'id' : id,
    'name' : name,
    'desc' : desc,
    'price' : price,
    'color' : color,
    'image' : image,
  };


}

