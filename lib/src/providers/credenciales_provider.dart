import 'package:flutter/material.dart';

class CredencialProvider with ChangeNotifier {
  final List<String> _generos = ['Masculino', 'Femenino'];
  final List<String> _estadosCiviles = ['SOLTERO', 'CASADO', 'VIUDO'];
  final List<String> _escolaridades = [
    'Sin estudios',
    'Preescolar',
    'Primaria',
    'Secundaria',
    'Media Superior',
    'Licenciatura',
    'Maestría',
    'Doctorado'
  ];




  // List<String> _regiones = [];
  String _textSocial = "";
    String _textSocialEdit = "";



  String _redesEdit = 'NO';
  
  String _newTaller = 'SI';
  String _newOrganizacion = 'SI';

  List<String> get generos => _generos;
  List<String> get estadosCiviles => _estadosCiviles;
  // List<String> get regiones => _regiones;
  List<String> get escolaridades => _escolaridades;

  bool _flagFace = false;
  bool _flagInsta = false;
  bool _flagTwitter = false;
  bool _flagYoutube = false;
  bool _flagTiktok = false;
  bool _redes = false;

  
  bool _flagFaceEdit = false;
  bool _flagInstaEdit = false;
  bool _flagTwitterEdit = false;
  bool _flagYoutubeEdit = false;
  bool _flagTiktokEdit = false;

  bool _edit = false;
  bool _editTecnica = false;
  bool _editOrganizacion = false;
  bool _editRama = false;
  bool _editTaller = false;
  bool _renovados = false;

  
  bool get flagFaceEdit => _flagFaceEdit;
  bool get flagInstaEdit => _flagInstaEdit;
  bool get flagTwitterEdit => _flagTwitterEdit;
  bool get flagYoutubeEdit => _flagYoutubeEdit;
  bool get flagTiktokEdit => _flagTiktokEdit;
  String get textSocialEdit => _textSocialEdit;

  bool get flagFace => _flagFace;
  bool get flagInsta => _flagInsta;
  bool get flagTwitter => _flagTwitter;
  bool get flagYoutube => _flagYoutube;
  bool get flagTiktok => _flagTiktok;
  String get textSocial => _textSocial;

  bool get redes => _redes;
  String get redesEdit => _redesEdit;
  String get newTaller => _newTaller;
  String get newOrganizacion => _newOrganizacion;
  bool get edit => _edit;
  bool get editTecnica => _editTecnica;
  bool get editRama => _editRama;
  bool get editTaller => _editTaller;
  bool get editOrganizacion => _editOrganizacion;
  bool get renovados => _renovados;

  void setRedes(String edit, bool state) {
    _redesEdit = edit;
    _redes = state;
    if (state == false) {
      _flagFace = false;
      _flagInsta = false;
      _flagTwitter = false;
      _flagYoutube = false;
      _flagTiktok = false;
      _textSocial = "";
    }
    notifyListeners();
  }

  void setnewTaller(String edit) {
    _newTaller = edit;
    notifyListeners();
  }

  
  void setnewOrganizacion(String edit) {
    _newOrganizacion = edit;
    notifyListeners();
  }

  void setButtonEditArtesano() {
    _edit = !edit;
    notifyListeners();
  }


  void setButtonEditOrganizacion() {
    _editOrganizacion = !_editOrganizacion;
    notifyListeners();
  }

  void setButtonEditRama() {
    _editRama = !_editRama;
    notifyListeners();
  }

  void setButtonEditTecnica() {
    _editTecnica = !_editTecnica;
    notifyListeners();
  }

  void setButtonEditTaller() {
    _editTaller = !_editTaller;
    notifyListeners();
  }

  void setButtonRenovados() {
    _renovados = !renovados;
    notifyListeners();
  }

  void setSocialSelected(red) {
    switch (red) {
      case 'face':
        _textSocial = "FACEBOOK";
        _flagFace = true;
        _flagInsta = false;
        _flagTwitter = false;
        _flagYoutube = false;
        _flagTiktok = false;
        break;
      case 'insta':
        _textSocial = "INSTAGRAM";
        _flagFace = false;
        _flagInsta = true;
        _flagTwitter = false;
        _flagYoutube = false;
        _flagTiktok = false;
        break;
      case 'twitter':
        _textSocial = "TWITTER";
        _flagFace = false;
        _flagInsta = false;
        _flagTwitter = true;
        _flagYoutube = false;
        _flagTiktok = false;
        break;
      case 'youtube':
        _textSocial = "YOUTUBE";
        _flagFace = false;
        _flagInsta = false;
        _flagTwitter = false;
        _flagYoutube = true;
        _flagTiktok = false;
        break;
      case 'tiktok':
        _textSocial = "TIKTOK";
        _flagFace = false;
        _flagInsta = false;
        _flagTwitter = false;
        _flagYoutube = false;
        _flagTiktok = true;
        break;
      default:
    }
    notifyListeners();
  }

  void setSocialEdit(red) {
    switch (red) {
      case 'face':
        _textSocialEdit = "FACEBOOK";
        _flagFaceEdit = true;
        _flagInstaEdit = false;
        _flagTwitterEdit = false;
        _flagYoutubeEdit = false;
        _flagTiktokEdit = false;
        break;
      case 'insta':
        _textSocialEdit = "INSTAGRAM";
        _flagFaceEdit = false;
        _flagInstaEdit = true;
        _flagTwitterEdit = false;
        _flagYoutubeEdit = false;
        _flagTiktokEdit = false;
        break;
      case 'twitter':
        _textSocialEdit = "TWITTER";
        _flagFaceEdit = false;
        _flagInstaEdit = false;
        _flagTwitterEdit = true;
        _flagYoutubeEdit = false;
        _flagTiktokEdit = false;
        break;
      case 'youtube':
        _textSocialEdit = "YOUTUBE";
        _flagFaceEdit = false;
        _flagInstaEdit = false;
        _flagTwitterEdit = false;
        _flagYoutubeEdit = true;
        _flagTiktokEdit = false;
        break;
      case 'tiktok':
        _textSocialEdit = "TIKTOK";
        _flagFaceEdit = false;
        _flagInstaEdit = false;
        _flagTwitterEdit = false;
        _flagYoutubeEdit = false;
        _flagTiktokEdit = true;
        break;
      default:
    }
    notifyListeners();
  }

  void getGeneros() {
    notifyListeners();
  }

  void getEstadosCiviles() {
    notifyListeners();
  }

  void getEscolaridades() {
    notifyListeners();
  }
}
