import '../../view/login/view.dart';
import '../../model/login/model.dart';

class AppPresenter {
  set view(AppView value) {}
}

class LoginAppPresenter implements AppPresenter{
  AppModel _model;
  AppView _view;

  LoginAppPresenter() {
    this._model = AppModel();
  }

  @override
  void set view(AppView value) {
    // TODO: implement view
    _view = value;
    this._view.refreshData(this._model);
  }

}