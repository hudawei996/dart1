
//以下dart内容,来自URL
//https://www.dartcn.com/guides/language/language-tour

//dart 语言是强类型语言，
// 没法将一个已声明具体变量类型的变量
//  赋值为另外一个无继承关系的变量函数

// 多行注释和单行注释
// 以分号结尾且必需有
// 容许定义顶层函数
// 最基础的数据类型之一：String，其它的内置数据类型还有 int 、double、list、map 等
// 类型推导。经过关键字 var 来声明变量而无需指明变量类型
// 一种方便的插入变量值的方式，字符串字面值：$msg
// 应用程序的入口：main 函数


//
// 例如，第二行代码是会致使报错的，
// 没法将一个 double 值赋值到一个 int 类型变量上学

main() {

  //一,变量
  //与 Java 语言相比，dart 语言包含的
  // 相似的基本数据类型只有 int 和 double 两种，
  // 且这两种类型的变量均是对象，其默认值均为 null

  //不给初始值会报错:lib/number_my.dart:26:9:
  // Error: Late variable 'value' without initializer
  // is definitely unassigned.
  //   print(value); //null

  // int value;
  int value = 0;
  print(value); //null

  value = 10;
  print(value); //10

  var varValue = 20;
  print(varValue); //20

  int intValue = 20;
  // intValue = 20.0; //error

  //但因为 int 和 double 类都是 num 类的子类，
  // 因此如下操做是合法的ui
  num numValue = 10;
  print(numValue.runtimeType); //int
  numValue = 10.22;
  print(numValue.runtimeType); //double
  //不知道数字的类型是什么类型的 可以笼统的使用num类来定义,
  // 赋值的时候也不会产生什么问题

  var x = 1;
  var hex = 0xDEADBEEF;

  var y = 1.1;
  var exponents = 1.42e5;

  //在 2.1 之前，在 double 上下文中使用 int 字面量是错误的。
  double z = 1; // 相当于 double z = 1.0.

  //字符串转num类型,num转字符串
  // String -> int
  var one = int.parse('1');
  assert(one == 1);

// String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

// int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

// double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  //位运算操作
  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 >> 1) == 1); // 0011 >> 1 == 0001
  assert((3 | 4) == 7); // 0011 | 0100 == 0111

  //数字类型字面量是编译时常量。
  // 在算术表达式中，只要参与计算的因子是编译时常量，
  // 那么算术表达式的结果也是编译时常量。
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;

  /**
   * String
   *   Dart 字符串是一组 UTF-16 单元序列。
   *   字符串通过单引号或者双引号创建。
   */
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  var s = 'string interpolation';

  assert('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, ' +
          'which is very handy.');
  assert('That deserves all caps. ' +
      '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. ' +
          'STRING INTERPOLATION is very handy!');

  //提示： == 运算符用来测试两个对象是否相等。
  // 在字符串中，如果两个字符串包含了相同的编码序列，
  // 那么这两个字符串相等。 units.

  //可以使用 + 运算符来把多个字符串连接为一个，
  // 也可以把多个字面量字符串写在一起来实现字符串连接：
  var s11 = 'String '
      'concatenation'
      " works even over line breaks.";
  assert(s11 ==
      'String concatenation works even over '
          'line breaks.');
  assert(s11 ==  'String concatenation works even over line breaks.');

  var s21 = 'The + operator ' + 'works, as well.';
  assert(s21 == 'The + operator works, as well.');


  /**
   * 使用连续三个单引号或者三个双引号实现多行字符串对象的创建：
   */
    var s12 = '''
  You can create
  multi-line strings like this one.
  ''';

    var s22 = """This is also a
  multi-line string.""";

    //使用 r 前缀，可以创建 “原始 raw” 字符串：
  var ss = r"In a raw string, even \n isn't special.";


  /**
   * Set
      在 Dart 中 Set 是一个元素唯一且无需的集合。
      Dart 为 Set 提供了 Set 字面量和 Set 类型。
   */
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  var names = <String>{};
  Set<String> names1 = {};//这样也是可以的
  var names2 = {};//这样会创建一个Map,而不是Set

  //使用 add() 或 addAll() 为已有的 Set 添加元素：
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);

  //使用 .length 来获取 Set 中元素的个数：
  var elements1 = <String>{};
  elements1.add('fluorine');
  elements1.addAll(halogens);
  assert(elements1.length == 5);

  //在 Set 字面量前增加 const ，来创建一个编译时 Set 常量：
  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
