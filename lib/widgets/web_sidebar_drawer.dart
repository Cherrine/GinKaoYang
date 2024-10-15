import 'package:flutter/material.dart';

class WebSidebarDrawer extends StatelessWidget {
  const WebSidebarDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildDrawerItem(Icons.calendar_today, 'Calendar', badge: '2'),
          _buildDrawerItem(Icons.star, 'Rewards', badge: '3'),
          _buildDrawerItem(Icons.location_on, 'Address'),
          _buildDrawerItem(Icons.payment, 'Payment Methods'),
          _buildDrawerItem(Icons.local_offer, 'Offers', badge: '2'),
          _buildDrawerItem(Icons.person_add, 'Refer a Friend'),
          _buildDrawerItem(Icons.support_agent, 'Support'),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, {String? badge}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(title),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          : null,
      onTap: () {
        // Handle navigation
      },
    );
  }
}