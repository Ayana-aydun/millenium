import 'package:latlong2/latlong.dart';

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