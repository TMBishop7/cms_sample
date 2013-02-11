
//-----------------------------------------------------------------
// Attention: This functionality is not compatible with JQuery 1.9+
//-----------------------------------------------------------------


// iOS Topbar color (RGB)

function barIosPreview() {
  var color = document.getElementById('ios_topbar_rgb_color').value;
  if (color.length == 0) {
    document.getElementById('topbar-container').style.backgroundColor = "rgb(0,0,0)";
  } else {
    document.getElementById('topbar-container').style.backgroundColor = color;
  }
}

function createIosPicker() { 
  $("#ios_topbar_rgb_color").spectrum({ 
    preferredFormat: "rgb",
    showInput: true,
    change: function() {
      barIosPreview();
    }
  });
}


// Android Topbar color (HEX to HEX)

function barAndroidPreview() {
  var topColor = document.getElementById('android_topbar_top_hex_color').value;
  var bottomColor = document.getElementById('android_topbar_bottom_hex_color').value;
  var dTop = "#424242";
  var dBottom = "#222222";
  if (topColor.length == 0 && bottomColor.length == 0) {
    doBack(dTop, dBottom);
  } else if (topColor.length != 0 && bottomColor.length == 0) {
    doBack(topColor, dBottom);
  } else if (topColor.length == 0 && bottomColor.length != 0) {
    doBack(dTop, bottomColor);
  } else if (topColor.length != 0 && bottomColor.length != 0) {
    doBack(topColor, bottomColor);
  } else { 
    alert("Boolean Failed"); 
  }
}

function doBack(top, bottom) {
  if ($.browser.webkit && parseInt($.browser.version.substr(0,2)) < 53) {
    document.getElementById('android-topbar-container').style.background = "-webkit-gradient(linear, left top, left bottom, color-stop(0%,"+ top +"), color-stop(100%, "+ bottom +"))";
  } else if ($.browser.webkit && parseInt($.browser.version.substr(0,2)) >= 53) {
    document.getElementById('android-topbar-container').style.background = "-webkit-linear-gradient(top, "+ top +", "+ bottom +")";
  } else if ($.browser.msie && parseInt($.browser.version) >= 10) {
    document.getElementById('android-topbar-container').style.background = "-ms-linear-gradient(top, "+ top +", "+ bottom +")";
  } else if ($.browser.msie && parseInt($.browser.version) < 10) {
    document.getElementById('android-topbar-container').style.background = "filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='"+ top +"', endColorstr='"+ bottom +"',GradientType=0 );";
  } else if ($.browser.mozilla && $.browser.version >= '1.9.2') {
    document.getElementById('android-topbar-container').style.background = "-moz-linear-gradient(top, "+ top +", "+ bottom +")";
  } else if ($.browser.opera) {
    document.getElementById('android-topbar-container').style.background = "-o-linear-gradient(top, "+ top +", "+ bottom +")";
  } else {
    document.getElementById('android-topbar-container').style.background = "linear-gradient(to bottom, "+ top +", "+ bottom +")";
  }
}

function createAndroidPicker() { 
  $("#android_topbar_top_hex_color").spectrum({ 
    preferredFormat: "hex",
    showInput: true,
    change: function() {
      barAndroidPreview();
    }
  });
  $("#android_topbar_bottom_hex_color").spectrum({ 
    preferredFormat: "hex",
    showInput: true,
    change: function() {
      barAndroidPreview();
    }
  });
}


// Mobile Web Topbar color (RGB)

function barWebPreview() {
  var color = document.getElementById('mobile_web_topbar_rgb_color').value;
  if (color.length == 0) {
    document.getElementById('topbar-container').style.backgroundColor = "rgb(0,0,0)";
  } else {
    document.getElementById('topbar-container').style.backgroundColor = color;
  }
}

function createWebPicker() { 
  $("#mobile_web_topbar_rgb_color").spectrum({ 
    preferredFormat: "rgb",
    showInput: true,
    change: function() {
      barWebPreview();
    }
  });
}

