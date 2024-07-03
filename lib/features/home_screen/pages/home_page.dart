import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget{
  final String? userName;
  const HomePage({super.key,required this.userName});

  @override
  State<StatefulWidget> createState() => HomePageState();

}

class HomePageState extends State<HomePage>{

  @override
  void initState(){
    super.initState();

    pages =  [
      TabOne(userName: widget.userName,),
      Container(
        child: Text('Text 2'),
      ),
      Container(
        child: Text('Text 2'),
      ),
      Container(
        child: Text('Text 3a'),
      )];

  }


  late List<Widget> pages;

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context,value,__){
            print("value : $value");
            return BottomNavigationBar(
              currentIndex: _currentIndex.value,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color.fromRGBO(37, 37, 37, 1),
              onTap: (index){
                _currentIndex.value = index;
                print(index);
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/home/icon1.svg',
                    color: _currentIndex.value == 0 ? Color.fromRGBO(101, 107, 181, 1) : Color.fromRGBO(191, 191, 191, 1),
                  ),
                  label: '',

                ),

                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/home/icon3.svg',
                    color: _currentIndex.value == 1 ? Color.fromRGBO(101, 107, 181, 1) : Color.fromRGBO(191, 191, 191, 1),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/home/icon2.svg',
                    color: _currentIndex.value == 2 ? Color.fromRGBO(101, 107, 181, 1) : Color.fromRGBO(191, 191, 191, 1),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/home/icon4.svg',
                    color: _currentIndex.value == 3 ? Color.fromRGBO(101, 107, 181, 1) : Color.fromRGBO(191, 191, 191, 1),
                  ),
                  label: '',
                ),
              ],
            );
          },
        ),
        body: ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (ctx,value,__){
            return pages[_currentIndex.value];
          },
        )
      ),
    );
  }
}

class TabOne extends StatefulWidget {
  String? userName;
  TabOne({this.userName});
  @override
  State<StatefulWidget> createState() => TabOneState();

}

class TabOneState extends State<TabOne> {

  List<String> items = ["Vaccine","Surgery","SPA & Treatment","Consultation"];

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    // TODO: implement build
    return Container(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height:size.height * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hello, ${widget.userName ?? ''}!',
                  style: TextStyle(
                      fontSize: 24,
                      color:Colors.white,fontFamily: 'Manrope',fontWeight: FontWeight.bold),),
                Container(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/home/shopping_bag.svg',
                        ),
                      ),
                      Positioned(
                        right: 3,
                        top: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(239, 100, 151, 1)
                          ),
                          child: Center(
                            child: Text('5',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                          ),
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
            SizedBox(height:size.height * 0.01),
            Container(
              width: size.width,
              height: size.height * 0.25,
              // color: Colors.white,
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  SvgPicture.asset('assets/home/image1.svg',fit: BoxFit.fitHeight,),
                  Positioned(
                      right: size.width * 0.05,
                      top: size.height * 0.022,
                      child: Image.asset('assets/home/kitten.png',height: size.height * 0.2,)),
                  Positioned(
                    top: size.height * 0.14,
                      left: size.width * 0.08,
                      child: Container(
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('See details',style: TextStyle(fontSize: 12)),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            backgroundColor: Color.fromRGBO(255, 255, 255, 0.4),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      )
                  )
                ],
              )
              ,
            ),
            SizedBox(

              height: 52,
              child: TextField(

                cursorHeight: 25,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset('assets/home/search.svg',),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.all(Radius.circular(12)),

                    ),

                    hintStyle: TextStyle(fontSize: 12,fontFamily: 'Manrope',color: Color.fromRGBO(163, 163, 163, 1)),
                    hintText: 'Find best vaccinate, treatment...'),
              ),
            ),
            SizedBox(height:size.height * 0.03),
            Container(
              height: size.height * 0.06,
              // color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                  itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal:5 ),
                      height: 20,
                      decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Center(child: Text('${items[index]}')),
                      ),
                    );
                  }
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context,index){
                      return Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(37, 37, 37, 1),
                          borderRadius: BorderRadius.circular(14)
                        ),
                        margin: EdgeInsets.all(12),
                        width: size.width,
                        height: 143,
                        child: Row(
                          children: [
                            Image.asset('assets/home/image2.png'),
                            SizedBox(width: size.width * 0.07,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Dr. Stone',style: TextStyle(fontFamily: 'Manrope',color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text('Service: Vaccine, Surgery',style: TextStyle(fontFamily: 'Manrope',color: Color.fromRGBO(164, 164, 164, 1),fontSize: 12,fontWeight: FontWeight.w300)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom:10.0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/home/map-pin.svg'),
                                        SizedBox(width: 2,),
                                        Text('10Km',style: TextStyle(fontFamily: 'Manrope',color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                              
                                      Text('Available for',style: TextStyle(fontFamily: 'Manrope',color: Color.fromRGBO(80, 204, 152, 1),fontSize: 12,fontWeight: FontWeight.bold)),
                                      Row(
                                        children: [
                                          SvgPicture.asset('assets/home/whh_cat.svg'),
                                          SvgPicture.asset('assets/home/whh_dog.svg'),
                                        ],
                                      )

                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }

}