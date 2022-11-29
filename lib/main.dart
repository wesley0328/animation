import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;
  var _alignment = Alignment.bottomCenter;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment:CrossAxisAlignment.center,
        // children: <Widget>[
        //   AnimatedAlign(
        //
        //     duration: const Duration(milliseconds: 500),
        //
        //     alignment: selected ? Alignment.topCenter : Alignment.center,
        //     child:Icon(
        //       Icons.flight,
        //       size: 50,
        //       color: Colors.blue,
        //     ),
        //     onEnd: (){
        //       _alignment = Alignment.topRight;
        //       print("object");
        //     },
        //   ),
        //   ElevatedButton(
        //     child: const Text('Increment'),
        //     onPressed: () {
        //       setState(() {
        //         _count += 1;
        //         selected = !selected;
        //       });
        //     },
        //   ),
        //],
        children: [
          Container(
            width: 250.0,
            height: 500.0,
            color: Colors.white,
            child: AnimatedAlign(
              //alignment: selected ? Alignment.topCenter : Alignment.bottomCenter,
              alignment:_alignment,
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn,
              child: Icon(Icons.flight, size: 50, color: Colors.blue,),
              widthFactor: 2.0,
              heightFactor: 2.0,
              onEnd: () {
                setState(() {
                  // selected = !selected;
                  _alignment=Alignment.bottomCenter;
                });

              },
            ),
          ),
          // ElevatedButton(
          //     child: Text('改变alignment参数'),
          //     onPressed: () {
          //       setState(() {
          //         selected = !selected;
          //       });
          //     },),
          ElevatedButton.icon(
            onPressed: (){
              setState(() {
                selected = !selected;
                _alignment=Alignment.topCenter;
              });
            },
            icon: Icon(Icons.flight),  //icon data for elevated button
            label: const Text("起飛"),
            style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20,),
               // fontWeight: FontWeight.bold//粗體加上面
               //  foregroundColor: Colors.white,
               //  backgroundColor:  Colors.blue,
               //  primary: Colors.blueAccent //elevated btton background color
            ),//label text
          ),
        ],
      ),
    );
  }



}