import 'package:flutter/material.dart';
import 'package:pokedex_assessment/generation.dart/generation_1.dart';
import 'package:pokedex_assessment/splashscreen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: SafeArea(
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              const Text(
                'FAVORITE (5)',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 11, left: 11, top: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 11),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0XFFE6FAE8)),
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: [
                          ...dataPokemon
                              .asMap()
                              .keys
                              .map((index) => GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => ()));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    elevation: 0,
                                    color: Colors.white,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 13, bottom: 13),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${dataPokemon[index]['angka']}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                'assets/img/${dataPokemon[index]['gambar']}'),
                                            height: 100,
                                          ),
                                          Text(
                                            "${dataPokemon[index]['nama']}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )))
                        ]),

                    // child: Container(
                    //   child: GridView.builder(
                    //       itemCount: dataPokemon.length,
                    //       gridDelegate:
                    //           SliverGridDelegateWithFixedCrossAxisCount(
                    //               crossAxisCount: 2),
                    //       itemBuilder: ((context, index) {
                    //         return;
                    //       })),
                    // ),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
