// import 'dart:convert';
//
// import 'package:krncheck/widgets/drawer.dart';
// import 'package:krncheck/widgets/themes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../models/catlog.dart';
// import '../widgets/item_widget.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class homepage extends StatefulWidget {
//   const homepage({super.key});
//
//   @override
//   State<homepage> createState() => _homepageState();
// }
//
//
// class _homepageState extends State<homepage> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loaddata();
//   }
//   loaddata() async{
//     final catlogJson = await rootBundle.loadString('assets/files/catalog.json');
//     final decodeData = jsonDecode(catlogJson);
//     var productsData = decodeData['products'];
//     Catelogmodel.items = List.from(productsData)
//         .map<Item>((item) => Item.frommap(item))
//         .toList();
//     print(productsData);
//
//     setState(() {
//
//     });
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     int days = 30;
//     String name = 'flutter';
//     double pi = 3.14;
//     bool ismale = true;
//     num temp = 3.5; //caitain int or double
//     var day = 'friday';//caotain all types datatypes
//     const pia = 3.14;// caitain not changeble value.
//     final piaa = 3.14; //caitain changeble value.
//
//
//     return  Scaffold(
//       backgroundColor: Mytheme.Cremcolor,
//       // appBar: AppBar(
//       //   title: Text('Catelog App',),
//       // ),
//       // body: Padding(
//       //   padding: const EdgeInsets.all(16.0),
//       //   child: GridView.builder(
//       //     gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
//       //         crossAxisCount: 2,
//       //         mainAxisSpacing: 16,
//       //       crossAxisSpacing: 16,
//       //     ),
//       //     itemBuilder: (context,index){
//       //       final item = Catelogmodel.items[index];
//       //       return Card(
//       //         clipBehavior: Clip.antiAlias,
//       //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       //         child: GridTile(
//       //           header: Container(child: Text(item.name,style: TextStyle(color: Colors.white),),
//       //             padding: EdgeInsets.all(15),
//       //             decoration: BoxDecoration(
//       //               color: Colors.deepPurple
//       //             ),
//       //           ),
//       //           child: Image.network(item.image),
//       //           footer: Container(child: Text(item.price.toString(),style: TextStyle(color: Colors.white),),
//       //             padding: EdgeInsets.all(15),
//       //             decoration: BoxDecoration(
//       //                 color: Colors.black
//       //             ),
//       //         ),
//       //       ),
//       //       );
//       //     },
//       //     itemCount: Catelogmodel.items.length,),
//       //   // child: ListView.builder(
//       //   //     itemCount: Catelogmodel.items.length,
//       //   //     itemBuilder:(context, index)=> ItemWidget(item: Catelogmodel.items[index],)
//       //   // ),
//       // ),
//       // drawer: MyDrawer(),
//       body:SafeArea(
//         child: Container(
//           padding: Vx.m32,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CatelogHeader(),
//               if(Catelogmodel.items.isNotEmpty)
//                 catelogList().expand()
//               else
//                 Center(child: CircularProgressIndicator(),)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class CatelogHeader extends StatelessWidget {
//   const CatelogHeader({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         'Catalog App'.text.xl5.bold.color(Mytheme.darkBluishcolor).make(),
//         'Tranding Products'.text.xl2.make(),
//
//       ],
//     );
//   }
// }
// class catelogList extends StatelessWidget {
//   const catelogList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         shrinkWrap: true,
//         itemCount: Catelogmodel.items.length,
//         itemBuilder: (context,index){
//           final catelog = Catelogmodel.items[index];
//           return CatelogItem(catelog:catelog);
//         }
//     );
//   }
// }
//
// class CatelogItem extends StatelessWidget {
//   final Item catelog;
//   const CatelogItem({super.key, required this.catelog});
//
//   @override
//   Widget build(BuildContext context) {
//     return VxBox(
//       child: Row(
//         children: [
//           Image.network(catelog.image).box.rounded.p8.color(Mytheme.Cremcolor).make().p16().w32(context),
//             Expanded(child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//               catelog.name.text.lg.color(Mytheme.darkBluishcolor).bold.make(),
//               catelog.desc.text.textStyle(context.captionStyle).color(Mytheme.darkBluishcolor).make(),
//                 ButtonBar(
//                   alignment: MainAxisAlignment.spaceBetween,
//                     buttonPadding: EdgeInsets.zero,
//                   children: [
//                     '\$${catelog.price}'.text.color(Mytheme.darkBluishcolor).bold.xl.make(),
//                     ElevatedButton(onPressed: (){},style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Mytheme.darkBluishcolor),shape: MaterialStateProperty.all(StadiumBorder())), child: 'Buy'.text.color(Mytheme.Cremcolor).make())
//                   ],
//                 ).pOnly(right: 8.0)
//             ],))
//         ],
//       ),
//     ).white.roundedLg.square(200).make().py16();
//   }
// }
//
//
import 'package:flutter/material.dart';
import 'package:krncheck/pages/search_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}




