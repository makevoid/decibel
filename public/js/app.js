(function() {
  var body;

  body = document.getElementsByTagName("body")[0];

  if (navigator.userAgent.match(/MSIE/)) {
    body.className = "ie";
  }

}).call(this);
