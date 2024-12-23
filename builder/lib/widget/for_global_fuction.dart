double setAllHeight(int length) {
  double height;
  if (length == 0) {
    height = 0;
  } else {
    height = (length.toDouble() * 200) - (length.toDouble() * 20);
  }
  return height;
}
