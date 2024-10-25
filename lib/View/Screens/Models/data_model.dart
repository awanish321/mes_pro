/*
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel{
  final String pcbID;
  final String laserSerialNumber;
  final Timestamp timestampLaserMarking;
  final Timestamp solderPasteStartTime;
  final Timestamp solderPasteEndTime;
  final Timestamp solderPasteInspectionTimestamp;
  final Bool solderPasteInspectionOkOrFaulty;
  final String attendantPersonIDInSMT1;
  final Timestamp smdPickAndPlaceStartTime;
  final Timestamp smdPickAndPlaceCompleteTime;
  final Timestamp solderPasteReflowStartTime;
  final Timestamp solderPasteReflowCompleteTime;
  final Timestamp twoDAoiTimestamp;
  final Bool twoDAoiOkOrFaulty;
  final Timestamp pcbUnloadTimestamp;
  final String attendentPersonIDInSMT2;
  final String pcbaLoadStamp;
  final Timestamp radialComponentStartTime;
  final Timestamp radialComponentEndTime;
  final Timestamp ofmInsertionStartTime;
  final Timestamp ofmInsertionEndTime;
  final Timestamp spPartsInsertionStartTime;
  final Timestamp spPartsInsertionEndTime;
  final Timestamp waveSolderStartTime;
  final Timestamp waveSolderEndTime;
  final String attendentIDInTHT1;
  final Timestamp pcbaCleaningStartTime;
  final Timestamp pcbaCleaningEndTime;
  final Timestamp threeDAoiTimestamp;
  final Bool threeDAoiOkOrFaulty;
  final Timestamp inCircuitTestingStartTime;
  final Timestamp inCircuitTestingEndTime;
  final Bool inCircuitTestingOkOrFaulty;
  final Timestamp coatingStartTime;
  final Timestamp coatingEndTime;
  final Timestamp dPanelStartTime;
  final Timestamp dPanleEndTime;
  final String attendentIDInTHT2;
  final String pcbStoreLocationID;

  const DataModel({
    required this.pcbID,
    required this.pcbaLoadStamp,
    required this.laserSerialNumber,
    required this.attendentIDInTHT1,
    required this.attendentIDInTHT2,
    required this.attendantPersonIDInSMT1,
    required this.attendentPersonIDInSMT2,
    required this.coatingEndTime,
    required this.coatingStartTime,
    required this.dPanelStartTime,
    required this.dPanleEndTime,
    required this.inCircuitTestingEndTime,
    required this.inCircuitTestingOkOrFaulty,
    required this.inCircuitTestingStartTime,
    required this.ofmInsertionEndTime,
    required this.ofmInsertionStartTime,
    required this.pcbaCleaningEndTime,
    required this.pcbaCleaningStartTime,
    required this.pcbStoreLocationID,
    required this.pcbUnloadTimestamp,
    required this.radialComponentEndTime,
    required this.radialComponentStartTime,
    required this.smdPickAndPlaceCompleteTime,
    required this.smdPickAndPlaceStartTime,
    required this.solderPasteEndTime,
    required this.solderPasteInspectionOkOrFaulty,
    required this.solderPasteInspectionTimestamp,
    required this.solderPasteReflowCompleteTime,
    required this.solderPasteReflowStartTime,
    required this.solderPasteStartTime,
    required this.spPartsInsertionEndTime,
    required this.spPartsInsertionStartTime,
    required this.threeDAoiOkOrFaulty,
    required this.threeDAoiTimestamp,
    required this.timestampLaserMarking,
    required this.twoDAoiOkOrFaulty,
    required this.twoDAoiTimestamp,
    required this.waveSolderEndTime,
    required this.waveSolderStartTime,
});

  Map<String, dynamic> toMap(){
    return{
      'PCB ID' : pcbID,
      'Laser Serial Number' : laserSerialNumber,
      'Time Stamp Laser Marking' : timestampLaserMarking,
      'Solder Paste Start Time' : solderPasteStartTime,
      'Solder Paste End Time' : solderPasteEndTime,
      'Solder Paste Inspection Time Stamp' : solderPasteInspectionTimestamp,
      'Solder Paste Inspection Ok Or Faulty' : solderPasteInspectionOkOrFaulty,
      'Attendant Person ID In SMT1' : attendantPersonIDInSMT1,
      'SMD Pick And Place Start Time' : smdPickAndPlaceStartTime,
      'SMD Pick And Place Complete Time' : smdPickAndPlaceCompleteTime,
      'Solder Paste Reflow Start Time' : solderPasteReflowStartTime,
      'Solder Paste Reflow Complete Time' : solderPasteReflowCompleteTime,
      'TwoD AOI Time Stamp' : twoDAoiTimestamp,
      'TwoD AOI Ok Or Faulty' : twoDAoiOkOrFaulty,
      'PCB Unload Time Stamp' : pcbUnloadTimestamp,
      'Attendant Person ID In SMT2': attendentPersonIDInSMT2,
      'PCBA Load Stamp' : pcbaLoadStamp,
      'Radial Component Start Time' : radialComponentStartTime,
      'Radial Component End Time' : radialComponentEndTime,
      'OFM Insertion Start Time' : ofmInsertionStartTime,
      'OFM Insertion End Time' : ofmInsertionEndTime,
      'SP Parts Insertion Start Time' : spPartsInsertionStartTime,
      'SP Parts Insertion End Time' : spPartsInsertionEndTime,
      'Wave Solder Start Time' : waveSolderStartTime,
      'Wave Solder End Time' : waveSolderEndTime,
      'Attendant ID In THT1' : attendentIDInTHT1,
      'PCBA Cleaning Start Time' : pcbaCleaningStartTime,
      'PCBA Cleaning End Time' : pcbaCleaningEndTime,
      'ThreeD AOI Time Stamp' : threeDAoiTimestamp,
      'ThreeD AOI Ok Or Faulty' : threeDAoiOkOrFaulty,
      'In Circuit Testing Start Time' : inCircuitTestingStartTime,
      'In Circuit Testing End Time' : inCircuitTestingEndTime,
      'In Circuit Testing Ok Or Faulty' : inCircuitTestingOkOrFaulty,
      'Coating Start Time' : coatingStartTime,
      'Coating End Time' : coatingEndTime,
      'DPanel Start Time' : dPanelStartTime,
      'DPanel End Time' : dPanleEndTime,
      'Attendant ID In THT2' : attendentIDInTHT2,
      'PCB Store Location ID' : pcbStoreLocationID
    };
  }


  factory DataModel.fromFirestore(DocumentSnapshot doc){
    Map data = doc.data() as Map<String, dynamic>;
    return DataModel(
      pcbID: data['PCB ID'] ?? '',
      laserSerialNumber: data['Laser Serial Number'] ?? '',
      pcbaLoadStamp: data['PCBA Load Stamp'] ?? Timestamp.now(),
      attendantPersonIDInSMT1: data['Attendant Person ID In SMT1'] ?? '',
      attendentIDInTHT1: data['Attendant ID In THT1'] ?? '',
      attendentIDInTHT2: data['Attendant ID In THT2'] ?? '',
      attendentPersonIDInSMT2: data['Attendant Person ID In SMT2'] ?? '',
      coatingEndTime: data['Coating End Time'] ?? Timestamp.now(),
      coatingStartTime: data['Coating Start Time'] ?? Timestamp.now(),
      dPanelStartTime: data['DPanel Start Time'] ?? Timestamp.now(),
      dPanleEndTime: data['DPanel End Time'] ?? Timestamp.now(),
      inCircuitTestingEndTime: data['In Circuit Testing End Time'] ?? Timestamp.now(),
      inCircuitTestingOkOrFaulty: data['In Circuit Testing Ok Or Faulty'] ?? '',
      inCircuitTestingStartTime: data['In Circuit Testing Start Time'] ?? Timestamp.now(),
      ofmInsertionEndTime: data['OFM Insertion End Time'] ?? Timestamp.now(),
      ofmInsertionStartTime: data['OFM Insertion Start Time'] ?? Timestamp.now(),
      pcbaCleaningEndTime: data['PCBA Cleaning End Time'] ?? Timestamp.now(),
      pcbaCleaningStartTime: data['PCBA Cleaning Start Time'] ?? Timestamp.now(),
      pcbStoreLocationID: data['PCB Store Location ID'] ?? '',
      pcbUnloadTimestamp: data['PCB Unload Time Stamp'] ?? Timestamp.now(),
      radialComponentEndTime: data['Radial Component End Time'] ?? Timestamp.now(),
      radialComponentStartTime: data['Radial Component Start Time'] ?? Timestamp.now(),
      smdPickAndPlaceCompleteTime: data['SMD Pick And Place Complete Time'] ?? Timestamp.now(),
      smdPickAndPlaceStartTime: data['SMD Pick And Place Start Time'] ?? Timestamp.now(),
      solderPasteEndTime: data['Solder Paste End Time'] ?? Timestamp.now(),
      solderPasteInspectionOkOrFaulty: data['Solder Paste Inspection Ok Or Faulty'] ?? '',
      solderPasteInspectionTimestamp: data['Solder Paste Inspection Time Stamp'] ?? Timestamp.now(),
      solderPasteReflowCompleteTime: data['Solder Paste Reflow Complete Time'] ?? Timestamp.now(),
      solderPasteReflowStartTime: data['Solder Paste Reflow Start Time'] ?? Timestamp.now(),
      solderPasteStartTime: data['Solder Paste Start Time'] ?? Timestamp.now(),
      spPartsInsertionEndTime: data['SP Parts Insertion End Time'] ?? Timestamp.now(),
      spPartsInsertionStartTime: data['SP Parts Insertion Start Time'] ?? Timestamp.now(),
      threeDAoiOkOrFaulty: data['ThreeD AOI Ok Or Faulty'] ?? '',
      threeDAoiTimestamp: data['ThreeD AOI Time Stamp'] ?? Timestamp.now(),
      timestampLaserMarking: data['Time Stamp Laser Marking'] ?? Timestamp.now(),
      twoDAoiOkOrFaulty: data['TwoD AOI Ok Or Faulty'] ?? '',
      twoDAoiTimestamp: data['TwoD AOI Time Stamp'] ?? Timestamp.now(),
      waveSolderEndTime: data['Wave Solder End Time'] ?? Timestamp.now(),
      waveSolderStartTime: data['Wave Solder Start Time'] ?? Timestamp.now()
    );
  }


  // factory DataModel.empty(){
  //   return DataModel(
  //     waveSolderStartTime: Timestamp.now(),
  //     waveSolderEndTime: Timestamp.now(),
  //     twoDAoiTimestamp: Timestamp.now(),
  //     twoDAoiOkOrFaulty: ,
  //   );
  // }

  factory DataModel.empty(){
    return DataModel(
        pcbID: '',
        laserSerialNumber: '',
        timestampLaserMarking: Timestamp.now(),
        solderPasteStartTime: Timestamp.now(),
        solderPasteEndTime: Timestamp.now(),
        solderPasteInspectionTimestamp: Timestamp.now(),
        solderPasteInspectionOkOrFaulty: const Bool(),
        attendantPersonIDInSMT1: '',
        smdPickAndPlaceStartTime: Timestamp.now(),
        smdPickAndPlaceCompleteTime: Timestamp.now(),
        solderPasteReflowStartTime: Timestamp.now(),
        solderPasteReflowCompleteTime: Timestamp.now(),
        twoDAoiTimestamp: Timestamp.now(),
        twoDAoiOkOrFaulty: const Bool(),
        pcbUnloadTimestamp: Timestamp.now(),
        attendentPersonIDInSMT2: '',
        pcbaLoadStamp: '',
        radialComponentStartTime: Timestamp.now(),
        radialComponentEndTime: Timestamp.now(),
        ofmInsertionStartTime: Timestamp.now(),
        ofmInsertionEndTime: Timestamp.now(),
        spPartsInsertionStartTime: Timestamp.now(),
        spPartsInsertionEndTime: Timestamp.now(),
        waveSolderStartTime: Timestamp.now(),
        waveSolderEndTime: Timestamp.now(),
        attendentIDInTHT1: '',
        pcbaCleaningStartTime: Timestamp.now(),
        pcbaCleaningEndTime: Timestamp.now(),
        threeDAoiTimestamp: Timestamp.now(),
        threeDAoiOkOrFaulty: const Bool(),
        inCircuitTestingStartTime: Timestamp.now(),
        inCircuitTestingEndTime: Timestamp.now(),
        inCircuitTestingOkOrFaulty: const Bool(),
        coatingStartTime: Timestamp.now(),
        coatingEndTime: Timestamp.now(),
        dPanelStartTime: Timestamp.now(),
        dPanleEndTime: Timestamp.now(),
        attendentIDInTHT2: '',
        pcbStoreLocationID: ''
    );
  }

}
*/