// constantSet.add('helium');
// Uncommenting this causes an error.

  /**
   ** Map
    *  通常来说， Map 是用来关联 keys 和 values 的对象。
    *  keys 和 values 可以是任何类型的对象。
    *  在一个 Map 对象中一个 key 只能出现一次。
    *  但是 value 可以出现多次。
    *  Dart 中 Map 通过 Map 字面量 和 Map 类型来实现。
    *
    *  下面是使用 Map 字面量的两个简单例子：
   */
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  // var gifts1 = {};//也可以这么简写
  var gifts1 = Map();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var nobleGases1 = Map();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  var gifts2 = {'first': 'partridge'};
  // Add a key-value pair
  gifts['fourth'] = 'calling birds';

  //类似 JavaScript ，从一个 Map 中获取一个 value：
  var gifts3 = {'first': 'partridge'};
  assert(gifts3['first'] == 'partridge');

  //如果 Map 中不包含所要查找的 key，那么 Map 返回 null：
  var gifts4 = {'first': 'partridge'};
  assert(gifts4['fifth'] == null);

  //使用 .length 函数获取当前 Map 中的 key-value 对数量：
  var gifts5 = {'first': 'partridge'};
  gifts5['fourth'] = 'calling birds';
  assert(gifts5.length == 2);

  /**
   * Rune
   *  在 Dart 中， Rune 用来表示字符串中的 UTF-32 编码字符。
   *  Unicode 定义了一个全球的书写系统编码，
   *  系统中使用的所有字母，数字和符号都对应唯一的数值编码。
   *  由于 Dart 字符串是一系列 UTF-16 编码单元，
   *  因此要在字符串中表示32位 Unicode 值需要特殊语法支持。
   *
   *  表示 Unicode 编码的常用方法是，
   *  \uXXXX, 这里 XXXX 是一个4位的16进制数。
   *  例如，心形符号 (♥) 是 \u2665。
   *  对于特殊的非 4 个数值的情况， 把编码值放到大括号中即可。
   *  例如，emoji 的笑脸 (�) 是 \u{1f600}。
   */


  /**
   * 函数
   *  Dart 是一门真正面向对象的语言，
   *  甚至其中的函数也是对象，并且有它的类型 Function 。
   *  这也意味着函数可以被赋值给变量或者作为参数传递给其他函数。
   *  也可以把 Dart 类的实例当做方法来调用。
   *  有关更多信息，参考 Callable classes.
   *
   *  已下是函数实现的示例：
   */
  // bool isNoble(int atomicNumber) {
  //   return _nobleGases[atomicNumber] != null;
  // }

  //简写,和上边写的函数方式 等价
  //bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;

  //=> expr 语法是 { return expr; } 的简写。
  // => 符号 有时也被称为 箭头 语法。

  /**
   * 命名可选参数
   *
   * 调用函数时，可以使用指定命名参数 paramName: value。 例如：
   * enableFlags(bold: true, hidden: false);
   *
   * 义函数是，使用 {param1, param2, …} 来指定命名参数：
   * /// Sets the [bold] and [hidden] flags ...
   *  void enableFlags({bool bold, bool hidden}) {...}
   */

  /**
   * 使用 @required 注释表示参数是 required 性质的命名参数，
   * 该方式可以在任何 Dart 代码中使用（不仅仅是Flutter）。
   *
   * const Scrollbar({Key key, @required Widget child})
   */

  /**
   * 位置可选参数
      将参数放到 [] 中来标记参数是可选的：
   */
  // String say(String from, String msg, [String device]) {
  //   var result = '$from says $msg';
  //   if (device != null) {
  //     result = '$result with a $device';
  //   }
  //   return result;
  // }
  //
  // assert(say('Bob', 'Howdy') == 'Bob says Howdy');
  // assert(say('Bob', 'Howdy', 'smoke signal') ==
  //     'Bob says Howdy with a smoke signal');

  /**
   * 默认参数值
   *
   * 在定义方法的时候，可以使用 = 来定义可选参数的默认值。
   * 默认值只能是编译时常量。
   * 如果没有提供默认值，则默认值为 null。
   *
   * /// 设置 [bold] 和 [hidden] 标志 ...
      void enableFlags({bool bold = false, bool hidden = false}) {...}

      // bold 值为 true; hidden 值为 false.
      enableFlags(bold: true);
   */
  // String say1(String from, String msg,
  //     [String device = 'carrier pigeon', String mood]) {
  //   var result = '$from says $msg';
  //   if (device != null) {
  //     result = '$result with a $device';
  //   }
  //   if (mood != null) {
  //     result = '$result (in a $mood mood)';
  //   }
  //   return result;
  // }
  //
  // assert(say('Bob', 'Howdy') ==
  //     'Bob says Howdy with a carrier pigeon');

  /**
   * list 或 map 可以作为默认值传递。
   * 下面的示例定义了一个方法 doStuff()，
   * 并分别指定参数 list 和 gifts 的默认值。
   */
  void doStuff(
      {
        List<int> list = const [1, 2, 3],
        Map<String, String> gifts = const {
          'first': 'paper',
          'second': 'cotton',
          'third': 'leather'
        }
      }
      ) {
    print('list:  $list');
    print('gifts: $gifts');
  }


  /**
   * main() 函数
   */
  //提示：
  // 下面是 web 应用的 main() 函数：
  //void main() {
  //   querySelector('#sample_text_id')
  //     ..text = 'Click me!'
  //     ..onClick.listen(reverseText);
  // }
  // 以上代码中的 .. 语法为 级联调用 （cascade）。
  // 使用级联调用， 可以简化在一个对象上执行的多个操作。

  /**
   * 函数是一等对象
      一个函数可以作为另一个函数的参数。 例如：
   */
  void printElement(int element) {
    print(element);
  }

  var list = [1, 2, 3];

