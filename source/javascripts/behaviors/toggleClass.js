$(function() {
  $(document).on("click", "[data-behavior~=toggle-class]", function(e) {
    e.preventDefault();
    var target = $(this);
    var className = target.data("classname");
    target.toggleClass(className);
  });
});
