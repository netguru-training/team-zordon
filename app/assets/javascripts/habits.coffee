$(document).ready ->
  days_pick = $('#days_pick')
  days_pick.select2()

  $('#select-all').on("click", () -> days_pick.val(["0", "1", "2", "3", "4", "5", "6"]).trigger("change"))
  $('#deselect-all').on("click", () -> days_pick.val([]).trigger("change"))
  $('#week').on("click", () -> days_pick.val(["1", "2", "3", "4", "5"]).trigger("change"))
  $('#weekend').on("click", () -> days_pick.val(["0", "6"]).trigger("change"))
  $('#every-odd-day').on("click", () -> days_pick.val(["1", "3", "5"]).trigger("change"))
  $('#every-even-day').on("click", () -> days_pick.val(["0", "2", "4", "6", ]).trigger("change"))
