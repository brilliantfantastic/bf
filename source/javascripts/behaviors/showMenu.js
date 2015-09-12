$(function() {
  $(document).on("click", "[data-behavior~=show-menu]", function(e) {
    e.preventDefault();
    var nav = $($(this).data("menu-selector"));
    if (nav.is(":visible")) {
      nav.slideUp();
    } else {
      nav.slideDown();
    }
  });
});
