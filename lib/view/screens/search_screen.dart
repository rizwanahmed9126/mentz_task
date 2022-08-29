import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:mentz_task/view/widgets/txtField_widget.dart';
import 'package:mentz_task/view_model/providers/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart' as loc;
import '../../model/services/util_service.dart';
import '../../model/utils/service_locator.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _focusNode = FocusNode();
  final _searchTxt=TextEditingController();
  final Location _location =  Location();
  final UtilService _utilsService = locator<UtilService>();



//on address selected
  void _onTap(String value){
    _searchTxt.text=value;
    _focusNode.unfocus();
     Provider.of<SearchProvider>(context,listen: false).clear();


  }


  //take use currentLocation
  void _currentLocation()async{
    LocationData currentLocation = await _location.getLocation();
    List<loc.Placemark>? fromAddress =
    await loc.placemarkFromCoordinates(currentLocation.latitude!,currentLocation.longitude!);
    _searchTxt.text = "${fromAddress[0].street}, ${fromAddress[0].locality}";

  }

  //call api to get suggested places
  void _onchange(String value)async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    await  Provider.of<SearchProvider>(context,listen: false).callAdvert(value);

      if(_searchTxt.text.isEmpty){
        Provider.of<SearchProvider>(context,listen: false).clear();
      }
    } else {
      _utilsService.showToast("Please check your connection");

    }
  }






  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(

      appBar:AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 0.0,
        title:  Transform(
          transform:  Matrix4.translationValues(-30.0.w, 0.0, 0.0),
          child: Text(
            'Start Point',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700),
          ),
        ),

      ),

      body:Container(
        height: height,
        width: width,
        color: Colors.grey,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height*0.1,
              color: Colors.white,

              width: MediaQuery.of(context).size.width,
              child: TxtField(
                cnt: _searchTxt,
                focusNode: _focusNode,
                onChanged: (value){
                  _onchange(value);
                },
              ),

            ),



            Container(
              height: height*0.1,
              width: width,
              color: Colors.white,
              child:   Column(
                children: [
                  ListTile(
                      onTap: (){
                        _currentLocation();
                      },
                      tileColor: Colors.grey[300],
                      leading: const Icon(Icons.location_on),

                      title:const Text("Use Current Location")
                  ),
                  const Divider(height: 1,color: Colors.grey,)

                ],
              ),

            ),




            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height*0.8,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child:
                Consumer<SearchProvider>(builder: (context,i,_){
                  return i.loader?
                  const Center(child: CircularProgressIndicator(color: Colors.grey,),):

                  Scrollbar(
                    child:
                    ListView.builder(
                        itemCount: i.data.length,
                        scrollDirection: Axis.vertical,
                        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                        itemBuilder: (BuildContext context, int index) {

                          return Column(
                            children: [
                              ListTile(
                                onTap: (){
                                  _onTap(i.data[index].name);
                                },
                                  tileColor: Colors.grey[300],
                                  leading: const Icon(Icons.directions_bus_sharp),
                                  subtitle: Text(i.data[index].parent.name),
                                  trailing:  Text(i.data[index].type,
                                    style: const TextStyle(color: Colors.green, fontSize: 15),
                                  ),
                                  title: Text(i.data[index].name)
                              ),
                              const Divider(height: 1,color: Colors.grey,)
                            ],
                          );
                        }
                    ),

                  );
                }),
              ),
            ),


          ],
        ),
      )

    );
  }





}



