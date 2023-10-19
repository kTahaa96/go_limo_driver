import 'package:flutter/material.dart';
import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: GoogleMap(
        zoomControlsEnabled: true,
        initialCameraPosition: CameraPosition(target: LatLng(29.9602, 31.2569), zoom: 13.0),
        onCameraMove: (c) {},
        onCameraIdle: () {},
        onMapCreated: (GoogleMapController controller) {
          setMapStyle(controller);
        },
      ),
    );
  }

  void setMapStyle(GoogleMapController controller) async {
    String mapStyle = await DefaultAssetBundle.of(NamedNavigatorImpl.navigatorState.currentContext!)
        .loadString('assets/map_style/map_style.json');
    controller.setMapStyle(mapStyle);
  }
}
