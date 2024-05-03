import 'package:flutter/material.dart'; // 导入Flutter Material包
import 'package:flutter/services.dart'; // 导入Flutter系统服务包
import 'package:introduction_screen/introduction_screen.dart'; // 导入引导屏幕包

void main() => runApp(const App()); // 主函数

class App extends StatelessWidget {
  // 应用程序类
  const App({Key? key}) : super(key: key); // 构造函数

  @override
  Widget build(BuildContext context) {
    // 构建函数
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      // 设置状态栏样式
      statusBarColor: Colors.transparent, // 设置状态栏为透明
      statusBarIconBrightness: Brightness.light, // 设置状态栏图标为白色
    ));

    return MaterialApp(
      // 返回MaterialApp小部件
      title: 'Introduction screen', // 标题
      debugShowCheckedModeBanner: false, // 禁用调试横幅
      theme: ThemeData(
        // 应用主题
        primarySwatch: Colors.blue, // 主题色为蓝色
        useMaterial3: true, // 使用Material3
      ),
      home: const OnBoardingPage(), // 主页为引导页
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  // 引导页类
  const OnBoardingPage({Key? key}) : super(key: key); // 构造函数

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState(); // 创建状态
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  // 引导页状态类
  final introKey = GlobalKey<IntroductionScreenState>(); // 引导屏幕的全局键

  void _onIntroEnd(BuildContext context) {
    // 引导结束处理函数
    Navigator.of(context).pushReplacement(
      // 替换导航路由
      MaterialPageRoute(builder: (_) => const HomePage()), // 跳转到主页
    );
  }

  Widget _buildFullscreenImage(int index) {
    // 构建全屏图像
    return Image.asset(
      // 图像小部件
      'assets/$index.jpg', // 图像路径
      fit: BoxFit.cover, // 图像填充方式
      height: double.infinity, // 高度充满屏幕
      width: double.infinity, // 宽度充满屏幕
      alignment: Alignment.center, // 图像居中对齐
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    // 构建图像
    return Image.asset('assets/$assetName', width: width); // 图像小部件
  }

  @override
  Widget build(BuildContext context) {
    // 构建函数
    const bodyStyle = TextStyle(fontSize: 19.0, color: Colors.white); // 正文样式

    var pageDecoration = PageDecoration(
      // 页面装饰
      titleTextStyle: TextStyle(
          // 标题文本样式
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: Colors.white),
      bodyTextStyle: bodyStyle, // 正文文本样式
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0), // 正文内边距
      pageColor: null, // 页面颜色为null
      boxDecoration: BoxDecoration(
        // 盒子装饰
        color: Colors.black.withOpacity(0.5), // 背景颜色为半透明黑色
        borderRadius: BorderRadius.circular(10), // 圆角
      ),
      imagePadding: EdgeInsets.zero, // 图像内边距
    );

    return IntroductionScreen(
      // 引导屏幕小部件
      key: introKey, // 全局键
      globalBackgroundColor: Colors.white, // 全局背景颜色
      allowImplicitScrolling: true, // 允许隐式滚动
      autoScrollDuration: 5000, // 自动滚动持续时间
      infiniteAutoScroll: true, // 无限自动滚动
      pages: [
        // 页面列表
        PageViewModel(
          // 页面视图模型
          title: "完全背景图", // 标题
          body: "完全背景图.\n\n完全背景图.完全背景图.", // 正文
          image: _buildFullscreenImage(1), // 图像
          decoration: pageDecoration.copyWith(
            // 页面装饰
            fullScreen: true, // 全屏
            bodyFlex: 2, // 正文弹性比例
            imageFlex: 3, // 图像弹性比例
          ),
        ),
        PageViewModel(
          // 页面视图模型
          title: "完全背景图", // 标题
          body: "完全背景图.\n\n完全背景图.完全背景图.", // 正文
          image: _buildFullscreenImage(2), // 图像
          decoration: pageDecoration.copyWith(
            // 页面装饰
            fullScreen: true, // 全屏
            bodyFlex: 2, // 正文弹性比例
            imageFlex: 3, // 图像弹性比例
          ),
        ),
        PageViewModel(
          // 页面视图模型
          title: "完全背景图", // 标题
          body: "完全背景图.\n\n完全背景图.完全背景图.", // 正文
          image: _buildFullscreenImage(3), // 图像
          decoration: pageDecoration.copyWith(
            // 页面装饰
            fullScreen: true, // 全屏
            bodyFlex: 2, // 正文弹性比例
            imageFlex: 3, // 图像弹性比例
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context), // 完成时的回调函数
      done: const Text('开始使用', // 完成按钮文本
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.cyanAccent)),
      showNextButton: true, // 显示下一个按钮
      next: const Icon(
        // 下一个按钮
        Icons.arrow_forward,
        color: Colors.cyanAccent, // 图标颜色
      ),
      showSkipButton: true, // 显示跳过按钮
      skip: const Text(
        // 跳过按钮文本
        '跳过',
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.cyanAccent),
      ),
      onSkip: () => _onIntroEnd(context), // 跳过时的回调函数
      curve: Curves.fastLinearToSlowEaseIn, // 动画曲线
      controlsMargin: const EdgeInsets.all(16), // 控制按钮外边距
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0), // 控制按钮内边距
      dotsDecorator: const DotsDecorator(
        // 点装饰
        size: Size(10.0, 10.0), // 大小
        color: Colors.white, // 颜色
        activeSize: Size(22.0, 10.0), // 激活大小
        activeShape: RoundedRectangleBorder(
          // 激活形状
          borderRadius: BorderRadius.all(Radius.circular(25.0)), // 圆角
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  // 主页类
  const HomePage({Key? key}) : super(key: key); // 构造函数

  void _onBackToIntro(BuildContext context) {
    // 返回引导页函数
    Navigator.of(context).pushReplacement(
      // 替换导航路由
      MaterialPageRoute(builder: (_) => const OnBoardingPage()), // 跳转到引导页
    );
  }

  @override
  Widget build(BuildContext context) {
    // 构建函数
    return Scaffold(
      // 返回Scaffold小部件
      appBar: AppBar(title: const Text('Home')), // 顶部应用栏
      body: Center(
        // 居中对齐
        child: Column(
          // 列布局
          mainAxisSize: MainAxisSize.min, // 主轴尺寸最小
          children: [
            const Text("This is the screen after Introduction"), // 文本
            const SizedBox(height: 16.0), // 间隔
            ElevatedButton(
              // 高程按钮
              onPressed: () => _onBackToIntro(context), // 按下时的回调函数
              child: const Text('Back to Introduction'), // 按钮文本
            ),
          ],
        ),
      ),
    );
  }
}
