import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_spend/utils/constants.dart';
import 'package:home_spend/utils/helper_functions.dart';

class FirebaseFirestoreService {
  FirebaseFirestoreService._privateConstructor();
  static final FirebaseFirestoreService _instance =
      FirebaseFirestoreService._privateConstructor();
  factory FirebaseFirestoreService() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addUser(Map<String, dynamic> userData) async {
    final familiesRef = _firestore.collection(Constants.firestoreFamilies);
    String docPath;
    if (userData["roleId"] == 1) {
      final String generatedCode = HelperFunctions.generateRandomCode(8);

      final newFamilyData = {
        "createdAt": DateTime.now().millisecondsSinceEpoch,
        "code": generatedCode,
        "family_members": [userData],
        "transactions": [],
        "family_details": [],
      };

      docPath = (await familiesRef.add(newFamilyData)).path;
    } else {
      final code = userData["code"];
      final querySnapshot = await familiesRef
          .where("code", isEqualTo: code)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        final docRef = familiesRef.doc(doc.id);

        // Add userData to family_members array
        await docRef.update({
          "family_members": FieldValue.arrayUnion([userData]),
        });
        docPath = docRef.path;
      } else {
        throw Exception("No family found with code: $code");
      }
      
    }
    return docPath;
  }
}
