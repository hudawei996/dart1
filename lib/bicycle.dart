
//可以文件名和类名不同
class Bicycle {
  int cadence;

  int _speed = 0;
  int get speed => _speed;
  
  int gear;

  //原始写法
  // Bicycle(int cadence, int speed, int gear)
  //     : this.cadence = cadence,
  //       this.speed = speed,
  //       this.gear = gear;
  //一行解决
  // Bicycle(this.cadence, this.speed, this.gear);

  //设置一个私有参数
  Bicycle(this.cadence, this.gear);


  //重写toString()方法
  @override
  String toString() => 'Bicycle: $speed mph';

  //将speed实现为只读实例变量
  void applyBrake(int decrement){
    _speed -= decrement;
  }

  void speedUp(int increment){
    _speed += increment;
  }

}