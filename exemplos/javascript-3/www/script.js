var select = document.getElementById("cor_do_texto");

select.onchange = function() {
  var paragrafos = document.getElementsByTagName("p");
  for (var i = 0; i < paragrafos.length; i++) {
    paragrafos[i].style = "color: " + select.value + ";";
  }
}
