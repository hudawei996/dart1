import 'dart:math';

class Rectangle {
  late int width = 0;
  late int height = 0;
  late Point origin;

  //构造函数
  // four constructors
  Rectangle() {
    origin = Point(0, 0);
  }

  Rectangle(Point point) {
    origin = point;
  }

  Rectangle(int w, int h) {
    origin = Point(0, 0);
    width = w;
    height = h;
  }

  Rectangle(Point p, int w, int h) {
    origin = p;
    width = w;
    height = h;
  }

  // Rectangle(this.origin, this.width, this.height);

  // a method for moving the rectangle
  void move(int x, int y) {
    origin.x = x;
    origin.y = y;
  }

  // a method for computing the area of the rectangle
  int getArea() {
    return width * height;
  }

  //自动生成的toString()
  // @override
  // String toString() {
  //   return 'Rectangle{width: $width, height: $height, origin: $origin}';
  // }

  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}
