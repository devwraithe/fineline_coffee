import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fineline_coffee/app/features/menu/data/models/sub_menu_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../core/utilities/helpers/constants.dart';
import '../domain/menu_repository.dart';
import 'menu_model.dart';

class MenuRepositoryImpl implements MenuRepository {
  final user = Constants.firebaseAuth.currentUser;

  @override
  Future<Either<Failure, List<MenuModel>>> menu() async {
    try {
      final querySnapshot = await Constants.firestore.collection('menu').get();

      final menu = querySnapshot.docs.map((doc) {
        return MenuModel.fromSnapshot(doc);
      }).toList();
      return Right(menu);
    } on SocketException catch (_) {
      return Left(Failure(Constants.socketError));
    } on TimeoutException catch (_) {
      return Left(Failure(Constants.timeoutError));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SubMenuModel>>> subMenu(String id) async {
    try {
      final menuCollection = Constants.firestore.collection('menu');

      final querySnapshot = await menuCollection.doc(id).get();

      if (querySnapshot.exists) {
        final itemsCollection = menuCollection.doc(id).collection('items');

        final itemsQuery = await itemsCollection.get();

        final subMenu = itemsQuery.docs.map((doc) {
          return SubMenuModel.fromSnapshot(doc);
        }).toList();

        return Right(subMenu);
      } else {
        return const Left(Failure("Items does not exist"));
      }
    } on SocketException catch (_) {
      return Left(Failure(Constants.socketError));
    } on TimeoutException catch (_) {
      return Left(Failure(Constants.timeoutError));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
