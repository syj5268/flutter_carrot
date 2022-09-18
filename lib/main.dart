import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ListData {
  final String image;
  final String title;
  final String location;
  final int price;
  final int likes;

  ListData(this.image, this.title, this.location, this.price, this.likes);
}

class DemoListTile extends StatelessWidget {
  DemoListTile(this._data);

  final ListData _data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading : Image.asset(_data.image),
      title : Text(_data.title),
      subtitle: Text(_data.location),
      trailing: Icon(Icons.favorite_border_outlined)
    );
  }
}

class MyApp extends StatelessWidget {  
  /* const MyApp({super.key}); */

  final List<ListData> datas= [
      ListData("assets/images/image1.png","jBL 사운드바","역삼동 * 끌올 1분 전",145000,0),
      ListData("assets/images/image2.png","샤넬 캐비어 블랙 클래식 폰홀더","강남구 논현동 * 57초 전",15000,3),
      ListData("assets/images/image3.png","(삼성역)에어팟 3세대 미개봉 제품 삽니다","삼성동 * 끌올 2분 전",1800000,20),
      ListData("assets/images/image4.png","자라블라우스66사이즈","역삼2동 * 끌올 50초 전",2980000,6),
      ListData("assets/images/image5.png","버거스올마이티 강남역점입니다","역삼동 * 지역광고",0,1),
    ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(40.0),
          child : AppBar(
            title: Row(
              children: [
                Text('방배본동', style: TextStyle(color: Colors.black),),
                Icon(Icons.arrow_drop_down, color: Colors.black,),
              ],
            ),
            backgroundColor: Colors.white,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.black,)),
              IconButton(onPressed: () {}, icon: Icon(Icons.menu, color: Colors.black)),
              IconButton(onPressed: () {}, icon: Icon(Icons.alarm_on, color: Colors.black)),
            ],
          )
        ),
        
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index){
            return DemoListTile(datas[index]);
          }, 
          separatorBuilder: (BuildContext context, int index) => const Divider(),
            //  return Container(height:1, color: Colors.black.withOpacity(0.4));
          itemCount: 5,
        ),
        
        
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'), 
            BottomNavigationBarItem(icon: Icon(Icons.file_copy_outlined), label: '동네생활'), 
            BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: '내 근처'), 
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_rounded), label: '채팅'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '나의 당근')]
        ), 
      ),
    );
      
  }
  
/*  List<Widget> LoadMemo() {
    List<Widget> memoList = [];
    memoList.add(Container(color: Colors.black, height:100));
    memoList.add(Container(color: Colors.red, height:100));
    return memoList;
  } */
}
