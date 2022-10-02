<style>
.vl {
  border-left: 1px solid black;margin-left:50%;
  height: 80px;
}
</style>

{foreach $cart_array as $items}

{block name=head}
<form action="{$form_url}" class="header_search_form clearfix" method="post">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<div class="row">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Added to Cart</h5>
        <p class="card-text">Style name: {$items['name']}</p>
        
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        
        <input type="hidden" name="id" id="product_id" value={$items['id']}>
        <input type="hidden" name="product_price" id="product_price" value={$items['subtotal']}>
        <input type="hidden" name="product_name" id="product_name" value="{$items['name']}">
        <input type="hidden" name="select_qty" id="select_qty" value="{$items['qty']}">
        <div class="vl"><h6 class="card-title">Cart subtotal:  ₹{$items['subtotal']}</h6></div>
        <div style="margin-left:50%;margin-top:-10%;"><button class="btn btn-primary btn-sm" type="submit" id="addtocart">Proceed to checkout({$items['qty']} item)</button><br><a href="single_display_product?id={$items['id']}&name={$items['name']}&price={$items['price']}" class="btn btn-outline-secondary style="margin-top:60px;margin-left:30px;">Go to Cart</a></div>
        <p class="card-text" style="margin-top:-60px;">Your order is eligible for FREE Delivery. <br>Select this option at checkout. Details</p>
      </div>
    </div>
  </div>
</div>
</form>
{/block}
{/foreach}