$(document).ready ->
  days_pick = $('#days_pick')
  days_pick.select2()

  $('#select-all').on("click", () -> days_pick.val(["0", "1", "2", "3", "4", "5", "6"]).trigger("change"))
  $('#deselect-all').on("click", () -> days_pick.val([]).trigger("change"))
