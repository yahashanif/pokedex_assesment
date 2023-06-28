import 'package:flutter/material.dart';
import 'package:pokedex_assessment/favorite_screen.dart';
import 'package:pokedex_assessment/homes_screen.dart';
import 'package:pokedex_assessment/splashscreen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectednavBar = 0;
  void _changedSelectedNavBar(int index) {
    setState(() {
      _selectednavBar = index;
    });
  }

  final _widgetOptions = [const HomeScreen(), const FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const AssetImage(
            'assets/img/pokemon-party.png',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        )),
        child: Column(
          children: [
            Expanded(child: _widgetOptions[_selectednavBar]),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 147,
                    height: 50,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50)),
                      color: _selectednavBar == 0
                          ? const Color(0xff62C29D)
                          : Colors.transparent,
                      height: 40,
                      onPressed: () {
                        // Navigator.pop(context);
                        setState(() {
                          _selectednavBar = 0;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage(
                              'assets/img/icon-detail.png',
                            ),
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'EXPLORE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 147,
                    height: 50,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: _selectednavBar == 1
                          ? const Color(0xff62C29D)
                          : Colors.transparent,
                      height: 40,
                      onPressed: () {
                        setState(() {
                          _selectednavBar = 1;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            image: AssetImage(
                              'assets/img/icon-fav.png',
                            ),
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'FAVORITE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     selectedItemColor: Color(0xff62C29D),
      //     unselectedItemColor: Colors.transparent,
      //     type: BottomNavigationBarType.fixed,
      //     onTap: _changedSelectedNavBar,
      //     currentIndex: _selectednavBar,
      //     items: [

      //       BottomNavigationBarItem(
      //         label: '',
      // icon:
      //       )
      //     ]),
    );
  }
}
