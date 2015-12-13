$('document').ready(function() {
  $('.simple-calendar .glyphicon:not(.glyphicon-question-sign)').popover({
    html: true,
    content: function() {
      return $('#calendar-action-buttons').html();
    },
    title: function() {
      return $(this).closest('span').data('date');
    }
  });
   
  var stateToIcon = function(state) {
    switch(state) {
      case "done": return "glyphicon-ok-sign";
      case "suspended": return "glyphicon-hourglass";
      case "not_done": return "glyphicon-remove-sign";
    }
  }

  var sendStateChangeRequest = function(span, habit, state, task) {
    $.ajax({
      type: (task == undefined ? "POST" : "PATCH"),
      url: "habits/" + habit + "/tasks/" + task,
      data: {
        task: {
          state: state,
        }
      },
      success: function() {
        span.find(".glyphicon")
          .removeClass()
          .addClass("glyphicon")
          .addClass(stateToIcon(state));
        span.find(".glyphicon").popover('hide');
      }
    });
  }

  var changeState = function(span, state) {
    var habit = span.data('habit');
    var task = span.data('task');
    sendStateChangeRequest(span, habit, state, task); 
  }

  $('body').on('click', '.popover .done-action', function() {
    changeState($(this).closest("span"), "done"); 
  });

  $('body').on('click', '.popover .suspended-action', function() {
    changeState($(this).closest("span"), "suspended"); 
  });

  $('body').on('click', '.popover .not-done-action', function() {
    changeState($(this).closest("span"), "not_done"); 
  });
});
