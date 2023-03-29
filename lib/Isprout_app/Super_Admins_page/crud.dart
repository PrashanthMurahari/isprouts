import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/center_model.dart';
import 'models/client_model.dart';
import 'models/conferenceRoom_model.dart';
import 'models/location_model.dart';
import 'models/private_offices_model.dart';
import 'models/serviceRequest_model.dart';

class Crud {
  //Center Services
  final CollectionReference _centerCollection =
  FirebaseFirestore.instance.collection("Centers");

  Future<void> addCenter(CenterModel center) {
    return _centerCollection.add(center.toJson());
  }

  Stream<List<CenterModel>> getCenter() {
    return _centerCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => CenterModel.fromSnapshot(doc)).toList());
  }

  //Location Services

  final CollectionReference _locationsCollection =
  FirebaseFirestore.instance.collection('Locations');

  Future<void> addLocation(LocationModel location) {
    return _locationsCollection.add(location.toJson());
  }

  Stream<List<LocationModel>> getLocations() {
    return _locationsCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => LocationModel.fromSnapshot(doc)).toList());
  }

  //Conference Room Services

  final CollectionReference _conferenceRoomCollection =
  FirebaseFirestore.instance.collection("Conference Rooms");

  Future<void> addConference(ConferenceRoomModel room) {
    return _conferenceRoomCollection.add(room.toJson());
  }

  Stream<List<ConferenceRoomModel>> getConferenceRoom() {
    return _conferenceRoomCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => ConferenceRoomModel.fromSnapshot(doc))
        .toList());
  }

  //Private Offices Services
  final CollectionReference _privateOfficeCollection =
  FirebaseFirestore.instance.collection("Private offices");

  Future<void> addPrivateOffice(PrivateOfficeModel pom) {
    return _privateOfficeCollection.add(pom.toJson());
  }

  Stream<List<PrivateOfficeModel>> getPrivateOffice() {
    return _privateOfficeCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => PrivateOfficeModel.fromsnapshot(doc))
        .toList());
  }

  //Client Services
  final CollectionReference _clientCollection =
  FirebaseFirestore.instance.collection("Client Details");

  Future<void> addClient(ClientModel client) {
    return _clientCollection.add(client.toJson());
  }

  Stream<List<ClientModel>> getClient() {
    return _clientCollection.snapshots().map((snap) =>
        snap.docs.map((doc) => ClientModel.fromSnapshot(doc)).toList());
  }

  //Service Request Services

  final CollectionReference _srcollection =
  FirebaseFirestore.instance.collection("Service requests");

  Future<void> addServiceRequest(ServiceRequestModel serviceRequest) {
    return _srcollection.add(serviceRequest.toJson());
  }

  Stream<List<ServiceRequestModel>> getServiceRequest() {
    return _srcollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => ServiceRequestModel.fromSnapshot(doc))
        .toList());
  }
}