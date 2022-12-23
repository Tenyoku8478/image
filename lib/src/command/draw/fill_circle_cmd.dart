import '../../color/color.dart';
import '../../draw/draw_circle.dart';
import '../command.dart';

class FillCircleCmd extends Command {
  int x;
  int y;
  int radius;
  Color color;

  FillCircleCmd(Command? input, this.x, this.y, this.radius, this.color)
      : super(input);

  @override
  void executeCommand() {
    input?.executeIfDirty();
    final img = input?.image;
    image = img != null ? fillCircle(img, x, y, radius, color) : img;
  }
}
