function rateMovie(id, rate) {
  fetch('/movies/' + id + '/?rate=' + rate, {
    method: 'PATCH',
    credentials: 'include',
    headers: {
      'X-CSRF-Token': $('[name="csrf-token"]')[0].content
    }
  })
  .then(res => {
    res.json()
    .then(data => {
      document.getElementById('rate-' + id).style = "display: none;"
      document.getElementById('rating-' + id).textContent=data.raiting;
      $('#exampleModal'+id).modal('hide');
      document.getElementById('rate-open' + id).style = "display: none;"
    })
  })
  .catch(err => alert('unable to rate'))
}