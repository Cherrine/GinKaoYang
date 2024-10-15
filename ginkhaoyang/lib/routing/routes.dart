const rootRoute = "/";

const homePageDisplayName = "Home";
const homePageRoute = "/home";

const orderHistoryPageDisplayName = "Order History";
const orderHistoryPageRoute = "/orderHistory";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}



List<MenuItem> sideMenuItemRoutes = [
 MenuItem(homePageDisplayName, homePageRoute),
 MenuItem(orderHistoryPageDisplayName, orderHistoryPageRoute),
 MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];