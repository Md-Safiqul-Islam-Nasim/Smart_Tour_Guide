import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/booking/carbooking.dart';
import 'package:untitled/User/signuppage.dart';



class CarChoose extends StatefulWidget {
  const CarChoose({Key? key}) : super(key: key);

  @override
  _CarChooseState createState() => _CarChooseState();
}

//                                                                       login                                                    //
class _CarChooseState extends State<CarChoose> {
  // String get image => null;



  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   backgroundColor: Color(0xfff8f4f0),
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       UserAccountsDrawerHeader(
      //         accountName: const Text('Md Safiqul Islam Nasim'),
      //         accountEmail: const Text('mdsafiqulislamnasim1234@gmail.com'),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           image:DecorationImage(
      //             fit: BoxFit.cover,
      //             image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text('Home'),
      //         onTap: (){},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.share),
      //         title: Text('Share'),
      //         onTap: (){},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text('Settings'),
      //         onTap: (){},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.logout),
      //         title: Text('LogOut'),
      //         onTap: (){},
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Choose Your Car',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            )),
        /*actions: [
          CircleAvatar(
            radius: 17,
            backgroundColor: Color(0xff5bc0de),
            child: Icon(Icons.search, size: 24, color: Colors.black,),
          ),
        ],*/
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 230,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('image/vehicle_moving_animation.gif'),
                      //'https://hips.hearstapps.com/hmg-prod/images/choose-your-car-royalty-free-image-1584562569.jpg'),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 100),
                              //padding: const EdgeInsets.only(right: 40 ),
                              child: Text(
                                '',
                                style: TextStyle(
                                    fontSize: 25,
                                    color : Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: 0,),
                Center(
                  heightFactor: 1.3,
                  child: Material(
                    color: Colors.lightBlueAccent,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> CarBooking()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                              image: NetworkImage('https://media.dealervenom.com/jellies/Toyota/Corolla/C430755_2PS_Front.png?auto=compress%2Cformat&w=640&h=480&fit=clamp' ,),
                           //image: AssetImage('image/4seater.png'),
                            height: 110,
                            width: 175,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 6,),
                          Text(
                            'Sedan(4 Seater)',
                            style: TextStyle(fontSize: 16 , color: Colors.black , fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Center(
                  child: Material(
                    color: Colors.lightBlueAccent,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(21),
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> CarBooking()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: AssetImage('image/6seater.png'),
                            height: 110,
                            width: 175,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 6,),
                          Text(
                            'SUV(6-8 Seater)',
                            style: TextStyle(fontSize: 16 , color: Colors.black , fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),

              ],
            ),
            Row(
              children: [
                SizedBox(height: 10,),
                Center(
                  child: Material(
                    color: Colors.lightBlueAccent,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(21),
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> CarBooking()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: AssetImage('image/12seater.png'),
                            height: 110,
                            width: 175,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 6,),
                          Text(
                            'Hiace(12 Seater)',
                            style: TextStyle(fontSize: 16 , color: Colors.black , fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Center(
                  child: Material(
                    color: Colors.lightBlueAccent,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(21),
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> CarBooking()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            //image: NetworkImage('https://p7.hiclipart.com/preview/229/691/650/5bbbf6bc06ddc.jpg'),
                            //image: NetworkImage('https://w7.pngwing.com/pngs/930/321/png-transparent-toyota-hiace-jinbei-car-jac-motors-van-car-compact-car-van-car.png'),
                            image: AssetImage('image/16seater.png'),
                            height: 110,
                            width: 175,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 6,),
                          Text(
                            'Hiace(16 Seater)',
                            style: TextStyle(fontSize: 16 , color: Colors.black , fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 0,),
                Center(
                  heightFactor: 1.3,
                  child: Material(
                    color: Colors.lightBlueAccent,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> CarBooking()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            //image: NetworkImage('https://clipground.com/images/minibus-png-10.png',),
                            image: AssetImage('image/minibus1.png'),
                            //image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0AfpsdLZHvUFe3eWJFIKblTTGpZwYGa2bTeSsu6sAcumWAp1bg6qnYy9RYqy_I1k5Kuk&usqp=CAU',),
                            //image: NetworkImage('https://www.pikpng.com/pngl/m/53-536405_bus-png-image-transparent-toyota-coaster-bus-png.png',),
                            height: 110,
                            width: 175,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 6,),
                          Text(
                            'MiniBus(25 Seater)',
                            style: TextStyle(fontSize: 16 , color: Colors.black , fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Center(
                  child: Material(
                    color: Colors.lightBlueAccent,
                    elevation: 8,
                    borderRadius: BorderRadius.circular(21),
                    clipBehavior: Clip.antiAliasWithSaveLayer,

                    child: InkWell(
                      splashColor: Colors.black,
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> CarBooking()));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: AssetImage('image/bus.png'),
                            height: 110,
                            width: 175,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 6,),
                          Text(
                            'Bus (44 Seater)',
                            style: TextStyle(fontSize: 16 , color: Colors.black , fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    ),
                  ),
                ),
                //SizedBox(height: 5,),

              ],
            )
          ],
        ),
      ),
    );
  }
}
