abstract class Shape {
  void draw();
}

class Circle extends Shape {
  @override
  void draw() {
    print("Drawing Circle");
  }
}

class Rectangle extends Shape {
  @override
  void draw() {
    print("Drawing Rectangle");
  }
}

class Square extends Shape {
  @override
  void draw() {
    print("Drawing Square");
  }
}

class ShapeFactory {
  Shape createShape(String type) {
    try {} catch (e) {}
    if (type == "circle") {
      return Circle();
    } else if (type == "rectangle") {
      return Rectangle();
    } else if (type == "square") {
      return Square();
    } else {
      throw Exception("Invalid Shape Type");
    }
  }
}
