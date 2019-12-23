function logout() {
  fetch('/users/sign_out', {
    method: 'DELETE',
    redirect: 'follow',
    credentials: 'include',
    headers: {
      'X-CSRF-Token': $('[name="csrf-token"]')[0].content
    }
  })
  .then(res => window.location.href = '/')
  .catch(err => alert('Error on logout'))
}
