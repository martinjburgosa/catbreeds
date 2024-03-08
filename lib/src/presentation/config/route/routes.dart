/// A class to keep the available routes of the app.
enum Routes {
  home('/'),
  detail('/detail'),
  splash('/splash');

  const Routes(this.value);

  final String value;
}
