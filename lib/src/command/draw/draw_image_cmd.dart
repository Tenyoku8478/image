import '../../draw/draw_image.dart';
import '../command.dart';

class DrawImageCmd extends Command {
  Command? src;
  int? dstX;
  int? dstY;
  int? dstW;
  int? dstH;
  int? srcX;
  int? srcY;
  int? srcW;
  int? srcH;
  bool blend;
  bool center;

  DrawImageCmd(Command? dst, this.src, {
      this.dstX, this.dstY, this.dstW, this.dstH, this.srcX, this.srcY,
      this.srcW, this.srcH, this.blend = true, this.center = false })
      : super(dst);

  @override
  void executeCommand() {
    input?.executeIfDirty();
    src?.executeIfDirty();
    final dst = input?.image;
    final srcImg = src?.image;
    image = dst != null && srcImg != null ?
      drawImage(dst, srcImg, dstX: dstX, dstY: dstY,
          dstW: dstW, dstH: dstH, srcX: srcX, srcY: srcY, srcW: srcW,
          srcH: srcH, blend: blend, center: center) : null;
  }
}
