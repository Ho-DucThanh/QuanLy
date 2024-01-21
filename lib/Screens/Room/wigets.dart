import 'package:flutter/material.dart';
import '../../constanst/color.dart';
import '../Components/main_settings.dart';

class IconTitleWidget extends StatelessWidget {
  const IconTitleWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.local_hospital, size: 30, color: Colors.white),
        SizedBox(
          width: 5,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Quản Lý Bệnh Viện",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: kBottomColor,
      selectedFontSize: 12.0,
      unselectedFontSize: 12.0,
      selectedLabelStyle: TextStyle(height: 0.8),
      unselectedLabelStyle: TextStyle(height: 0.8),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: TextButton(
            onPressed: () {
            },
            child: const Column(
              children: [
                Icon(Icons.home, color: Colors.white),
                Text('Home', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: TextButton(
            onPressed: () {
            },
            child: const Column(
              children: [
                Icon(Icons.mail, color: Colors.white),
                Text('Email', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: TextButton(
            onPressed: () {
              final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
              final RelativeRect position = RelativeRect.fromLTRB(
                overlay.size.width - 5, // right
                overlay.size.height - 5, // bottom
                0, // left
                0, // top
              );
              showMenu(
                context: context,
                position: position,
                items: [
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyAppSetting()));
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Profile'),
                      onTap: () {
                        // Handle Profile tap
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              );
            },
            child: const Column(
              children: [
                Icon(Icons.more_horiz_outlined, color: Colors.white),
                Text('More', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          label: '',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      onTap: _onItemTapped,
    );
  }
}




