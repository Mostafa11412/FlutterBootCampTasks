import 'factory.dart';

void main() {
  Shape shape1 = ShapeFactory().createShape("circle");

  shape1.draw();

  Shape shape2 = ShapeFactory().createShape("square");

  shape2.draw();

  Shape shape3 = ShapeFactory().createShape("rectangle");

  shape3.draw();

  Shape shape4 = ShapeFactory().createShape("test");

  shape4.draw();
}
