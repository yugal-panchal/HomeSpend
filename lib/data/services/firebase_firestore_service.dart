import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_spend/data/models/budget_model.dart';
import 'package:home_spend/data/models/expense_model.dart';
import 'package:home_spend/data/models/family_model.dart';
import 'package:home_spend/data/models/topup_model.dart';
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
        "family_details": {},
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

   /// Add a family document to /families/{familyId}
  Future<void> addFamily(FamilyModel family) async {
    await _firestore.collection('families').doc(family.id).set(family.toMap());
  }

  /// Add a budget document to /families/{familyId}/budgets/{budgetId}
  Future<void> addBudget(String familyId, BudgetModel budget) async {
    await _firestore
        .collection('families')
        .doc(familyId)
        .collection('budgets')
        .doc(budget.id)
        .set(budget.toMap());
  }

  /// Add an expense to /families/{familyId}/budgets/{budgetId}/expenses/{expenseId}
  Future<void> addExpense(String familyId, String budgetId, ExpenseModel expense) async {
    await _firestore
        .collection('families')
        .doc(familyId)
        .collection('budgets')
        .doc(budgetId)
        .collection('expenses')
        .doc(expense.id)
        .set(expense.toMap());
  }

  /// Add a top-up to /families/{familyId}/budgets/{budgetId}/topups/{topupId}
  Future<void> addTopup(String familyId, String budgetId, TopupModel topup) async {
    await _firestore
        .collection('families')
        .doc(familyId)
        .collection('budgets')
        .doc(budgetId)
        .collection('topups')
        .doc(topup.id)
        .set(topup.toMap());
  }
}