class HomePage extends StatelessWidget {
  // GlobalKey for controlling the drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Open drawer when menu icon is clicked
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.scanner),
            onPressed: () {
              // Handle scanner icon tap
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Handle wishlist icon tap
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart icon tap
            },
          ),
        ],
      ),
      drawer: Drawer(
        // Drawer content
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle drawer item 1 tap
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle drawer item 2 tap
              },
            ),
            // Add more list tiles for other drawer items
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: VStack([
          GestureDetector(
            onTap: () {
              // Navigate to search page when container is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.white,
              child: HStack([
                Icon(Icons.search),
                SizedBox(width: 10),
                'Search By Category, products & more...'
                    .text
                    .size(12)
                    .make(),
              ]),
            ),
          ),//serch textbox
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          //   color: Colors.white,
          //   child: HStack([
          //     'Top Categories'.text.size(18).make(),
          //     Spacer(),
          //     TextButton(
          //       onPressed: () {
          //         // Handle view all action
          //       },
          //       child: 'View All'.text.size(16).make(),
          //     ),
          //   ]),
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            // color: Colors.red,
            height: 50,
            child: HStack([
              'Trending Now'.text.size(18).make(),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.purpleAccent, Colors.deepPurple],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle view all action
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'View All',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ]),
          ), //top categoris caitainer
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.white,
            child: HStack([
              // Add your image and name widgets here
              ImageAndNameWidget(image: 'image1.jpg', name: 'Item 1'),
              SizedBox(width: 20.0),
              ImageAndNameWidget(image: 'image2.jpg', name: 'Item 2'),
              SizedBox(width: 20.0),
              ImageAndNameWidget(image: 'image3.jpg', name: 'Item 3'),
              // Add more ImageAndNameWidget as needed
            ]).scrollHorizontal().wFull(context),
          ),//categori to get api now static roundedview name and photos
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.white,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1.0,
              ),
              items: [

                'assets/image1.jpg', // Image path
                'assets/image2.jpg', // Image path
                'assets/image3.jpg', // Image path
              ].map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    // Check if image exists
                    if (item != null && AssetImage(item).assetName != null) {
                      return Image.asset(
                        item,
                        fit: BoxFit.cover,
                      );
                    } else {
                      // Display colored container based on image index
                      Color color;
                      if (item == 'assets/image1.jpg') {
                        color = Colors.red;
                      } else if (item == 'assets/image2.jpg') {
                        color = Colors.pink;
                      } else if (item == 'assets/image3.jpg') {
                        color = Colors.blue;
                      }
                      return Container(
                        color: Colors.black,
                      );
                    }
                  },
                );
              }).toList(),
            ),
          ),//image slider
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            color: Colors.white,
            child: Center(
              child: HStack([
                'All Iconic Collections'.text.size(18).center.make(),
              ]),
            ),
          ),//all iconic collections caitainer
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: HStack(
              [
                ImageAndNameWidgetSquare(
                    image: 'images/photo.jpg', name: 'Item 1'),
                SizedBox(width: 20.0),
                ImageAndNameWidgetSquare(
                    image: 'images/photo.jpg', name: 'Item 2'),
                SizedBox(width: 20.0),
                ImageAndNameWidgetSquare(
                    image: 'image3.jpg', name: 'Item 3'),
                ImageAndNameWidgetSquare(
                    image: 'image3.jpg', name: 'Item 3'),
                ImageAndNameWidgetSquare(
                    image: 'image3.jpg', name: 'Item 3'),
                ImageAndNameWidgetSquare(
                    image: 'image3.jpg', name: 'Item 3'),
                ImageAndNameWidgetSquare(
                    image: 'image3.jpg', name: 'Item 3'),
              ],
            ).scrollHorizontal().wFull(context),
          ),//all iconic collections data
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            color: Colors.white,
            child: HStack([
              'Featured'.text.size(18).bold.make(),
            ]),
          ),//Featured caitainer
          // Inside the SingleChildScrollView, in the body of HomePage widget
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ImageAndNameinsidephoto(image: 'images/photo.jpg', name: 'Customize Jewellery', gradientColors: [Colors.deepPurpleAccent.withOpacity(0.5), Colors.pinkAccent],),
                  SizedBox(width: 20.0),
                  ImageAndNameinsidephoto(image: 'images/photo.jpg', name: 'Top Products', gradientColors: [Colors.deepOrange.withOpacity(0.5), Colors.amber],),
                  SizedBox(width: 20.0),
                  ImageAndNameinsidephoto(image: 'images/photo.jpg', name: 'Find A Store \nNear You', gradientColors: [Colors.deepPurple.withOpacity(0.5), Colors.black],),
                  // Add more ImageAndNameinsidephoto widgets as needed
                ],
              ),
            ),
          ),//custom jewwelry etc caitainer
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            // color: Colors.red,
            height: 50,
            child: HStack([
              'Trending Now'.text.size(18).make(),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.pinkAccent, Colors.deepPurple],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle view all action
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'View All',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ]),
          ),//trending now Coitainer


        ],
        ),
      ),
    );
  }
}


class ImageAndNameWidget extends StatelessWidget {
  final String image;
  final String name;

  const ImageAndNameWidget({
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40.0,
          backgroundImage: AssetImage('assets/$image'),
        ),
        SizedBox(height: 8.0),
        Text(
          name,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
class ImageAndNameWidgetSquare extends StatelessWidget {
  final String image;
  final String name;

  const ImageAndNameWidgetSquare({
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250.0,
          child: Stack(
            children: [
              Container(
                width: 170.0,
                height: 250.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: AssetImage('assets/$image'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: Colors.deepPurpleAccent.withOpacity(0.5), // Background color with opacity
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class ImageAndNameinsidephoto extends StatelessWidget {
  final String image;
  final String name;
  final List<Color> gradientColors; // Add this line

  const ImageAndNameinsidephoto({
    required this.image,
    required this.name,
    required this.gradientColors, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0, // Adjust the width as needed
      height: 200.0, // Adjust the height as needed
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors, // Use the provided gradient colors
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 120.0, // Width of the photo
                height: 120.0, // Height of the photo
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/$image',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0), // Adjust the spacing between the photo and the text
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
