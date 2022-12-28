
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:fypadmin/services/firebase_services.dart';
import 'package:fypadmin/widgets/banner_widget.dart';
import 'package:fypadmin/widgets/sidebar.dart';
import 'package:firebase/firebase.dart' as fb;

class ManageBanner extends StatefulWidget {
  const ManageBanner({Key? key}) : super(key: key);
  static const String id = 'manage-banner';

  @override
  State<ManageBanner> createState() => _ManageBannerState();
}

class _ManageBannerState extends State<ManageBanner> {
  //
  bool _isLoading= false;
  String firebaseStorageUrl = 'gs://mobileandweb-344d0.appspot.com';
  Services _services = Services();
  SideBarWidget _sideBar = SideBarWidget();
  bool _visible=false;
  bool _imageSelected = true;
  var _fileNameTextController = TextEditingController();
  late String _url;


  @override
  Widget build(BuildContext context) {


    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        backgroundColor: const Color(0xff944444),
        title: const Text('Grocery App Dashboard', style:TextStyle(color: Colors.white),),
      ),
      sideBar:SideBarWidget.sideBarMenu(context,ManageBanner.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text(
                'Manage Banner',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),

              const Text('Add / Delete Home Screen Banner Images'),

              const Divider(thickness: 5,),

              //banners
              const BannerWidget(),

              const Divider(thickness: 5,),
              Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Visibility(
                        visible: _visible,
                        child: Container(
                          child: Row(
                            children: [
                               AbsorbPointer(
                                absorbing:true,
                                child: SizedBox(width: 300,height: 30,child: TextField(
                                  controller: _fileNameTextController,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:  Colors.black,
                                      ),

                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Uploaded Image',border: OutlineInputBorder(

                                  ),
                                    contentPadding: EdgeInsets.only(left: 20),
                                  ),
                                )),
                              ),
                             MaterialButton(
                                onPressed: (){
                                  uploadStorage();
                                },
                                  color: Colors.black54,
                               child: const Text('Upload Image', style: TextStyle(color: Colors.white),),
                             ),
                              const SizedBox(width:10),
                              AbsorbPointer(
                                absorbing: _imageSelected,
                                child: MaterialButton(
                                  onPressed: (){
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    _services.uploadBannerImageToDb(_url).then((downloadUrl) {
                                      if(downloadUrl != null){
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      }
                                    });
                                  },
                                  color: _imageSelected ? Colors.black12: Colors.black54,
                                  child: const Text('Save Image', style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _visible? false: true,
                        child: MaterialButton(
                        color:Colors.black54
                        ,onPressed: (){
                          setState(() {
                            _visible= true;
                          });
                        },child: const Text('Add New Banner', style: TextStyle(color: Colors.white)),),
                      ),
                      const Visibility(child: CircularProgressIndicator(
                              value: _isLoading,
                      )),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  void uploadImage({required Function(File file) onSelected}){
    FileUploadInputElement uploadInput = FileUploadInputElement()..accept='image/*'; //only images
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final file = uploadInput.files?.first;
      final reader = FileReader();
      reader.readAsDataUrl(file!);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
      });
    });
    //the selected image ..
  }

  void uploadStorage(){
    //this function uploads image to firebase storage
    final dateTime  = DateTime.now();
    final path = 'bannerImage/$dateTime';
    uploadImage(onSelected: (file){
        if(file != null){
         setState(() {
           _fileNameTextController.text = file.name;
           _imageSelected = false;
           _url = path; //url path
         });
         fb.storage().refFromURL(firebaseStorageUrl).child(path).put(file);
        }
    });
  }
}
