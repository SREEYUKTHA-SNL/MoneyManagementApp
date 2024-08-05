import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "WELOCOME",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.amber),
              child: Text('HELLO WORLD')),
          Text('HOUU YYUUUU'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                    height: 50,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amber),
                    child: Column(
                      children: [
                        Text('HOUU YYuu'),
                        Icon(Icons.access_alarm),
                      ],
                    )),
                SizedBox(
                  width: 10,
                ),
                Container(
                    height: 50,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amber),
                    child: Column(
                      children: [
                        Text('HOUU YYUU'),
                        Icon(Icons.access_alarm),
                      ],
                    )),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.amber),
                  child: Column(
                    children: [
                      Text('HOUU YYUU'),
                      Icon(Icons.access_alarm),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius:BorderRadius.circular(10) ),
            child: Center(child: Text('Hello World')),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network('https://cdn.britannica.com/45/5645-050-B9EC0205/head-treasure-flower-disk-flowers-inflorescence-ray.jpg',height: 100,width: 100,),SizedBox(width: 10,),
                Image.network('https://cdn.britannica.com/45/5645-050-B9EC0205/head-treasure-flower-disk-flowers-inflorescence-ray.jpg',height: 100,width: 100,),SizedBox(width: 10,),
              Image.network('https://cdn.britannica.com/45/5645-050-B9EC0205/head-treasure-flower-disk-flowers-inflorescence-ray.jpg',height: 100,width: 100,),
            
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
