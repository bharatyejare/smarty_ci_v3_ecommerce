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
{foreach $display_products as $value}
  <section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row">
      <div class="col-md-12 col-lg-4 mb-4 mb-lg-0">
        <div class="card">
          <div class="d-flex justify-content-between p-3">
            <p class="lead mb-0">Today's Combo Offer</p>
            <div
              class="bg-info rounded-circle d-flex align-items-center justify-content-center shadow-1-strong"
              style="width: 35px; height: 35px;">
              <p class="text-white mb-0 small">x4</p>
            </div>
          </div>
          <img src="images/bag.jpg"
            class="card-img-top" alt="Laptop" />
          <div class="card-body">
            <div class="d-flex justify-content-between">
              <p class="small"><a href="#!" class="text-muted">Laptops</a></p>
              <p class="small text-danger"><s>$1099</s></p>
            </div>

            <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0">HP Notebook</h5>
              <h5 class="text-dark mb-0">$999</h5>
            </div>

            <div class="d-flex justify-content-between mb-2">
              <p class="text-muted mb-0">Available: <span class="fw-bold">6</span></p>
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
      <div class="col-md-6 col-lg-4 mb-4 mb-md-0">
        <div class="card">
          <div class="d-flex justify-content-between p-3">
            <p class="lead mb-0">Today's Combo Offer</p>
            <div
              class="bg-info rounded-circle d-flex align-items-center justify-content-center shadow-1-strong"
              style="width: 35px; height: 35px;">
              <p class="text-white mb-0 small">x2</p>
            </div>
          </div>
          <img src="images/laptop_hp.jpeg "
            class="card-img-top" alt="Laptop" />
          <div class="card-body">
            <div class="d-flex justify-content-between">
              <p class="small"><a href="#!" class="text-muted">Laptops</a></p>
              <p class="small text-danger"><s>$1199</s></p>
            </div>

            <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0">HP Envy</h5>
              <h5 class="text-dark mb-0">$1099</h5>
            </div>

            <div class="d-flex justify-content-between mb-2">
              <p class="text-muted mb-0">Available: <span class="fw-bold">7</span></p>
              <div class="ms-auto text-warning">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-6 col-lg-4 mb-4 mb-md-0">
        <div class="card">
          <div class="d-flex justify-content-between p-3">
            <p class="lead mb-0">Today's Combo Offer</p>
            <div
              class="bg-info rounded-circle d-flex align-items-center justify-content-center shadow-1-strong"
              style="width: 35px; height: 35px;">
              <p class="text-white mb-0 small">x3</p>
            </div>
          </div>
          <img src="images/cart.svg"
            class="card-img-top" alt="Gaming Laptop" />
          <div class="card-body">
            <div class="d-flex justify-content-between">
              <p class="small"><a href="#!" class="text-muted">Laptops</a></p>
              <p class="small text-danger"><s>$1399</s></p>
            </div>

            <div class="d-flex justify-content-between mb-3">
              <h5 class="mb-0">Toshiba B77</h5>
              <h5 class="text-dark mb-0">$1299</h5>
            </div>

            <div class="d-flex justify-content-between mb-2">
              <p class="text-muted mb-0">Available: <span class="fw-bold">5</span></p>
              <div class="ms-auto text-warning">
                <i class="fa fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
{/foreach}
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