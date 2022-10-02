{block name=head}
<style>
.checked {
            color : yellow;
            font-size : 20px;
        }
        .unchecked {
            font-size : 20px;
        }
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<main role="main">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
       <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/slider.jpg" class="d-block w-100" alt="images">
    </div>
    <div class="carousel-item">
      <img src="images/toys.jpg" class="d-block w-100" alt="images">
    </div>
    <div class="carousel-item">
      <img src="images/home_logo.jpg" class="d-block w-100" alt="images">
    </div>
  </div>
 <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>
</div>
{*<div ><strong>Brands</strong></div>*}
      <h2 style="margin-left:100px;">RESULTS</h2>
      <div id="hide_data">
    {foreach $display_products as $value}
    
    <div class="container" >
    <div class="row">
    <div class="col-md-4">
<div><a href="products/single_display_product?id={$value['id']}&name={$value['name']}&price={$value['price']}"><img src={$value['item_image']} style="height:30%;weight:30%;" title="laptop_image"/>
</div>
<div><h2>{$value['name']}</h2></div>
<div> <span class = "fa fa-star checked"></span>
        <span class = "fa fa-star checked"></span>
        <span class = "fa fa-star checked"></span>
        <span class = "fa fa-star checked"></span>
        <!-- To display unchecked star rating icons -->
        <span class = "fa fa-star unchecked"></span></div>
<div><h2>{$value['price']}</h2></div>
    <div>
FREE Delivery by Amazon
    </div></a>
    </div>
</div>
</div>
{/foreach}
</div>

      <div class="container">
        <!-- Example row of columns -->
        <div class="row">
          <div class="col-md-4">
          
          <div><img id="product_img" style="height:10%;weight:10%;" title="laptop_image"/></div>
            <a href="" ><div ><h2 id="product_name" style="margin-left:80%;margin-top:-35%;"></h2></div></a>
            <div id="price" style="margin-left:80%;"></div>
          </div>
        </div>
     
        <hr>

      </div> <!-- /container -->

    </main>
    {/block}