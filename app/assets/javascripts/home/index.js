function applyCategory(e) {
  if(e.value > 0) window.location.href = "?category=" + e.value
  if(e.value == -1) window.location.href = "/"
}