$( document ).ready(function() {
  bindEventListeners();
});

function bindEventListeners() {
  addToCart();
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
      $('.cart-count').text(successResponse);
      $(".cart-button").fadeIn(100).fadeOut(100).fadeIn(100);
    });

    ajaxRequest.fail(function(failureResponse) {
      $(".cart-button").fadeIn(100).fadeOut(100).fadeIn(100).fadeIn(100).fadeOut(100).fadeIn(100);
      $(".cart-button").removeClass('btn-success').addClass('btn-danger');
    });
  });
};
