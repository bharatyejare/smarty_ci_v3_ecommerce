{block name=head}
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
 <link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
  {/block}
  {block name=body}
  <div class="image_selected" ><img src="{$image_url}" alt="" style="height:10%;width:10%;margin-left:45%;"></div>
<form class="" action="{$search_url}" method="post" >
<section class="vh-100 bg-image">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Sign in</h2>

                 <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3cg">Email or mobile phone number</label>
                  <input type="emailormobile_no" id="form3Example3cg" class="form-control" name="emailormobile_no"/>
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example4cg">Password</label>
                  <input type="password" id="form3Example4cg" class="form-control" name="password"/>
                  
                </div>

                <div class="form-check d-flex justify-content-center mb-5">
                  We will send you a text to verify your phone.
                  Message and Data rates may apply.
                </div>

                <div class="d-flex justify-content-center">
                  <button type="submit"
                    class="btn btn-warning btn-block btn-lg gradient-custom-4 text-body">Continue</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">New Customer? <a href="registration"
                    class="fw-bold text-body"><u>Create Account here</u></a></p>

              

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</form>
{/block}