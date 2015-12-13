$('document').ready(function() {
  $('.simple-calendar .add-task').popover({
    html: true,
    content: function() {
      return $('#calendar-action-buttons').html();
    },
    title: function() {
      return $(this).data('date');
    }
  });
   
  $('body').on('click', '.popover .done-action', function() {
    var date = $(this).parents("div.popover").find(".popover-title").text();
    console.log(date);
  });
});
