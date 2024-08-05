import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ramees/screens/addexpensepage.dart';
import 'package:ramees/util/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {

 File?_photo;

 

  Future<void> getimage({required ImageSource camera}) async {

    
    final ImagePicker picker = ImagePicker();
      final photo = await picker.pickImage(source:camera);

    if(photo!=null){
          setState(() {
           _photo=File(photo.path);
          });   
    }


    

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'asset/images/download 4.png',
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
        
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 220),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage:  _photo != null
                          ? FileImage(_photo!):AssetImage('asset/images/Woman 1.png') as ImageProvider,
                          ),
                    Positioned(
                      
                        bottom: 0,
                        left: 50,
                       
                        child: IconButton(
                          
                            onPressed: () {
                              showModalBottomSheet(context: context, builder: (context) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(onPressed: () async {
                                        Navigator.pop(context);
                                        getimage(camera: ImageSource.gallery);

                                      }, child: Text('Gallery',style: TextStyle(color: kThirdcolor))),
                                      TextButton(onPressed: () async {
                                        Navigator.pop(context);
                                       getimage(camera: ImageSource.camera);
                                        
                                      }, child: Text('Camera',style: TextStyle(color: kThirdcolor),),
                                      ),
                                  
                                    ],
                                  ),
                                );
                              },
                              );
                            },
                            icon: Icon(Icons.camera_alt_rounded,size:30 ,),
                            ),
                            ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Enjelin Morgeana',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '@enjelin_morgeana',
                  style: TextStyle(color: kThirdcolor),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        leading: Image.asset(
                          'asset/images/diamond.png',
                          height: 30,
                        ),
                        title: Container(
                            height: 20,
                            width: 90,
                            child: Text('Invite Friends')),
                        onTap: () {},
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.person_2_sharp),
                        title: Text('Account info'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text('Personal profile'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.mark_email_unread_outlined),
                        title: Text('Message center'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.security),
                        title: Text('Login and security'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Icon(Icons.privacy_tip),
                        title: Text('Data and privacy'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
