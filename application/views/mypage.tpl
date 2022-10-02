
{block name=title}My Page Title{/block}
{block name=head}

<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="icon" href="../../../../favicon.ico">

    <title>Jumbotron Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 
<!-- jQueryUI library -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" target="_blank" rel="nofollow"  />

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-3-typeahead/4.0.1/bootstrap3-typeahead.min.js"></script>  
<script src="js/autocomplete.js"></script>
{/block}
{block name=body}

<form class="form-inline my-2 my-sm-0" action={$search_url} method="get" >
 <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="#"><img src="images/amazon.png" style="height:45px;
width:100px;"/></a>
<span style="color:white;margin-left: 15px;">
<img src="images/th.jpeg" style="height:20px;
width:15px;position: absolute;
 top: 30px;
 margin-left: -7px;margin-top:-9px;"/></span>
 <span style="color:white;margin-left: 25px;margin-top:-9px;">Delivery to India</span>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          {*<li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">Disabled</a>
          </li>*}
          <li style="margin-top:15px;">
        <select name="category" id="category">
        <option>--Select--</option>
        {foreach item=category from=$categories}
        <option value="{$category.iCategoryId}" {if $category.iCategoryId eq '1'}{/if}> {$category.vCategoryName} </option>
        {/foreach}
        </select>
        </li>
        <li>
          <input class="form-control mr-sm-2" id="SearchName" name="search_name" type="text" placeholder="Search" aria-label="Search" style="height:45px;width:70%;" autocomplete="off">
           <button class="btn btn-warning" style="width:45px;height:40px;" type="button"><img src="images/search.svg"  onClick="select_product()"/></button><
           <p id="suggesstion-box"></p>/li>
           
         <li class="nav-item dropdown" >
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" ><img src="images/flag.jpeg" style="width:20px;height:20px;margin-top:15px;"/></a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="#">Computers</a>
              <a class="dropdown-item" href="#">Electronics</a>
              <a class="dropdown-item" href="#">Software</a>
              <a class="dropdown-item" href="#">Luggage</a>
            </div>
          </li>
          <li class="nav-item dropdown" >
          
          {if isset($username)}
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:white">Hello {$username}<br>Account & Lists</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="#">Electronics</a>
              <a class="dropdown-item" href="#">Software</a>
              <a class="dropdown-item" href="#">Luggage</a>
              <a class="dropdown-item" href="products/logout">Logout</a>
            </div>
            {elseif $username==''}
            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:white">Hello Sign In<br>Account & Lists</a>
            <div class="dropdown-menu" aria-labelledby="dropdown01">
              <a class="dropdown-item" href="index.php/search/login"><button type="button" class="btn btn-warning">Sign in</button></a><a><br> New Customer?Start here</a>
              <a class="dropdown-item" href="#">Electronics</a>
              <a class="dropdown-item" href="#">Software</a>
              <a class="dropdown-item" href="#">Luggage</a>
             
            </div>
            {/if}
          </li>
          <li><a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:white;">Returns<br>& Orders</a></li>
           <li><a class="btn btn-warning" href="seller_account">Seller Login</a></li>
          <li><img src="images/cart.svg" style="margin-left:300px;width:30px;height:30px;margin-top:15px;"/></li>
        </ul>
      </div>
    </nav>
    </form>
{/block}


