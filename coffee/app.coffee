# browser detection

body = document.getElementsByTagName("body")[0]

if navigator.userAgent.match(/MSIE/)
  body.className = "ie"