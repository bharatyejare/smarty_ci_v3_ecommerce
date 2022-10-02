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
      
    <section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row">
    {foreach $display_products as $value}
      <div class="col-md-12 col-lg-4 mb-4 mb-lg-0">
        <div class="card">
          <div class="d-flex justify-content-between p-3">
          <a href="products/single_display_product?id={$value['iProductId']}&name={$value['vName']}&price={$value['iPrice']}" target="_blank">
            <p class="lead mb-0">Today's Combo Offer</p>
            <div
              class="bg-info rounded-circle d-flex align-items-center justify-content-center shadow-1-strong"
              style="width: 35px; height: 35px;">
              <p class="text-white mb-0 small">x4</p>
            </div>
          </div>
          <img src={$value['vProductImage']}
            class="card-img-top" alt="Laptop" />
          <div class="card-body">
            <div class="d-flex justify-content-between">
              <p class="small"><a href="#!" class="text-muted">Laptops</a></p>
              <p class="small text-danger"><s>$1099</s></p>
            </div>

            <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0">{$value['vName']}</h5>
              <h5 class="text-dark mb-0">&#8377;{$value['iPrice']}</h5>
            </div>

            <div class="d-flex justify-content-between mb-2">
              <p class="text-muted mb-0">Available: <span class="fw-bold">{$value['iQty']}</span></p>
              <div class="ms-auto text-warning">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
      </a>
      {/foreach}
    </div>
  </div>
</section>
<section style="background-color: #eee;">

  <div class="text-center container py-5">
    <h4 class="mt-4 mb-5"><strong>Kitchen & dining products</strong></h4>
 
    <div class="row">
    {foreach $kitchen_products as $value}
      <div class="col-lg-4 col-md-6 mb-4">
      <a href="products/single_display_product?id={$value['iProductId']}&name={$value['vName']}&price={$value['iPrice']}" target="_blank">
        <div class="card">
        
          <div class="bg-image hover-zoom ripple" data-mdb-ripple-color="light">
            <img src={$value['vProductImage']}
              class="w-100" />
            <a href="#!">
              <div class="mask">
                <div class="d-flex justify-content-start align-items-end h-100">
                  <h5>
                    <span class="badge bg-primary ms-2">New</span><span
                      class="badge bg-success ms-2">Eco</span><span class="badge bg-danger ms-2">-10%</span>
                  </h5>
                </div>
              </div>
              <div class="hover-overlay">
                <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
              </div>
            </a>
          </div>
          <div class="card-body">
            <a href="" class="text-reset">
              <h5 class="card-title mb-3">{$value['vName']}</h5>
            </a>
            
            <h6 class="mb-3">
              <s>$61.99</s><strong class="ms-2 text-danger">&#8377;${$value['iPrice']}</strong>
            </h6>
          </div>
        </div>
      </div>
      </a>
      {/foreach}
    </div>
  </div>
  
</section>
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