var HSJsBridge = (function () {
  var EventListener = {};
  var hsJsBridge = {};

// 添加listener事件到EventListener数组
  hsJsBridge.on = function (key, listener) {
    var item = EventListener[key];
    if (!item) {
      item = [];
      EventListener[key] = item;
    }
    item.forEach(function(value) {
      if (value.toString() === listener.toString()) {
        return;
      }
    });
    item.push(listener);
  };

// 根据key删除EventListener数组中listener事件
  hsJsBridge.off = function (key, listener) {
    var item = EventListener[key];
    if (!item) {
      item = [];
      EventListener[key] = item;
    }
    item.forEach(function(value, index) {
      if (value.toString() === listener.toString()) {
        item.splice(index, 1);
        return;
      }
    });
  };

// 处理EventListener数组中的listener事件
  hsJsBridge.chargeSuccess = function (argv) {
    // alert('测试充值函数是否调用');
    var item = EventListener['chargesuccess'];
    if (!item) {
      item = [];
      EventListener['chargesuccess'] = item;
    }
    item.forEach(function(func){
      func(argv);
    })
  };
  return hsJsBridge;
})();

window.HSJsBridge = HSJsBridge;
