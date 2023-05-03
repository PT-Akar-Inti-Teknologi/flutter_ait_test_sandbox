import 'dart:convert';

import 'package:common_dependency/common_dependency.dart';
import 'package:auth/auth.dart';

enum AuthLocalDataAction { delete, update }

typedef AuthLocalListener = Function(
    AuthLocalDataAction action, AuthLocalModel model);

class _Notifier {
  final List<AuthLocalListener> _listeners = [];
  addListener(AuthLocalListener listener) {
    _listeners.add(listener);
  }

  removeListener(AuthLocalListener listener) {
    _listeners.remove(listener);
  }

  removeAllListener() {
    _listeners.clear();
  }

  notifyListeners(AuthLocalDataAction action, AuthLocalModel model) {
    for (var listener in _listeners) {
      listener.call(action, model);
    }
  }
}

abstract class AuthLocalDataSource {
  Future<TokenModel?> setTokens(
      {required WhichToken whichToken, required TokenModel token});
  Future<void> deleteTokens([WhichToken? whichToken]);
  TokenModel? getTokens([WhichToken? whichToken]);
  WhichToken? whichTokenAvailable();
  Future<void> load();
  listen(AuthLocalListener listener);
  unlisten(AuthLocalListener listener);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final LocalStorage storage;
  bool _isInitialized = false;
  AuthLocalModel _model = const AuthLocalModel();
  final _Notifier _notifier = _Notifier();

  AuthLocalDataSourceImpl(this.storage);
  @override
  TokenModel? getTokens([WhichToken? whichToken]) {
    if ((whichToken == null || whichToken == WhichToken.user) &&
        _model.authToken != null) {
      return _model.authToken;
    }
    if ((whichToken == null || whichToken == WhichToken.guest) &&
        _model.authToken != null) {
      return _model.guestToken;
    }
    return null;
  }

  @override
  Future<TokenModel?> setTokens(
      {required WhichToken whichToken, required TokenModel token}) async {
    load();
    if (whichToken == WhichToken.guest) {
      _model = _model.copyWith(guestToken: token);
    } else {
      _model = _model.copyWith(authToken: token);
    }
    _notifier.notifyListeners(AuthLocalDataAction.update, _model);
    await storage.write(key: 'auth', value: jsonEncode(_model.toJson()));
    return token;
  }

  @override
  Future<void> deleteTokens([WhichToken? whichToken]) async {
    if (whichToken == null || whichToken == WhichToken.user) {
      _model = _model.copyWith(guestToken: null);
    }
    if (whichToken == null || whichToken == WhichToken.guest) {
      _model = _model.copyWith(authToken: null);
    }
    _notifier.notifyListeners(AuthLocalDataAction.delete, _model);
    await storage.write(key: 'auth', value: jsonEncode(_model.toJson()));
  }

  @override
  WhichToken? whichTokenAvailable() {
    if (_model.authToken != null) return WhichToken.user;
    if (_model.guestToken != null) return WhichToken.guest;
    return null;
  }

  @override
  Future<void> load() async {
    if (!_isInitialized) {
      try {
        _model = AuthLocalModel.fromJson(
            jsonDecode(await storage.read(key: 'auth') ?? ''));
      } catch (_) {}
      _isInitialized = true;
    }
  }

  @override
  listen(AuthLocalListener listener) {
    _notifier.addListener(listener);
  }

  @override
  unlisten(AuthLocalListener listener) {
    _notifier.removeListener(listener);
  }
}
