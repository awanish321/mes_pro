// import 'dart:async';
//
// class MockBarcodeService1 {
//   static final MockBarcodeService1 _instance = MockBarcodeService1._internal();
//
//   factory MockBarcodeService1() {
//     return _instance;
//   }
//
//   MockBarcodeService1._internal();
//
//   final _controller = StreamController<Map<String, String>>.broadcast();
//   Map<String, String> _lastScannedData = {
//     "Shift": "A",
//     "Lot ID": "1234",
//     "Employee Name": "Mr.Mukesh",
//     "Processing Items": "55",
//     "Finished Items": "45",
//     "Machine Run Time": "",
//     "Machine Stop Time": "",
//     "Average Cycle Time" : ""
//   };
//
//   Stream<Map<String, String>> get barcodeStream => _controller.stream;
//
//   void scanBarcode(Map<String, String> data) {
//     _lastScannedData = data;
//     _controller.add(data);
//   }
//
//   Map<String, String> getLastScannedData() {
//     return _lastScannedData;
//   }
//
//   void dispose() {
//     _controller.close();
//   }
// }