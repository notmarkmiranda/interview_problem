$(document).ready(function() {
  disableButton()
  checkFirstName()
  checkLastName()
  checkEmail()
  checkSsn()
  formValidator()
});

var first_name = false
var last_name = false
var email = false
var ssn = false

function formValidator() {
  $("input#user_first_name, input#user_last_name, input#user_email, input#user_social_security_number").on('keyup', function() {
    if(first_name && last_name && email && ssn) {
      enableButton()
    }
  })
}

function disableButton() {
  $("div.form-group > input[type='submit']").prop("disabled", true)
}

function enableButton() {
  $("div.form-group > input[type='submit']").prop("disabled", false)
}

function checkFirstName() {
  $('input#user_first_name').on('keyup', function() {
    if ($('input#user_first_name').val().length > 2) {
      first_name = true
    } else {
      first_name = false
    }
  })
}

function checkLastName() {
  $('input#user_last_name').on('keyup', function() {
    if ($('input#user_last_name').val().length > 2) {
      last_name = true
    } else {
      last_name = false
    }
  })
}

function checkEmail() {
  $('input#user_email').on('keyup', function() {
    email_value = $('input#user_email').val()
    email = isValidEmail(email_value)
  })
}

function checkSsn() {
  $('input#user_social_security_number').on('keyup', function() {
    ssn_value = $('input#user_social_security_number').val()
    ssn = isValidSsn(ssn_value)
  })
}

function isValidSsn(ssn) {
  var regex = /^([0-6]\d{2}|7[0-6]\d|77[0-2])([ \-]?)(\d{2})\2(\d{4})$/
  return regex.test(ssn)
}

function isValidEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
}
