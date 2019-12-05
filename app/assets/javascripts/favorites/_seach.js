$(function(){
  $fileField = $('#file')
 
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field");
 
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });

  $('select[name=sort_order]').change(function() {

    var this_value = $(this).val();
    if (this_value == "created_at_desc") {
      html = "&sort=created_at+desc"
    } else if (this_value == "created_at_asc") {
      html = "&sort=created_at+asc"
    } else if (this_value == "links_count_desc") {
      html = "&sort=links_count+desc"
    } else if (this_value == "links_count_asc") {
      html = "&sort=links_count+asc"
    } else {
      html = ""
    };
    var current_html = window.location.href;
    if (location['href'].match(/&sort=*.+/) != null) {
      var remove = location['href'].match(/&sort=*.+/)[0]
      var current_html = current_html.replace(remove, '')
    };
    window.location.href = current_html + html
  });
  $(function () {
    if (location['href'].match(/&sort=*.+/) != null) {
      if ($('select option[selected=selected]')) {
        $('select option:first').prop('selected', false);
      }

      var selected_option = location['href'].match(/&sort=*.+/)[0].replace('&sort=', '');

      if(selected_option == "created_at+desc") {
        var sort = 1
      } else if (selected_option == "created_at+asc") {
        var sort = 2
      } else if (selected_option == "links_count+desc") {
        var sort = 3
      } else if (selected_option == "links_count+asc") {
        var sort = 4
      }

      var add_selected = $('select[name=sort_order]').children()[sort]
      $(add_selected).attr('selected', true)
    }
  });
});