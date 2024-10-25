class SMTLineData {
  final String totalPCBLoad;
  final String processComplete;
  final String inProcess;
  final String jobID;
  final String attendantID;
  final String timeCycle;
  final DateTime timestamp;
  final String tableType;
  final Map<String, String> productionDetails;

  SMTLineData({
    required this.totalPCBLoad,
    required this.processComplete,
    required this.inProcess,
    required this.jobID,
    required this.attendantID,
    required this.timeCycle,
    required this.timestamp,
    required this.tableType,
    required this.productionDetails,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalPCBLoad': totalPCBLoad,
      'processComplete': processComplete,
      'inProcess': inProcess,
      'jobID': jobID,
      'attendantID': attendantID,
      'timeCycle': timeCycle,
      'timestamp': timestamp,
      'tableType': tableType,
      'productionDetails': productionDetails,
    };
  }
}