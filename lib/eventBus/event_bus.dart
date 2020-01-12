import 'package:event_bus/event_bus.dart';

// TODO 创建 EventBus
EventBus eventBus = new EventBus();

// 创建同一封装事件对象
class CenterEvent{
  String type;
  Object obj;

  CenterEvent(this.type, this.obj);

}