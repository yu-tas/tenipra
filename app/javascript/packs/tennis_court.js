$("#tennis-court").click(function(e) {
  var posX = e.pageX - $(this).offset().left;
  var posY = e.pageY - $(this).offset().top;
  var marker = $("<div class='marker'></div>").css({
    left: posX,
    top: posY
  });
  $(this).append(marker);
});