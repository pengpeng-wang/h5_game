window.gameResult = function () {
  var str = '我在《飞行棋》游戏中飞行了' + gameS + '米，最佳成绩为' + gameH + '米';
  if (gameS == 0) {
    str = '中途退出了游戏';
  }
  if(gameS > 0 ) {
    str = '我在《飞行棋》游戏中飞行了' + gameS + '米，最佳成绩为' + gameH + '米';
  }
  if (window.injs) {
    window.injs.returnPKGrade(str);
  }
  return str;
};
