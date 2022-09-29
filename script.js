 window.onload = function() {
  elementos = document.querySelectorAll("a");
  elementos.forEach(
    function (currentValue) {
      if (currentValue.classList.length == 0) {
        currentValue.target = "_blank"
      }
    }
  );
  elementos = document.querySelectorAll("a.toc-action");
  for (let item of elementos) {
    item.target = "_blank";
  }
  elementos = document.querySelectorAll(".sidebar-title > a");
  for (let item of elementos) {
    item.target = "_self";
  }
}
