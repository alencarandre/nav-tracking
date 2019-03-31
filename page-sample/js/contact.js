(function(navTracking) {
  const onSubmit = function(ev) {
    ev.preventDefault();
    ev.stopPropagation();

    const name = $('form#contact input#name').val();
    const email = $('form#contact input#email').val();

    navTracking
      .contact
      .submit(name, email)
      .then(function(contact) {
        toastr.success('Success on send your contact. Thank you!');
      }).catch(function(message) {
        toastr.error(message.error);
      })

    return false;
  }

  $(document).on('submit', 'form#contact', onSubmit)
})(window.NavTracking);
