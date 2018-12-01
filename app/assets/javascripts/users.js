$(document).ready(function() {
  function generate_password(max,min)
  {
      var passwordChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz#@!%&()/";
      var randPwLen = Math.floor(Math.random() * (max - min + 1)) + min;
      var randPassword = Array(randPwLen).fill(passwordChars).map(function(x) { return x[Math.floor(Math.random() * x.length)] }).join('');
      return randPassword;
  }

  $("#generate-password-button").click(function() {
      random_password = generate_password(32, 20);

      $('#generated-password').text("Copy and paste: " + random_password);
  });
});
