import 'package:adminlowcarbo/view/profile/view.dart';
import 'package:adminlowcarbo/model/profile/model.dart';

class AppPresenter {
  set view(AppView value){}
  void buttonClick(){}
}

class ProfilePageAppPresenter implements AppPresenter {
  AppModel _model;
  AppView _view;

  ProfilePageAppPresenter(){
    this._model = AppModel();
    this._view = AppView();
  }

  @override
  void set view(AppView value) {
    // TODO: implement view
    _view = value;
    this._view.refreshData(this._model);
  }

  @override
  void buttonClick() {
    // TODO: implement buttonClick
  }

}