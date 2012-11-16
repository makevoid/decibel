(function() {
  var body, gal_simple, resize_gallery;

  body = document.getElementsByTagName("body")[0];

  if (navigator.userAgent.match(/MSIE/)) {
    body.className = "ie";
  }

  resize_gallery = function(element) {
    var height;
    height = $("." + element + " img:first").height();
    if (height) {
      return $("." + element).height(height);
    }
  };

  gal_simple = {
    photos: []
  };

  window.gal_simple = gal_simple;

  gal_simple.photos_imgs = function() {
    return $(".gallery_simple img");
  };

  gal_simple.assign_classes = function() {
    $(this.photos[0]).addClass("pos0");
    $(this.photos[1]).addClass("pos1");
    $(this.photos[2]).addClass("pos2");
    $(this.photos[3]).addClass("pos3");
    return $(this.photos[4]).addClass("pos4");
  };

  gal_simple.frame = function() {
    var element,
      _this = this;
    this.photos_imgs().each(function(id, el) {
      return $(el).removeClass();
    });
    element = this.photos.shift();
    this.photos.push(element);
    return this.assign_classes();
  };

  gal_simple.animate_frame = function() {
    var _this = this;
    return setTimeout(function() {
      _this.frame();
      return _this.animate_frame();
    }, 8000);
  };

  gal_simple.animate = function() {
    return this.animate_frame();
  };

  $(function() {
    gal_simple.photos = $.makeArray(gal_simple.photos_imgs());
    gal_simple.animate();
    resize_gallery("gallery_simple");
    setTimeout(function() {
      return resize_gallery("gallery_simple");
    }, 100);
    setTimeout(function() {
      return resize_gallery("gallery_simple");
    }, 500);
    setTimeout(function() {
      return resize_gallery("gallery_simple");
    }, 1500);
    setTimeout(function() {
      return resize_gallery("gallery_simple");
    }, 5000);
    return $(window).resize(function() {
      return resize_gallery("gallery_simple");
    });
  });

}).call(this);
