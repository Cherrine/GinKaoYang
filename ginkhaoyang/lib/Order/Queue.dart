//ทำมาtest

class Queue {
  // Attributes
  int queueNumber;
  String queueStatus;

  // Constructor
  Queue({
    required this.queueNumber,
    required this.queueStatus,
  });

  // Factory constructor to create a Queue object from Firestore data
  factory Queue.fromFirestore(Map<String, dynamic> data) {
    return Queue(
      queueNumber: data['queueNumber'] ?? 0,  // ใช้ค่า default ถ้าไม่มีค่าใน Firestore
      queueStatus: data['queueStatus'] ?? 'unknown',  // ใช้ค่า default ถ้าไม่มีค่าใน Firestore
    );
  }

  // Method to convert Queue object to Firestore compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'queueNumber': queueNumber,
      'queueStatus': queueStatus,
    };
  }
}