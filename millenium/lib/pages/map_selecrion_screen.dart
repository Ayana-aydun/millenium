import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:millenium/theme/colors.dart';

class PharmacyLocation {
  final String address;
  final String district;
  final String phone;
  final String workingHours;
  final LatLng coordinates;

  PharmacyLocation({
    required this.address,
    required this.district,
    required this.phone,
    required this.workingHours,
    required this.coordinates,
  });
}

class MapSelectionScreen extends StatefulWidget {
  const MapSelectionScreen({Key? key}) : super(key: key);

  @override
  State<MapSelectionScreen> createState() => _MapSelectionScreenState();
}

class _MapSelectionScreenState extends State<MapSelectionScreen> {
  final MapController mapController = MapController();
  
  bool showList = false;
  PharmacyLocation? selectedPharmacy;

  final List<PharmacyLocation> pharmacies = [
    PharmacyLocation(
      address: 'ул. Братьев Жубановых',
      district: 'мк-вс: 10:00-23:00',
      phone: '8 (7132) 54 41 51',
      workingHours: 'пн-вс: 10:00-23:00',
      coordinates: LatLng(43.240, 76.890),
    ),
    PharmacyLocation(
      address: 'проспект Абулхаир хана 2-1В',
      district: 'пн-вс: 10:00-22:00',
      phone: '8 (7132) 54 41 52',
      workingHours: 'пн-вс: 10:00-22:00',
      coordinates: LatLng(43.235, 76.888),
    ),
    PharmacyLocation(
      address: 'ул. Есет Батыра 107',
      district: 'пн-вс: 10:00-22:00',
      phone: '8 (7132) 54 41 53',
      workingHours: 'пн-вс: 10:00-22:00',
      coordinates: LatLng(43.242, 76.895),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Самовывоз',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Карта
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: LatLng(43.238949, 76.889709),
              initialZoom: 13.0,
              onTap: (_, __) {
                if (selectedPharmacy != null) {
                  setState(() {
                    selectedPharmacy = null;
                  });
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.millenium',
              ),
              MarkerLayer(
                markers: pharmacies.map((pharmacy) {
                  bool isSelected = selectedPharmacy == pharmacy;
                  return Marker(
                    point: pharmacy.coordinates,
                    width: 40,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPharmacy = pharmacy;
                          showList = false;
                        });
                        mapController.move(pharmacy.coordinates, 15.0);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF3B30),
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(color: Colors.white, width: 3)
                              : null,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),

          // СОСТОЯНИЕ 1:
          if (!showList && selectedPharmacy == null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 114,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showList = true;
                            });
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 52,
                            width: 358,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: AppColors.bgColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Показать пункты самовывоза',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

          // СОСТОЯНИЕ 2:
          if (showList && selectedPharmacy == null)
            DraggableScrollableSheet(
              initialChildSize: 0.45,
              minChildSize: 0.25,
              maxChildSize: 0.75,
              builder: (context, scrollController) {
                return Container(
                  height: 334,
                  decoration: const BoxDecoration(
                    color: AppColors.bgColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Выберите на карте аптеку для оформления заказа',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showList = false;
                                });
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 358,
                          height: 216,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListView.builder( 
                          controller: scrollController,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: pharmacies.length,
                          itemBuilder: (context, index) {
                            final pharmacy = pharmacies[index];
                            return _buildAddressListItem(pharmacy);
                          },
                        ),

                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            ),

          // СОСТОЯНИЕ 3:
          if (selectedPharmacy != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Выберите на карте аптеку для оформления заказа',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedPharmacy = null;
                                  });
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 88,
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8,),
                                Text(
                                  selectedPharmacy!.address,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  selectedPharmacy!.workingHours,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, selectedPharmacy);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Заберу отсюда',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAddressListItem(PharmacyLocation pharmacy) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            selectedPharmacy = pharmacy;
            showList = false;
          });
          mapController.move(pharmacy.coordinates, 15.0);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 16,right: 16,left: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pharmacy.address,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      pharmacy.district,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey[400],size: 36,),
            ],
          ),
        ),
      ),
    );
  }
}