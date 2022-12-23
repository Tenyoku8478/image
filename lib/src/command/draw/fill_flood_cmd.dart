import '../../color/color.dart';
import '../../draw/fill_flood.dart';
import '../command.dart';

class FillFloodCmd extends Command {
  int x;
  int y;
  Color color;
  num threshold;
  bool compareAlpha;

  FillFloodCmd(Command? input, this.x, this.y, this.color,
      { this.threshold = 0.0, this.compareAlpha = false })
      : super(input);

  @override
  void executeCommand() {
    input?.executeIfDirty();
    final img = input?.image;
    image = img != null ? fillFlood(img, x, y, color, threshold: threshold,
        compareAlpha: compareAlpha) : img;
  }
}
