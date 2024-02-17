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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10),
                    Text(
                      'Serch By Category,products & more...',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ),
            // Container for top categories and View All button
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Categories',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle view all action
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
            // Row displaying images and names horizontally
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // Add your image and name widgets here
                  ImageAndNameWidget(image: 'image1.jpg', name: 'Item 1'),
                  ImageAndNameWidget(image: 'image2.jpg', name: 'Item 2'),
                  ImageAndNameWidget(image: 'image3.jpg', name: 'Item 3'),
                  // Add more ImageAndNameWidget as needed
                ],
              ),
            ),
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
          radius: 30.0,
          backgroundImage: AssetImage('assets/$image'),
        ),
        SizedBox(height: 8.0),
        Text(name),
      ],
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Center(
        child: Text(
          'Search Page Content',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}