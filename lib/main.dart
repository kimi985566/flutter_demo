import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        ///首先，构建标题部分左边栏。将Column（列）放入Expanded中会拉伸该列以使用该行中的所有剩余空闲空间。
        ///设置crossAxisAlignment属性值为CrossAxisAlignment.start，
        ///这会将将列中的子项左对齐。
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              ///将第一行文本放入Container中，然后底部添加8像素填充。
              ///列中的第二个子项（也是文本）显示为灰色。
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          ///标题行中的最后两项是一个红色的星形图标和文字“41”。
          ///将整行放在容器中，并沿着每个边缘填充32像素
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    ///按钮部分包含3个使用相同布局的列 - 上面一个图标，下面一行文本。
    ///该行中的列平均分布行空间， 文本和图标颜色为主题中的primary color，
    ///它在应用程序的build()方法中设置为蓝色
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    ///构建函数将图标直接添加到列（Column）中。将文本放入容器以在文本上方添加填充，将其与图标分开。
    ///通过调用函数并传递icon和文本来构建这些列。
    ///然后在行的主轴方向通过 MainAxisAlignment.spaceEvenly 平均的分配每个列占据的行空间。
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );


    ///将文本放入容器中，以便沿每条边添加32像素的填充。
    ///softwrap属性表示文本是否应在软换行符（例如句点或逗号）之间断开。
    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body: ListView(
          children: [
            ///四列元素中的三个现在已经完成，只剩下图像部分。该图片可以在Creative Commons许可下在线获得，
            ///但是它非常大，且下载缓慢。在步骤0中，您已经将该图像包含在项目中并更新了pubspec文件，
            ///所以现在可以从代码中直接引用它：
            Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
