import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imgurl = 'https://scontent.fraj7-1.fna.fbcdn.net/v/t39.30808-6/295453780_356464743359041_2685840561159519399_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=AO81PRtxRWsAX85hX_0&_nc_oc=AQke09Ye5g8TLwDIF-cGGnFgna4rSD0_BrOWsdx0hDQGGxZPiq7vU-8RiDal2_jKyxs&_nc_ht=scontent.fraj7-1.fna&oh=00_AfAt-3dA7YQ0o39ca0MmG0xAmKzLT_V9QHBOIE_ubELVtA&oe=65CC9AD0';
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding:EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(

                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    // color: Colors.red
                  ),
                  accountName: Text('krn'),
                  accountEmail: Text('pithadiyakrn@gmail.com'),
                  currentAccountPicture: CircleAvatar(

                    backgroundImage: NetworkImage(imgurl),
                  ),
            )
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
              title: Text('Home',
                textScaleFactor:1.2,
                style: TextStyle(color: Colors.white),),
            ),ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
              title: Text('Profile',
                textScaleFactor:1.2,
                style: TextStyle(color: Colors.white),),
            ),ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
              title: Text('Email Me',
                textScaleFactor:1.2,
                style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
