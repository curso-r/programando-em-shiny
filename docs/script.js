remover_target_blank = function() {
  console.log(100);
  elementos = document.querySelectorAll("a.nav-link, a.sidebar-link, a.footnote-back, a.footnote-ref, #quarto-search-results a, a.pagination-link");
  for (let item of elementos) {
    item.target = "_self";
  }
}
