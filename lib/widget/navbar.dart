import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: widget.currentIndex == 0 ? Colors.blue[50] : const Color.fromARGB(255, 68, 130, 70),size:38,
            ),
            onPressed: () => widget.onTap(0),
          ),
          IconButton(
            icon: Icon(Icons.history_edu_outlined, color: widget.currentIndex == 1? Colors.blue : Colors.green ,size:38 ,),
            onPressed: () => widget.onTap(1),
          ),
          IconButton(
             icon: Icon(Icons.arrow_outward_sharp, color: widget.currentIndex == 2? Colors.blue[50] : const Color.fromARGB(255, 59, 134, 61) ,size:38,),
            onPressed: () => widget.onTap(2),
          ),

        ],
      ),
    );
  }
}