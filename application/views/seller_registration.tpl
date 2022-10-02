{block name=head}
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
 <link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="{$autocomplete_js}"></script>
  {/block}
  {block name=body}
  <div class="image_selected" ><img src="{$image_url}" alt="" style="height:10%;width:10%;margin-left:45%;"></div>
<form class="" action="{$search_url}" method="post" name="myform">
<section class="vh-100 bg-image">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Create an account</h2>

              <form>

                <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example1cg">Your Name</label>
                  <input type="text" id="form3Example1cg" class="form-control" name="name"/>
                  
                </div>

                 <div class="form-outline mb-4">
                <label class="form-label" for="form3Example3cg">Mobile number</label>
                <select name="country_code" id="country_code" class="form-control" >
                <option>--Select--</option>
                {foreach item=mobile_no from=$country_code}
                <option value="{$mobile_no.country_code}"> {$mobile_no.country_code} </option>
                {/foreach}
                </select>
                  <input type="mobile_no" id="form3Example3cg" class="form-control" name="mobile_no"/>
                  
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example3cg">Email (optional)</label>
                  <input type="email" id="form3Example3cg" class="form-control" name="email"/>
                  
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example4cg">Password</label>
                  <input type="password" id="password" class="form-control" name="password" />
                  <div id="error"></div>
                </div>

                <div class="form-check d-flex justify-content-center mb-5">
                  We will send you a text to verify your phone.
                  Message and Data rates may apply.
                </div>

                <div class="d-flex justify-content-center">
                  <button type="button"
                    class="btn btn-warning btn-block btn-lg gradient-custom-4 text-body" onClick="validation()">Continue</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Already have an account? <a href="seller_login"
                    class="fw-bold text-body"><u>Login here</u></a></p>

              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</form>
{/block}