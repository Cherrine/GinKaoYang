import 'package:flutter/material.dart';

class CollapsibleSidebar extends StatelessWidget {
  final bool isCollapsed;
  final VoidCallback onToggle;

  const CollapsibleSidebar({
    Key? key,
    required this.isCollapsed,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isCollapsed ? 60 : 250,
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            leading: IconButton(
              icon: Icon(isCollapsed ? Icons.menu : Icons.menu_open),
              onPressed: onToggle,
            ),
          ),
          const SizedBox(height: 20),
          _buildDrawerItem(context, Icons.calendar_today, 'Calendar', badge: '2'),
          _buildDrawerItem(context, Icons.star, 'Rewards', badge: '3'),
          _buildDrawerItem(context, Icons.location_on, 'Address'),
          _buildDrawerItem(context, Icons.payment, 'Payment Methods'),
          _buildDrawerItem(context, Icons.local_offer, 'Offers', badge: '2'),
          _buildDrawerItem(context, Icons.person_add, 'Refer a Friend'),
          _buildDrawerItem(context, Icons.support_agent, 'Support'),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, {String? badge}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: isCollapsed ? null : Text(title),
      trailing: !isCollapsed && badge != null
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on $title')),
        );
      },
    );
  }
}