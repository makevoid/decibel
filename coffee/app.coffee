# browser detection

body = document.getElementsByTagName("body")[0]

if navigator.userAgent.match(/MSIE/)
  body.className = "ie"


# simple gallery

resize_gallery = (element) ->
  height = $(".#{element} img:first").height()
  $(".#{element}").height height if height


gal_simple = {
  photos: []
}
window.gal_simple = gal_simple

gal_simple.photos_imgs = ->
  $(".gallery_simple img")

gal_simple.assign_classes = ->
  $(this.photos[0]).addClass "pos0"
  $(this.photos[1]).addClass "pos1"
  $(this.photos[2]).addClass "pos2"
  $(this.photos[3]).addClass "pos3"
  $(this.photos[4]).addClass "pos4"

gal_simple.frame = ->
  this.photos_imgs().each (id, el) =>
    $(el).removeClass()
  element = this.photos.shift()
  this.photos.push(element)
  this.assign_classes()

gal_simple.animate_frame = ->
  setTimeout =>
    this.frame()
    this.animate_frame()
  , 8000# 2000

gal_simple.animate = ->
  this.animate_frame()

$ ->
  gal_simple.photos = $.makeArray gal_simple.photos_imgs()
  gal_simple.animate()

  resize_gallery "gallery_simple"
  # todo jquery-imagesloaded
  setTimeout ->
    resize_gallery "gallery_simple"
  , 100
  setTimeout ->
    resize_gallery "gallery_simple"
  , 500
  setTimeout ->
    resize_gallery "gallery_simple"
  , 1500
  setTimeout ->
    resize_gallery "gallery_simple"
  , 5000

  $(window).resize ->
    resize_gallery "gallery_simple"