import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ListData { //입력할 데이터
  final String image;
  final String title;
  final String location;
  final String price;
  final String likes;

  ListData(this.image, this.title, this.location, this.price, this.likes);
}

class DemoListView extends StatelessWidget { //body에 들어갈 모양 함수 만들기
  DemoListView(this._data);

  final ListData _data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child : Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)), //이미지 모서리 둥글게
            child: Image.asset(_data.image, width: 100, height: 100),
          ),
          Expanded( //제대로된 정렬을 위해 사용 -> 배경 색 칠해보면 알 수 있음
            child: Container(
              height: 100, //expanded 사용하기 위해 사이즈 설정해주어야함
              padding: const EdgeInsets.only(left: 20), //사진과 글씨 간격 띄우기
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, //왼쪽 정렬
                children: [
                  Text(
                    _data.title, 
                    style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis //제목 길 때 ...으로 표시되도록
                  ),
                  SizedBox(height: 5),
                  Text(
                    _data.location,
                    style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(.3))
                  ),
                  SizedBox(height: 5),
                  Text(
                    _data.price,
                    style: TextStyle(fontWeight: FontWeight.w500)
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.favorite_border_outlined, color: Colors.black.withOpacity(0.3)),
                          SizedBox(width: 5), //간격 띄우기
                          Text(_data.likes, style: TextStyle(color: Colors.black.withOpacity(0.3))),
                        ],
                  ),
                ),),
              ],)
            ),
          )
        ],)
    );
  }
} 

class MyApp extends StatelessWidget {  
  /* const MyApp({super.key}); */

  final List<ListData> datas= [
      ListData("assets/images/image1.png","jBL 사운드바","역삼동 * 끌올 1분 전","145000원","0"),
      ListData("assets/images/image2.png","샤넬 캐비어 블랙 클래식 폰홀더","강남구 논현동 * 57초 전","15000원","3"),
      ListData("assets/images/image3.png","(삼성역)에어팟 3세대 미개봉 제품 삽니다","삼성동 * 끌올 2분 전","1800000원","20"),
      ListData("assets/images/image4.png","자라블라우스66사이즈","역삼2동 * 끌올 50초 전","2980000원","6"),
      ListData("assets/images/image5.png","버거스올마이티 강남역점입니다","역삼동 * 지역광고","0원","1"),
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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (BuildContext context, int index){
            return DemoListView(datas[index]);
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
  
}
