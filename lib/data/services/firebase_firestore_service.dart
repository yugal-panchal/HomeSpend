import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_spend/data/models/budget_model.dart';
import 'package:home_spend/data/models/expense_model.dart';
import 'package:home_spend/data/models/family_member_model.dart';
import 'package:home_spend/data/models/family_model.dart';
import 'package:home_spend/data/models/response_model.dart';
import 'package:home_spend/data/models/topup_model.dart';
import 'package:home_spend/utils/firestore_constants.dart';

class FirebaseFirestoreService {
  FirebaseFirestoreService._privateConstructor();

  static final FirebaseFirestoreService _instance =
      FirebaseFirestoreService._privateConstructor();

  factory FirebaseFirestoreService() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseModel> userSignup(
    FamilyMemberModel userData,
    FamilyModel familyData,
  ) async {
    try {
      if (userData.roleId == 1) {
        familyData.copyWith(id: await addFamily(familyData));
        userData.copyWith(familyId: familyData.id);
        if (await addUser(userData)) {
          return ResponseModel(true, "Welcome to the family 😊");
        }
      } else {
        String? familyId = await _findFamilyByCode(familyData.code);

        if (familyId == null) {
          return ResponseModel(false, "No family found with this code");
        }

        userData.copyWith(familyId: familyId);
        if (await addUser(userData)) {
          return ResponseModel(true, "Welcome to the family 😊");
        }
      }
      return ResponseModel(false, "Error");
    } catch (e) {
      print("Error saving data $e");
      return ResponseModel(false, "Error");
    }
  }

  Future<String?> _findFamilyByCode(String code) async {
    final querySnapshot = await _firestore
        .collection(FirestoreConstants.familiesKey)
        .where("code", isEqualTo: code)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final doc = querySnapshot.docs.first;
      return doc["id"];
    }

    return null;
  }

  ///Add a user in users collection /users/{userId}
  Future<bool> addUser(FamilyMemberModel user) async {
    try {
      final docRef = _firestore
          .collection(FirestoreConstants.usersKey)
          .doc(); // auto-generate ID
      user.copyWith(id: docRef.id); // assign ID to model

      await docRef.set(user.toJson());
      return true;
    } catch (e) {
      print("Error saving user data $e");
    }
    return false;
  }

  Future<bool> isUserRegistered(String number) async {
    try {
      final querySnapshot = await _firestore
          .collection(FirestoreConstants.usersKey)
          .where("phone_number", isEqualTo: number)
          .limit(1)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return true;
      }
      return false;
    } catch (e) {
      print("Error checking id user is registered $e");
      return false;
    }
  }

  /// Add a family document to /families/{familyId}
  Future<String> addFamily(FamilyModel family) async {
    final docRef = _firestore
        .collection(FirestoreConstants.familiesKey)
        .doc(); // auto-generate ID
    family.copyWith(id: docRef.id); // assign ID to model

    await docRef.set(family.toMap());

    return docRef.id;
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
  Future<void> addExpense(
    String familyId,
    String budgetId,
    ExpenseModel expense,
  ) async {
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
  Future<void> addTopup(
    String familyId,
    String budgetId,
    TopupModel topup,
  ) async {
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
