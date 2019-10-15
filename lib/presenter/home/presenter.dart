import 'package:adminlowcarbo/view/home/view.dart';
import 'package:adminlowcarbo/model/home/model.dart';

class AppPresenter {
  set view(AppView value){}
  void buttonClick(){}
}

class HomePageAppPresenter implements AppPresenter {
  AppModel _model;
  AppView _view;

  HomePageAppPresenter(){
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