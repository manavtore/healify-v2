import 'package:healify/data_layer/constants/env.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Userservices {
   final Db db = Db(env.MongoDbURL);
   static const String collection = 'users';


   Future<void> connect() async {
     try{
        await db.open();
     }catch(e){
      throw Exception('Failed to connect to MongoDB: $e');
     }
   }

   Future<String> createUser({
    required String name,
    required String username,
    required double height,
    required double weight,
    required int age,
    required String bloodGroup,
    required String gender,
    required String address,
    required String image,
    required String authId,
  }) async {
    try {
      final users = db.collection(collection);

      // Check if username already exists
      final existingUser = await users.findOne(where.eq('username', username));
      if (existingUser != null) {
        throw Exception('Username already exists');
      }

      final result = await users.insert({
        '_id': ObjectId(),
        'name': name,
        'username': username,
        'height': height,
        'weight': weight,
        'age': age,
        'bloodGroup': bloodGroup,
        'gender': gender,
        'address': address,
        'image': image,
        'authId': authId,
        'joinedCommunities': [],
        'createdAt': DateTime.now(),
        'updatedAt': DateTime.now(),
      });

      return result.toString();
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  // Read user by ID
  Future<Map<String, dynamic>?> getUserById(String userId) async {
    try {
      final users = db.collection(collection);
      final result =
          await users.findOne(where.id(ObjectId.fromHexString(userId)));
      return result;
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  // Read user by authId
  Future<Map<String, dynamic>?> getUserByAuthId(String authId) async {
    try {
      final users = db.collection(collection);
      final result = await users.findOne(where.eq('authId', authId));
      return result;
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  // Update user
  // Future<bool> updateUser(String userId, Map<String, dynamic> updates) async {
  //   try {
  //     final users = db.collection(collection);

  //     // Add updateAt timestamp to updates
  //     updates['updatedAt'] = DateTime.now();

  //     // final result = await users.update(
  //     //   where.id(ObjectId.fromHexString(userId)),
  //     //   modify.set(updates),
  //     // );

  //     // return result['nModified'] as int > 0;
  //   } catch (e) {
  //     throw Exception('Failed to update user: $e');
  //   }
  // }

  // Delete user
  Future<bool> deleteUser(String userId) async {
    try {
      final users = db.collection(collection);
      final result =
          await users.remove(where.id(ObjectId.fromHexString(userId)));
      return result['n'] as int > 0;
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }


}