// 将 printElement 函数作为参数传递。
  list.forEach(printElement);


  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');

  /**
   * 匿名函数
   */

  /// 返回一个函数，返回的函数参数与 [addBy] 相加。
  Function makeAdder(num addBy) {
    return (num i) => addBy + i;
  }

// 创建一个加 2 的函数。
  var add2 = makeAdder(2);

  // 创建一个加 4 的函数。
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);

  // var x1;//简写
  void Function() x1;//函数类型这样写比较好,清晰
  // 比较顶级函数。
  x1 = foo;
  assert(foo == x1);
// 比较静态方法。
  x1 = A.bar;
  assert(A.bar == x1);

  // 比较实例方法。
  var v1 = A(); // A的1号实例
  var w1 = A(); // A的2号实例
  var y1 = w1;
  x1 = w1.baz;

  // 两个闭包引用的同一实例（2号）,
  // 所以它们相等。
  assert(y1.baz == x1);

  // 两个闭包引用的非同一个实例，
  // 所以它们不相等。
  assert(v1.baz != w1.baz);


  /**
   * expr1 ?? expr2
      如果 expr1 是 non-null， 返回 expr1 的值；
      否则, 执行并返回 expr2 的值。

      expr0 ? expr1 : expr2
      和Java一样

      dart中 也有 expr1 ?. expr2
      如果非空往后执行,否则执行?.后边的代码



      kotlin中 空判断和赋值是
      expr1 ?: expr2

      kotlin中 expr1 ?. expr2
      如果非空往后执行,否则执行?.后边的代码

      kotlin没有三位运算符,只能用if else

   */


  /**
   * 级联运算符 (..)
   */
  // querySelector('#confirm') // 获取对象。
  //   ..text = 'Confirm' // 调用成员变量。
  //   ..classes.add('important')
  //   ..onClick.listen((e) => window.alert('Confirmed!'));
