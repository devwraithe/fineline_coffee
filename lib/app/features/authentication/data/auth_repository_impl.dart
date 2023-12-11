import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../core/utilities/helpers/constants.dart';
import '../domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;
  const AuthRepositoryImpl(this._auth);

  @override
  Future<Either<Failure, User?>> register(Map<String, dynamic> data) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      return Right(credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return const Left(Failure("Account already exists for this email"));
      } else if (e.code == 'weak-password') {
        return const Left(Failure("Password must be 6+ characters"));
      } else if (e.code == 'invalid-email') {
        return const Left(Failure("Invalid email address"));
      } else if (e.code == "network-request-failed") {
        return Left(Failure(Constants.socketError));
      } else {
        return Left(Failure(Constants.unknownError));
      }
    } on SocketException catch (_) {
      throw ConnectionException(Constants.socketError);
    } on TimeoutException catch (_) {
      throw ConnectionException(Constants.timeoutError);
    } catch (e) {
      throw ServerException(Constants.unknownError);
    }
  }

  @override
  Future<Either<Failure, void>> login(Map<String, dynamic> data) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );

      return const Right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return const Left(Failure("Invalid login credentials"));
      } else if (e.code != 'invalid-credential') {
        return Left(Failure(e.message!));
      } else {
        return Left(Failure(Constants.unknownError));
      }
    } on SocketException catch (_) {
      throw ConnectionException(Constants.socketError);
    } on TimeoutException catch (_) {
      throw ConnectionException(Constants.timeoutError);
    } catch (e) {
      throw ServerException(Constants.unknownError);
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      debugPrint("ServerException: $e");
      if (e.code == 'user-not-found') {
        return const Left(Failure("No user found for this email"));
      } else if (e.code == 'invalid-email') {
        return const Left(Failure("Invalid email address"));
      } else {
        return Left(Failure(Constants.unknownError));
      }
    } on SocketException catch (_) {
      throw ConnectionException(Constants.socketError);
    } on TimeoutException catch (_) {
      throw ConnectionException(Constants.timeoutError);
    } catch (e) {
      throw ServerException(Constants.unknownError);
    }
  }

  @override
  Future<bool> authStatus() async {
    final User? user = _auth.currentUser;
    return user != null;
  }

  @override
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException {
      throw ServerException("No user found for this email");
    } on SocketException {
      throw ConnectionException(Constants.socketError);
    } on TimeoutException catch (_) {
      throw ConnectionException(Constants.timeoutError);
    } catch (e) {
      throw ServerException(Constants.unknownError);
    }
  }
}
