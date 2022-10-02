{block name=head}
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
{/block}
{foreach $order_details as $items}
{block name=body}

<section class="vh-100 gradient-custom-2">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-10 col-lg-8 col-xl-6">
        <div class="card card-stepper" style="border-radius: 16px;">
          <div class="card-header p-4">
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="text-muted mb-2"> Order ID <span class="fw-bold text-body">{$items['order_id']}</span></p>
                <p class="text-muted mb-0"> Place On <span class="fw-bold text-body">{$items['created_date']}</span> </p>
              </div>
              <div>
                <h6 class="mb-0"> <a href={$image_url}>Go to Home</a> </h6>
              </div>
            </div>
          </div>
          <div class="card-body p-4">
            <div class="d-flex flex-row mb-4 pb-2">
              <div class="flex-fill">
                <h5 class="bold">{$items['order_name']}</h5>
                <p class="text-muted"> Qt: {$items['qty']} item</p>
                <h4 class="mb-3"> ₹ {$items['amount']} <span class="small text-muted"> via (COD) </span></h4>
                <h2 style="color:blue">Thank You your order successfully placed.</h2>
              </div>
              <div>
                <img class="align-self-center img-fluid"
                  src="{$image_url}{$items['item_image']}" width="250">
              </div>
            </div>
          </div>
          {*<div class="card-footer p-4">
            <div class="d-flex justify-content-between">
              <h5 class="fw-normal mb-0"><a href="#!">Track</a></h5>
              <div class="border-start h-100"></div>
              <h5 class="fw-normal mb-0"><a href="#!">Cancel</a></h5>
              <div class="border-start h-100"></div>
              <h5 class="fw-normal mb-0"><a href="#!">Pre-pay</a></h5>
              <div class="border-start h-100"></div>
              <h5 class="fw-normal mb-0"><a href="#!" class="text-muted"><i class="fas fa-ellipsis-v"></i></a>
              </h5>
            </div>
          </div>*}
        </div>
      </div>
    </div>
  </div>
</section>
{/block}
{/foreach}