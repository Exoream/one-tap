import 'package:ecommerce/routes/routes_named.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Al Hilaluddin"),
            currentAccountPicture:
                CircleAvatar(backgroundImage: AssetImage("assets/img/3.webp")),
            accountEmail: Text("shiigetsu1@gmail.com"),
          ),
          DrawerListTile(
            iconData: Icons.account_circle,
            title: "My Account",
            onTilePressed: () {
              Get.toNamed(RoutesNamed.account);
            },
          ),
          const CustomDivider(),
          DrawerListTile(
            iconData: Icons.favorite,
            title: "Wishlist",
            onTilePressed: () {
              Get.toNamed(RoutesNamed.wishlist);
            },
          ),
          const CustomDivider(),
          DrawerListTile(
            iconData: Icons.library_books,
            title: "Transaction List",
            onTilePressed: () {},
          ),
          const CustomDivider(),
          DrawerListTile(
            iconData: Icons.store,
            title: "Following Stores",
            onTilePressed: () {},
          ),
          const CustomDivider(),
          DrawerListTile(
            iconData: Icons.credit_card,
            title: "Payment Methods",
            onTilePressed: () {},
          ),
          const CustomDivider(),
          DrawerListTile(
            iconData: Icons.local_shipping,
            title: "Shipping",
            onTilePressed: () {},
          ),
          const CustomDivider(),
          DrawerListTile(
            iconData: Icons.star,
            title: "Review",
            onTilePressed: () {},
          ),
          const CustomDivider(),
          DrawerListTile(
            iconData: Icons.help,
            title: "Help & Support",
            onTilePressed: () {},
          ),
          const CustomDivider(),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile({Key? key, this.iconData, this.title, this.onTilePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(
        iconData,
        color: Colors.blue,
      ),
      title: Text(
        title!,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.blue,
      thickness: 0.7,
      indent: 16,
      endIndent: 16,
    );
  }
}
