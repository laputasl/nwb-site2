//get authenticity_token
$("input[name='authenticity_token']").attr("value", $.cookie('authenticity_token'));

// load order details from cookie and render preview
var order = JSON.parse($.cookie('order_details'));

if(order!=null){
  $('div#cartPreview h3 a').attr('href', '/orders/' + order.number + '/edit');

  var preview = $('div#cartPreview table tbody');
  preview.html('');

  $.each(order.line_items, function(i, line_item) {
    preview.append('<tr><td class="right"><a href="/products/' + line_item.permalink + '">' +  line_item.sku.replace("+", " ")  + '</a></td><td>$' + line_item.price + '</td></tr>');
  });

  preview.append('<tr><td class="right">Sub Total</td><td>$' + order.item_total + '</td></tr>');
  preview.append('<tr><td class="right">Shipiing</td><td>$' + order.shipping_total + '</td></tr>');
  preview.append('<tr><td class="right">Total</td><td><strong>$' + order.total + '</strong></td></tr>');
}

if($.cookie('current_user_id')!=""){
  $("ul#miscNav a[href='/login']").html("Log Out").attr("href", "/logout");
  $("a#navAccount").attr("href", "/users/" + $.cookie('current_user_id'));
}