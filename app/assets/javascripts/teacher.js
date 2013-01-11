$(document).ready(function() {
  var limit = 3;
  var errors = "At least 3 chars required...";
  var checking = 'Verifying if email already exists';

  $('input#teacher_email').blur(function() {
    if ($('input#teacher_email').val().length < limit) {
      $('div#verify_result').html(errors);
    } else {
      $('div#verify_result').html(checking);
      verify_if_exists();
    }
  });
});

function verify_if_exists() {
  var email = $('input#teacher_email').val();
  $.post('/verify_email', {email: email},
    function(data){
        var response = data; 
        $('div#verify_result').html(response.message);
    });

}

