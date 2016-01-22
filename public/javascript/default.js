$( document ).ready(function() {
  bindEventListeners();
});

function bindEventListeners() {
  addToCart();
  deleteFromCart();
};

function addToCart() {
  $('.add-to-cart-form').on('submit', function(event){
    event.preventDefault();

    var ajaxRequest = $.ajax({
      url: "/cart",
      type: 'POST',
      data: $(this).serialize()
    })

    ajaxRequest.done(function(successResponse) {
      if (parseInt(successResponse)){
        $('.cart-count').text(successResponse);
        $(".cart-button").fadeIn(100).fadeOut(100).fadeIn(100);
      }else {
        $( '.navbar' ).append(successResponse);
      }
    });

    ajaxRequest.fail(function(failureResponse) {
      $(".cart-button").fadeIn(100).fadeOut(100).fadeIn(100).fadeIn(100).fadeOut(100).fadeIn(100);
      $(".cart-button").removeClass('btn-success').addClass('btn-danger');
      console.log(failureResponse)
    });
  });
};

function deleteFromCart() {
  $('.delete-from-cart-form').on('submit', function(event){
    event.preventDefault();
    var removeButton = this;

    var ajaxRequest = $.ajax({
      url: "/cart",
      type: 'DELETE',
      data: $(this).serialize()
    })

    ajaxRequest.done(function(successResponse) {
      console.log(successResponse);
      $(removeButton).closest('tr').fadeOut(500);
    });

    ajaxRequest.fail(function(failureResponse) {
      $("#remove-from-cart").fadeIn(100).fadeOut(100).fadeIn(100).fadeIn(100).fadeOut(100).fadeIn(100);
      $("#remove-from-cart").removeClass('btn-success').addClass('btn-danger');
    });
  });
};
