import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:mie_ride/controller/city_controller.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_field.dart';

class AddCity extends StatefulWidget {
  const AddCity({Key? key}) : super(key: key);

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  CityController controller = Get.put(CityController());
  TextEditingController cityCtr = TextEditingController();


  @override
  void initState() {
    controller.adminCityFetch();
    super.initState();
  }

  double? latitude;
  double? long;

  String googleAPiKey = "AIzaSyCUuPa5wAQ5ChQ3UUgq48yS8rafI6iJRSc";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)
            )
        ),
        backgroundColor: MyColors.gradiant,
        title: Text("View City"),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoadings.value) {
            return Center(
              child: myIndicator(),
            );
          } else if (controller.CityList.length == 0) {
            return Center(
              child: Text("No City Added"),
            );
          } else {
            return ListView.builder(
              itemCount: controller.CityList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                var reverseList = controller.CityList.reversed.toList();
                var list = reverseList[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          color: MyColors.listGradiant,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "City Name",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: Get.width/3,
                                  child: Text(list.cityName,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: MyColors.secondry,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          height: 30,
                          color: MyColors.listGradiant,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Status",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: MyColors.secondry,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(list.status,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: MyColors.secondry,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: custom_button(
          voidCallback: () {
            _showTextInputDialog(context);
           /* Get.toNamed(RouteHelper.getAddCityFieldScreenRoute());*/
          },
          text: 'Add City',
        ),
      ),
    );
  }

  Future<String?> _showTextInputDialog(
      BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){
                      cityCtr.text = "";
                      controller.location.value = "";
                      Get.back();
                    },
                      child: Icon(Icons.clear)),
                ),
                Image.asset('assets/images/cityImage.png'),
                SizedBox(
                  height: 10,
                ),
                Text("Enter City Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)
              ],
            ),
            content: Obx((){
              cityCtr.text = controller.location.value;
              return Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black
                    )
                ),
                child: TextFormField(
                  controller: cityCtr,
                  keyboardType: TextInputType.text,
                  onTap: () async {
                    var place = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: googleAPiKey,
                        mode: Mode.overlay,
                        types: [],
                        strictbounds: false,
                        components: [],
                        onError: (err) {
                          print(err);
                        });
                    if (place != null) {
                      controller.location.value = place.description.toString();
                      print("location-------------" + controller.location.value);
                      setState(() {

                      });
                      final plist = GoogleMapsPlaces(
                        apiKey: googleAPiKey,
                      );
                      String placeId = place.placeId ?? "0";
                      final detail = await plist.getDetailsByPlaceId(placeId);
                      final geometry = detail.result.geometry!;
                      latitude = geometry.location.lat;
                      long = geometry.location.lng;
                      print("lat----->:-$latitude");
                      print("lat----->:-$long");
                    }
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Select Your Location",
                      prefixIcon: Icon(
                        Icons.search,
                        color: MyColors.hintColor,
                      ),
                      hintStyle: const TextStyle(
                          color: Colors.grey, fontSize: 12)),
                ),
              );
            }),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Obx(
                        () => custom_button(
                            loading: controller.isLoading.value,
                        voidCallback: () {
                          controller.adminAddCity(context, cityCtr.text,latitude.toString(),long.toString());
                       cityCtr.text = "";
                       controller.location.value = "";
                        },
                        text: "Submit"),
                  ))
            ],
          );
        });
  }
 /* Future<void> getLatLong() async {
    List<Location> locations =
    await locationFromAddress(cityCtr.text.toString());

    controller.longitude.value = locations.last.longitude.toString();
    controller.latitude.value = locations.last.latitude.toString();
    print('input address longitude---->${controller.longitude.value}');
    print('input address latitude---->${controller.latitude.value}');
    controller.adminAddCity(context, cityCtr.text);
  }*/

}
