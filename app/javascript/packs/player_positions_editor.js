import $ from 'jquery';
import 'jquery-ui-dist/jquery-ui';

$(function() {
  $(".player").draggable({
    containment: "#player-positions-editor",
    stop: function(event, ui) {
      // ドラッグが終了したら、プレイヤーのポジションを保存
      var positions = [];
      $(".player").each(function() {
        var player = $(this);
        positions.push({
          id: player.data("id"),
          x: player.position().left,
          y: player.position().top
        });
      });
      $("#player-positions").val(JSON.stringify(positions));
    }
  });
});