//上面的代码等价于：
//   var button = querySelector('#confirm');
//   button.text = 'Confirm';
//   button.classes.add('important');
//   button.onClick.listen((e) => window.alert('Confirmed!'));


  /**
   * 级联运算符可以嵌套，例如：
   *
   * final addressBook = (AddressBookBuilder()
      ..name = 'jenny'
      ..email = 'jenny@example.com'
      ..phone = (PhoneNumberBuilder()
      ..number = '415-555-0100'
      ..label = 'home')
      .build())
      .build();


      在返回对象的函数中谨慎使用级联操作符。
      例如，下面的代码是    错误的：
      var sb = StringBuffer();
      sb.write('foo')
      ..write('bar'); // Error: 'void' 没哟定义 'write' 函数。
      sb.write() 函数调用返回 void，
      不能!!!  在 void 对象上   创建级联操作。

   */


  /**
   * 构造函数,两种写法
   * class Point11 {
      num x =0, y =0;

      //Java方式,不推荐
      Point11(num x, num y) {
      // 还有更好的方式来实现下面代码，敬请关注。
      this.x = x;
      this.y = y;
      }
      }

      //有this方法,推荐
      class Point {
      num x, y;

      // 在构造函数体执行前，
      // 语法糖已经设置了变量 x 和 y。
      Point(this.x, this.y);
      }
   *
   *构造函数不被继承
      子类不会继承父类的构造函数。
      子类不声明构造函数，
      那么它就只有默认构造函数 (匿名，没有参数) 。



      命名构造函数
      使用命名构造函数可为一个类实现多个构造函数，
      也可以使用命名构造函数来更清晰的表明函数意图：
      class Point {
        num x, y;

        Point(this.x, this.y);

        // 命名构造函数
        Point.origin() {
          x = 0;
          y = 0;
        }
      }
   */


  /**
   * 调用父类非默认构造函数
   *
   * 默认情况下，子类的构造函数会自动调用父类的默认构造函数（匿名，无参数）。
   * 父类的构造函数在子类构造函数体开始执行的位置被调用。
   * 如果提供了一个 initializer list （初始化参数列表），
   * 则初始化参数列表在父类构造函数执行之前执行。 总之，执行顺序如下：

      initializer list （初始化参数列表）
      superclass’s no-arg constructor （父类的无名构造函数）
      main class’s no-arg constructor （主类的无名构造函数）
      如果父类中没有匿名无参的构造函数， 则需要手工调用父类的其他构造函数。
      在当前构造函数冒号 (:) 之后，函数体之前，声明调用父类构造函数。
   *
   */
  var emp = Employee.fromJson({});

  // Prints:
  // in Person
  // in Employee
  if (emp is Person44) {
    // Type check
    emp.firstName = 'Bob';
  }
  (emp as Person44).firstName = 'Json';

}


class Person44 {
  String firstName = "";

  Person44.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person44 {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  //说明先执行了,父类的构造方法,然后才执行的子类构造方法
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

class Point11 {
  num x =0, y =0;

  Point11(num x, num y) {
    // 还有更好的方式来实现下面代码，敬请关注。
    this.x = x;
    this.y = y;
  }
}

class Point22 {
  num x, y;

  // 在构造函数体执行前，
  // 语法糖已经设置了变量 x 和 y。
  Point22(this.x, this.y);
}

class Point33 {
  // num x , y;//不可以没有初始值
  num x =0, y=0;

  Point33(this.x, this.y);

  // 命名构造函数
  Point33.origin() {
    x = 0;
    y = 0;
  }
}


void foo() {} // 顶级函数

class A {
  static void bar() {} // 静态方法
  void baz() {} // 示例方法
}