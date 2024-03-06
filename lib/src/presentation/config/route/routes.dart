/// A class to keep the available routes of the app.
enum Routes {
  home('/'),
  verify('/verify'),
  place('/place'),
  scan('/scan'),
  pending('/pending');

  const Routes(this.value);

  final String value;
}