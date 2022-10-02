<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keywords" content="htmlcss bootstrap aside menu, vertical, sidebar nav menu CSS examples" />
<meta name="description" content="Bootstrap 5 sidebar navigation menu example" />  

<title>Add Product</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src={$boostrap}></script>
<script src={$seller}></script>
<style type="text/css">

.sidebar .nav-link {
    font-weight: 500;
    color: var(--bs-dark);
}
.sidebar .nav-link:hover {
    background: var(--bs-light);
    color: var(--bs-primary);
}

</style>
</head>
<body class="bg-light">

<header class="section-header py-3">
<div class="container">
	<h2>Seller Panel </h2> 
</div>
</header> <!-- section-header.// -->

<div class="container">

<section class="section-content py-3">
	<div class="row">
		<aside class="col-lg-3"> 
<!-- ============= COMPONENT ============== -->
{include file='nav.tpl'}
<!-- ============= COMPONENT END// ============== -->	
		</aside>
		<main class="col-lg-9">

{include file='brand.tpl'}
{include file='company.tpl'}
{include file='category.tpl'}
{include file='add_product.tpl'}
		</main>
	</div>
</section>

</div><!-- container //  -->

</body>
</html>