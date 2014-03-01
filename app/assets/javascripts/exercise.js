$(document).ready(function() {
  $('#exercise-text').keyup(function(event) {
    if (event.keyCode == 13) {
      this.form.submit(".hidden");
      return false;
    }
  })
});