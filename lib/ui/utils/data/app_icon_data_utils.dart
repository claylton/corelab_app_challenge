class AppIconDataUtils {
  final String _path;
  AppIconDataUtils._(this._path);

  static final AppIconDataUtils home = AppIconDataUtils._('assets/icons/home.svg');
  static final AppIconDataUtils homeSelect = AppIconDataUtils._('assets/icons/home_select.svg');
  static final AppIconDataUtils category = AppIconDataUtils._('assets/icons/category.svg');
  static final AppIconDataUtils categorySelect = AppIconDataUtils._('assets/icons/category_select.svg');
  static final AppIconDataUtils add = AppIconDataUtils._('assets/icons/new.svg');
  static final AppIconDataUtils favorites = AppIconDataUtils._('assets/icons/favorites.svg');
  static final AppIconDataUtils profile = AppIconDataUtils._('assets/icons/profile.svg');

  @override
  String toString() => _path;
}