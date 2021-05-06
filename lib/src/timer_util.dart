import 'dart:async';

///定时器工具类
///
///another Fairy

///定时器回调
typedef void OnTimerCallback(int milliseconds);

class TimerUtil {
  Timer? _timer;

  ///定时器每隔多久运行的时间，单位毫秒，默认1000毫秒（1秒）
  int duration;

  ///倒计时总时间 单位毫秒
  int totalTime = 0;

  ///定时器回调
  OnTimerCallback? callback;

  TimerUtil({
    this.duration = Duration.millisecondsPerSecond,
    this.callback,
  });

  TimerUtil.countDown(this.duration, this.totalTime, this.callback);

  ///启动定时器
  void startTimer() {
    if (isActive()) return;
    _timer = Timer.periodic(Duration(milliseconds: duration), (timer) {
      _callback(timer.tick);
    });
  }

  ///启动倒计时定时器
  void startCountDown() {
    if (isActive() || totalTime <= 0) return;
    _timer = Timer.periodic(Duration(milliseconds: duration), (timer) {
      var time = totalTime - duration;
      totalTime = time;
      if (time >= duration) {
        _callback(time);
      } else if (time == 0) {
        _callback(time);
        cancelTimer();
      } else {
        timer.cancel();
        Future.delayed(Duration(milliseconds: time), () {
          totalTime = 0;
          cancelTimer();
        });
      }
    });
  }

  ///取消计时器
  void cancelTimer() {
    _timer?.cancel();
  }

  ///定时器是否启动
  bool isActive() => _timer?.isActive == true;

  ///重设倒计时总时间
  void updateTotalTime(int totalTime) {
    cancelTimer();
    this.totalTime = totalTime;
    startCountDown();
  }

  void _callback(tick) {
    callback?.call(tick);
  }
}