import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  final String pcbId;
  final String laserSerialNumber;
  final Timestamp timestampLaserMarking;
  final Timestamp solderPasteStartTime;
  final Timestamp solderPasteEndTime;
  final Timestamp solderPasteInspectionTimestamp;
  final bool solderPasteInspectionOkOrFaulty;
  final String attendantPersonIdInSmt1;
  final Timestamp smdPickAndPlaceStartTime;
  final Timestamp smdPickAndPlaceCompleteTime;
  final Timestamp solderPasteReflowStartTime;
  final Timestamp solderPasteReflowCompleteTime;
  final Timestamp twoDaoiTimestamp;
  final bool twoDaoiOkOrFaulty;
  final Timestamp pcbUnloadTimestamp;
  final String attendantPersonIdInSmt2;
  final String pcbaLoadStamp;
  final Timestamp radialComponentStartTime;
  final Timestamp radialComponentEndTime;
  final Timestamp ofmInsertionStartTime;
  final Timestamp ofmInsertionEndTime;
  final Timestamp spPartsInsertionStartTime;
  final Timestamp spPartsInsertionEndTime;
  final Timestamp waveSolderStartTime;
  final Timestamp waveSolderEndTime;
  final String attendantIdInTht1;
  final Timestamp pcbaCleaningStartTime;
  final Timestamp pcbaCleaningEndTime;
  final Timestamp threeDaoiTimestamp;
  final bool threeDaoiOkOrFaulty;
  final Timestamp inCircuitTestingStartTime;
  final Timestamp inCircuitTestingEndTime;
  final bool inCircuitTestingOkOrFaulty;
  final Timestamp coatingStartTime;
  final Timestamp coatingEndTime;
  final Timestamp dPanelStartTime;
  final Timestamp dPanelEndTime;
  final String attendantIdInTht2;
  final String pcbStoreLocationId;

  const DataModel({
    required this.pcbId,
    required this.laserSerialNumber,
    required this.timestampLaserMarking,
    required this.solderPasteStartTime,
    required this.solderPasteEndTime,
    required this.solderPasteInspectionTimestamp,
    required this.solderPasteInspectionOkOrFaulty,
    required this.attendantPersonIdInSmt1,
    required this.smdPickAndPlaceStartTime,
    required this.smdPickAndPlaceCompleteTime,
    required this.solderPasteReflowStartTime,
    required this.solderPasteReflowCompleteTime,
    required this.twoDaoiTimestamp,
    required this.twoDaoiOkOrFaulty,
    required this.pcbUnloadTimestamp,
    required this.attendantPersonIdInSmt2,
    required this.pcbaLoadStamp,
    required this.radialComponentStartTime,
    required this.radialComponentEndTime,
    required this.ofmInsertionStartTime,
    required this.ofmInsertionEndTime,
    required this.spPartsInsertionStartTime,
    required this.spPartsInsertionEndTime,
    required this.waveSolderStartTime,
    required this.waveSolderEndTime,
    required this.attendantIdInTht1,
    required this.pcbaCleaningStartTime,
    required this.pcbaCleaningEndTime,
    required this.threeDaoiTimestamp,
    required this.threeDaoiOkOrFaulty,
    required this.inCircuitTestingStartTime,
    required this.inCircuitTestingEndTime,
    required this.inCircuitTestingOkOrFaulty,
    required this.coatingStartTime,
    required this.coatingEndTime,
    required this.dPanelStartTime,
    required this.dPanelEndTime,
    required this.attendantIdInTht2,
    required this.pcbStoreLocationId,
  });

  Map<String, dynamic> toMap() {
    return {
      'pcbId': pcbId,
      'laserSerialNumber': laserSerialNumber,
      'timestampLaserMarking': timestampLaserMarking,
      'solderPasteStartTime': solderPasteStartTime,
      'solderPasteEndTime': solderPasteEndTime,
      'solderPasteInspectionTimestamp': solderPasteInspectionTimestamp,
      'solderPasteInspectionOkOrFaulty': solderPasteInspectionOkOrFaulty,
      'attendantPersonIdInSmt1': attendantPersonIdInSmt1,
      'smdPickAndPlaceStartTime': smdPickAndPlaceStartTime,
      'smdPickAndPlaceCompleteTime': smdPickAndPlaceCompleteTime,
      'solderPasteReflowStartTime': solderPasteReflowStartTime,
      'solderPasteReflowCompleteTime': solderPasteReflowCompleteTime,
      'twoDaoiTimestamp': twoDaoiTimestamp,
      'twoDaoiOkOrFaulty': twoDaoiOkOrFaulty,
      'pcbUnloadTimestamp': pcbUnloadTimestamp,
      'attendantPersonIdInSmt2': attendantPersonIdInSmt2,
      'pcbaLoadStamp': pcbaLoadStamp,
      'radialComponentStartTime': radialComponentStartTime,
      'radialComponentEndTime': radialComponentEndTime,
      'ofmInsertionStartTime': ofmInsertionStartTime,
      'ofmInsertionEndTime': ofmInsertionEndTime,
      'spPartsInsertionStartTime': spPartsInsertionStartTime,
      'spPartsInsertionEndTime': spPartsInsertionEndTime,
      'waveSolderStartTime': waveSolderStartTime,
      'waveSolderEndTime': waveSolderEndTime,
      'attendantIdInTht1': attendantIdInTht1,
      'pcbaCleaningStartTime': pcbaCleaningStartTime,
      'pcbaCleaningEndTime': pcbaCleaningEndTime,
      'threeDaoiTimestamp': threeDaoiTimestamp,
      'threeDaoiOkOrFaulty': threeDaoiOkOrFaulty,
      'inCircuitTestingStartTime': inCircuitTestingStartTime,
      'inCircuitTestingEndTime': inCircuitTestingEndTime,
      'inCircuitTestingOkOrFaulty': inCircuitTestingOkOrFaulty,
      'coatingStartTime': coatingStartTime,
      'coatingEndTime': coatingEndTime,
      'dPanelStartTime': dPanelStartTime,
      'dPanelEndTime': dPanelEndTime,
      'attendantIdInTht2': attendantIdInTht2,
      'pcbStoreLocationId': pcbStoreLocationId,
    };
  }

  factory DataModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? {};

    return DataModel(
      pcbId: data['pcbId'] ?? '',
      laserSerialNumber: data['laserSerialNumber'] ?? '',
      timestampLaserMarking: data['timestampLaserMarking'] as Timestamp? ?? Timestamp.now(),
      solderPasteStartTime: data['solderPasteStartTime'] as Timestamp? ?? Timestamp.now(),
      solderPasteEndTime: data['solderPasteEndTime'] as Timestamp? ?? Timestamp.now(),
      solderPasteInspectionTimestamp: data['solderPasteInspectionTimestamp'] as Timestamp? ?? Timestamp.now(),
      solderPasteInspectionOkOrFaulty: data['solderPasteInspectionOkOrFaulty'] as bool? ?? false,
      attendantPersonIdInSmt1: data['attendantPersonIdInSmt1'] ?? '',
      smdPickAndPlaceStartTime: data['smdPickAndPlaceStartTime'] as Timestamp? ?? Timestamp.now(),
      smdPickAndPlaceCompleteTime: data['smdPickAndPlaceCompleteTime'] as Timestamp? ?? Timestamp.now(),
      solderPasteReflowStartTime: data['solderPasteReflowStartTime'] as Timestamp? ?? Timestamp.now(),
      solderPasteReflowCompleteTime: data['solderPasteReflowCompleteTime'] as Timestamp? ?? Timestamp.now(),
      twoDaoiTimestamp: data['twoDaoiTimestamp'] as Timestamp? ?? Timestamp.now(),
      twoDaoiOkOrFaulty: data['twoDaoiOkOrFaulty'] as bool? ?? false,
      pcbUnloadTimestamp: data['pcbUnloadTimestamp'] as Timestamp? ?? Timestamp.now(),
      attendantPersonIdInSmt2: data['attendantPersonIdInSmt2'] ?? '',
      pcbaLoadStamp: data['pcbaLoadStamp'] ?? '',
      radialComponentStartTime: data['radialComponentStartTime'] as Timestamp? ?? Timestamp.now(),
      radialComponentEndTime: data['radialComponentEndTime'] as Timestamp? ?? Timestamp.now(),
      ofmInsertionStartTime: data['ofmInsertionStartTime'] as Timestamp? ?? Timestamp.now(),
      ofmInsertionEndTime: data['ofmInsertionEndTime'] as Timestamp? ?? Timestamp.now(),
      spPartsInsertionStartTime: data['spPartsInsertionStartTime'] as Timestamp? ?? Timestamp.now(),
      spPartsInsertionEndTime: data['spPartsInsertionEndTime'] as Timestamp? ?? Timestamp.now(),
      waveSolderStartTime: data['waveSolderStartTime'] as Timestamp? ?? Timestamp.now(),
      waveSolderEndTime: data['waveSolderEndTime'] as Timestamp? ?? Timestamp.now(),
      attendantIdInTht1: data['attendantIdInTht1'] ?? '',
      pcbaCleaningStartTime: data['pcbaCleaningStartTime'] as Timestamp? ?? Timestamp.now(),
      pcbaCleaningEndTime: data['pcbaCleaningEndTime'] as Timestamp? ?? Timestamp.now(),
      threeDaoiTimestamp: data['threeDaoiTimestamp'] as Timestamp? ?? Timestamp.now(),
      threeDaoiOkOrFaulty: data['threeDaoiOkOrFaulty'] as bool? ?? false,
      inCircuitTestingStartTime: data['inCircuitTestingStartTime'] as Timestamp? ?? Timestamp.now(),
      inCircuitTestingEndTime: data['inCircuitTestingEndTime'] as Timestamp? ?? Timestamp.now(),
      inCircuitTestingOkOrFaulty: data['inCircuitTestingOkOrFaulty'] as bool? ?? false,
      coatingStartTime: data['coatingStartTime'] as Timestamp? ?? Timestamp.now(),
      coatingEndTime: data['coatingEndTime'] as Timestamp? ?? Timestamp.now(),
      dPanelStartTime: data['dPanelStartTime'] as Timestamp? ?? Timestamp.now(),
      dPanelEndTime: data['dPanelEndTime'] as Timestamp? ?? Timestamp.now(),
      attendantIdInTht2: data['attendantIdInTht2'] ?? '',
      pcbStoreLocationId: data['pcbStoreLocationId'] ?? '',
    );
  }

  factory DataModel.empty() {
    return DataModel(
      pcbId: '',
      laserSerialNumber: '',
      timestampLaserMarking: Timestamp.now(),
      solderPasteStartTime: Timestamp.now(),
      solderPasteEndTime: Timestamp.now(),
      solderPasteInspectionTimestamp: Timestamp.now(),
      solderPasteInspectionOkOrFaulty: false,
      attendantPersonIdInSmt1: '',
      smdPickAndPlaceStartTime: Timestamp.now(),
      smdPickAndPlaceCompleteTime: Timestamp.now(),
      solderPasteReflowStartTime: Timestamp.now(),
      solderPasteReflowCompleteTime: Timestamp.now(),
      twoDaoiTimestamp: Timestamp.now(),
      twoDaoiOkOrFaulty: false,
      pcbUnloadTimestamp: Timestamp.now(),
      attendantPersonIdInSmt2: '',
      pcbaLoadStamp: '',
      radialComponentStartTime: Timestamp.now(),
      radialComponentEndTime: Timestamp.now(),
      ofmInsertionStartTime: Timestamp.now(),
      ofmInsertionEndTime: Timestamp.now(),
      spPartsInsertionStartTime: Timestamp.now(),
      spPartsInsertionEndTime: Timestamp.now(),
      waveSolderStartTime: Timestamp.now(),
      waveSolderEndTime: Timestamp.now(),
      attendantIdInTht1: '',
      pcbaCleaningStartTime: Timestamp.now(),
      pcbaCleaningEndTime: Timestamp.now(),
      threeDaoiTimestamp: Timestamp.now(),
      threeDaoiOkOrFaulty: false,
      inCircuitTestingStartTime: Timestamp.now(),
      inCircuitTestingEndTime: Timestamp.now(),
      inCircuitTestingOkOrFaulty: false,
      coatingStartTime: Timestamp.now(),
      coatingEndTime: Timestamp.now(),
      dPanelStartTime: Timestamp.now(),
      dPanelEndTime: Timestamp.now(),
      attendantIdInTht2: '',
      pcbStoreLocationId: '',
    );
  }
}