 {block name=head}
<style type="text/css"> 
 #gallery img  
{  
border:2px solid white;width: 96px;  
}  
.activeborder img  
{  
border:2px solid #333 !important;  
}  
#image  
{  
width: 459px;  
}  
</style>
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>
 <script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
    <script src="{$js1_path}"></script>
    <script src="{$boostrap_js}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <script src="{$js_path}" >
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" ></script>
 <link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-3-typeahead/4.0.1/bootstrap3-typeahead.min.js"></script> 
   
 <script type="text/javascript">
         $(function() {
             $("img.imgthumb").click(function(e) {
                 var newImg = '<img src='
                                + $(this).attr("src") + '></img>';
                 $('.image_selected')
                    .html($(newImg)
                    .animate({ height: '400', width: '400' ,marginTop:'-255'}, 1500));
             });
         });    
     </script>
<div class="super_container">
    <header class="header" style="display: none;">
        <div class="header_main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
                        <div class="header_search">
                            <div class="header_search_content">
                                <div class="header_search_form_container">
                                    <form action="{$product_cart_url}" class="header_search_form clearfix" method="post">
                                        <div class="custom_dropdown">
                                            <div class="custom_dropdown_list"> <span class="custom_dropdown_placeholder clc">All Categories</span> <i class="fas fa-chevron-down"></i>
                                                <ul class="custom_list clc">
                                                    <li><a class="clc" href="#">All Categories</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="single_product">
        <div class="container-fluid" style=" background-color: #fff; padding: 11px;">
            <div class="row">
                <div class="col-lg-2 order-lg-1 order-2">
                    {*<ul class="image_list">
                        <li data-image="https://i.imgur.com/21EYMGD.jpg"><img src="https://i.imgur.com/21EYMGD.jpg" alt=""></li>
                        <li data-image="https://i.imgur.com/DPWSNWd.jpg"><img src="https://i.imgur.com/DPWSNWd.jpg" alt=""></li>
                        <li data-image="https://i.imgur.com/HkEiXfn.jpg"><img src="https://i.imgur.com/HkEiXfn.jpg" alt=""></li>
                    </ul>*}
                </div>
                <div class="col-lg-4 order-lg-2 order-1">
                {foreach $multiple_image_url as $value}
                    <div style="margin-left:-13%;margin-top:-10px;"><img src="{$value}" alt="" style="height:10%;width:10%;margin-top:40px;margin-left:-33%;" class="imgthumb"></div>
                {/foreach}
                    <div class="image_selected"><img src="{$image_url}" alt="" style="height:30%;width:80%;margin-top:-55%;margin-left:-13%;" id="zoomimg"></div>
               
                </div>

                <div class="col-lg-6 order-3">
                    <div class="product_description">
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Products</a></li>
                                <li class="breadcrumb-item active">Accessories</li>
                            </ol>

                        </nav>
                    <div class='container-fluid'>
                    <div class="card" style="margin-left:60%;width:40%;height:40%;">
                    <p style="color:red;margin-left:40px;">₹{$single_display_product[0].price}.00</p>
                    <p>FREE delivery Thu, 22 Sep on first order. Details</p>
                    <p>Or fastest delivery Tomorrow, Sep 21. Order within 10 hrs 2 mins. Details</p>
                    <div class="card-body text-center mx-auto">
                    <div class='cvp'>
                     {if $categories_name!=='Home & Kitchen'}
                    <p style="color:green;margin-left:-150%;">In Stock</p>
                    {/if}
                    <p style="margin-left:-100%;">Quantity:<select name="qty" onchange="selectedNum(this.value)" id="qty" style="width:50px;">
                    
                    {foreach item=qty from=$quantity}
                    <option value="{$qty.id}"> {$qty.qty} </option>
                    {/foreach}
                    </select></p>
                    <input type="hidden" name="id" id="product_id" value={$id}>
                    <input type="hidden" name="product_price" id="product_price" value={$single_display_product[0].price}>
                    <input type="hidden" name="product_name" id="product_name" value="{$single_display_product[0].name}">
                    <input type="hidden" name="select_qty" id="select_qty" value="">
                    <button class="btn btn-primary btn-sm" type="submit" id="addtocart">Add to Card</button></br></br>
                    
                    <a href="#" class="btn btn-warning btn-rounded" style="margin-top:-20px;margin-left:4px;width:110px;">Buy Now</a>
                    </div>
                    </div>
                    </div>

                    </div>
                        <div class="product_name" style="margin-top:-63%;">{$single_display_product[0].name}</div>

                        <div class="product-rating"><span class="badge badge-success"><i class="fa fa-star"></i> 4.5 Star</span> <span class="rating-review">35 Ratings & 45 Reviews</span></div>

                        <div> <span class="product_price">₹ {$single_display_product[0].price}</span> <strike class="product_discount"> <span style='color:black'>₹ 2,000<span> </strike> </div>
                        <div> <span class="product_saved">You Saved:</span> <span style='color:black'>₹ 2,000<span> </div>
                        <hr class="singleline">
                        <div> <span class="product_info" id="ram_memory_installed_size_label">Capacity:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="ram_memory_installed_size">{$single_display_product[0].ram_memory_installed_size}</span><br> <span class="product_info" id="brandlabel"><strong>Brand</strong>: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="brand">{$single_display_product[0].brand}</span><br> 
                        <span class="product_info" id="brandlabel"><strong>Configuration</strong>: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="brand">{$single_display_product[0].configuration}</span><br><span class="product_info" id="brandlabel"><strong>Colour</strong>: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="brand">{$single_display_product[0].color}</span><br>
                        {if $categories_name!=='Home & Kitchen'}
                        <span class="product_info"><strong>Screen Size</strong>:&nbsp;</span><span >{$single_display_product[0].screen_size}</span><br> <span class="product_info"><strong>Hard Disk <br>Size</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="hard_disk_size">{$single_display_product[0].hard_disk_size},{$single_display_product[0].hard_disk_description}</span><br> <span class="product_info" ><strong>CPU Model</strong>:&nbsp;&nbsp;</span><span id="cpu_model">{$single_display_product[0].cpu_model}</span><br><span class="product_info">
                        <span class="product_info"><strong>Operating <br>System</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="operating_system">{$single_display_product[0].operating_system}</span><br><span class="product_info"><strong>Card <br>Description</strong>:&nbsp;&nbsp;&nbsp;{$single_display_product[0].card_description}<span>
                        <br><span class="product_info"><strong>Graphics <br>Coprocessor</strong>:&nbsp;{$single_display_product[0].graphic_coprocessor}<span> 
                        <br><span class="product_info"><strong>CPU Speed</strong>:&nbsp;&nbsp;&nbsp;{$single_display_product[0].cpu_speed}<span> {/if}
                        </div>
                        <div>
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="br-dashed">
                                        <div class="row">
                                            <div class="col-md-3 col-xs-3"> <img src="https://img.icons8.com/color/48/000000/price-tag.png"> </div>
                                            <div class="col-md-9 col-xs-9">
                                                <div class="pr-info"> <span class="break-all">Get 5% instant discount + 10X rewards @ RENTOPC</span> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-7"> </div>
                            </div>
                            <div class="row" style="margin-top: 15px;">
                                <div class="col-xs-6" style="margin-left: 15px;"> 
                                 {if $categories_name!=='Home & Kitchen'}
                                <span class="product_options">Size:</span><span></span><br> 
                                {foreach $multiple_display_product as $display_product}

                                <button class="btn btn-lg" type="button" Onclick="change_details({$display_product['sub_prod_id']})" value="{$display_product['sub_prod_id']}">{$display_product['screen_size']}<br>{$display_product['price']}</button> 
                                {/foreach}
                                {/if}
                                 </div> 
                                
                                {*<div class="col-xs-6" style="margin-left: 55px;"> <span class="product_options">Storage Options</span><br> <button class="btn btn-primary btn-sm">500 GB</button> <button class="btn btn-primary btn-sm">1 TB</button> </div>*}
                            </div>
                        </div>
                        <hr class="singleline">
                        <div class="order_info d-flex flex-row">
                            <form action="#">
                        </div>
                        <div class="row">
                            <div class="col-xs-6" style="margin-left: 13px;">
                                <div class="product_quantity"> <span><strong>About this item</strong>: </span> 
                                    <div class="quantity_buttons">
                                        <div id="description" class="quantity_inc quantity_control">{$single_display_product[0].description}</div>
                                        <div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fas fa-chevron-down"></i></div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-6"> <span><strong>Note</strong>: </span>
                            {$single_display_product[0].note}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            s
            <div class="row row-underline">
                <div class="col-md-6"> <span class=" deal-text">Combo Offers</span> </div>
                <div class="col-md-6"> <a href="#" data-abc="true"> <span class="ml-auto view-all"></span> </a> </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <div class="row padding-2">
                        <div class="col-md-5 padding-0">
                            <div class="bbb_combo">
                                <div class="bbb_combo_image"><img class="bbb_combo_image" src="https://i.imgur.com/K4b71NV.jpg" alt=""></div>
                                <div class="d-flex flex-row justify-content-start"> <strike style="color:red;"> <span class="fs-10" style="color:black;">₹ 32,000<span> </span></span></strike> <span class="ml-auto"><i class="fa fa-star p-rating"></i><i class="fa fa-star p-rating"></i><i class="fa fa-star p-rating"></i><i class="fa fa-star p-rating"></i></span> </div>
                                <div class="d-flex flex-row justify-content-start" style=" margin-bottom: 13px; "> <span style="margin-top: -4px;">₹30,000</span> <span class="ml-auto fs-10">23 Reviews</span> </div> <span>Acer laptop with 10GB RAM + 500 GB Hard Disk</span>
                            </div>
                        </div>
                        <div class="col-md-2 text-center"> <span class="step">+</span> </div>
                        <div class="col-md-5 padding-0">
                            <div class="bbb_combo">
                                <div class="bbb_combo_image"><img class="bbb_combo_image" src="https://i.imgur.com/K4b71NV.jpg" alt=""></div>
                                <div class="d-flex flex-row justify-content-start"> <strike style="color:red;"> <span class="fs-10" style="color:black;">₹ 32,000<span> </span></span></strike> <span class="ml-auto"><i class="fa fa-star p-rating"></i><i class="fa fa-star p-rating"></i><i class="fa fa-star p-rating"></i><i class="fa fa-star p-rating"></i></span> </div>
                                <div class="d-flex flex-row justify-content-start" style=" margin-bottom: 13px; "> <span style="margin-top: -4px;">₹30,000</span> <span class="ml-auto fs-10">23 Reviews</span> </div> <span>Acer laptop with 10GB RAM + 500 GB Hard Disk</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12" style="margin-left: 36px;">
                            <div class="boxo-pricing-items">
                                <div class="combo-pricing-item"> <span class="items_text">1 Item</span> <span class="combo_item_price">₹13,200</span> </div>
                                <div class="combo-plus"> <span class="plus-sign">+</span> </div>
                                <div class="combo-pricing-item"> <span class="items_text">1 Add-on</span> <span class="combo_item_price">₹500</span> </div>
                                <div class="combo-plus"> <span class="plus-sign">=</span> </div>
                                <div class="combo-pricing-item"> <span class="items_text">Total</span> <span class="combo_item_price">₹13,700</span> </div>
                                <div class="add-both-cart-button"> <button type="button" class="btn btn-primary shop-button">Add to Cart</button> </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 text-center"> <span class="vertical-line"></span> </div>
                <div class="col-md-5" style=" margin-left: -27px;">
                    <div class="row padding-2">
                        <div class="col-md-5 padding-0">
                            <div class="bbb_combo">
                                <div class="bbb_combo_image"><img class="bbb_combo_image" src="https://i.imgur.com/K4b71NV.jpg" alt=""></div>
                                <div class="d-flex flex-row justify-content-start"> <strike style="color:red;"> <span class="fs-10" style="color:black;">₹ 32,000<span> </span></span></strike> <span class="ml-auto"><i class="fa fa-star p-rating"></i><i class="fa fa-star p-rating"></i><i class="fa fa-star p-rating p-rating"></i><i class="fa fa-star p-rating"></i></span> </div>
                                <div class="d-flex flex-row justify-content-start" style=" margin-bottom: 13px; "> <span style="margin-top: -4px;">₹30,000</span> <span class="ml-auto fs-10">23 Reviews</span> </div> <span>Acer laptop with 10GB RAM + 500 GB Hard Disk</span>
                            </div>
                        </div>
                        <div class="col-md-2 text-center"> <span class="step">+</span> </div>
                        <div class="col-md-5 padding-0">
                            <div class="bbb_combo">
                                <div class="bbb_combo_image"><img class="bbb_combo_image" src="https://i.imgur.com/K4b71NV.jpg" alt=""></div>
                                <div class="d-flex flex-row justify-content-start"> <strike style="color:red;"> <span class="fs-10" style="color:black;">₹ 32,000<span> </span></span></strike> <span class="ml-auto"><i class="fa fa-star p-rating"></i><i class="fa fa-star p-rating"></i><i class="fa fa-star p-rating"></i><i class="fa fa-star p-rating"></i></span> </div>
                                <div class="d-flex flex-row justify-content-start" style=" margin-bottom: 13px; "> <span style="margin-top: -4px;">₹30,000</span> <span class="ml-auto fs-10">23 Reviews</span> </div> <span>Acer laptop with 10GB RAM + 500 GB Hard Disk</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12" style="margin-left: 36px;">
                            <div class="boxo-pricing-items">
                                <div class="combo-pricing-item"> <span class="items_text">1 Item</span> <span class="combo_item_price">₹13,200</span> </div>
                                <div class="combo-plus"> <span class="plus-sign">+</span> </div>
                                <div class="combo-pricing-item"> <span class="items_text">1 Add-on</span> <span class="combo_item_price">₹500</span> </div>
                                <div class="combo-plus"> <span class="plus-sign">=</span> </div>
                                <div class="combo-pricing-item"> <span class="items_text">Total</span> <span class="combo_item_price">₹13,700</span> </div>
                                <div class="add-both-cart-button"> <button type="button" class="btn btn-primary shop-button">Add to Cart</button> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row row-underline">
                <div class="col-md-6"> <span class=" deal-text">Specifications</span> </div>
                <div class="col-md-6"> <a href="#" data-abc="true"> <span class="ml-auto view-all"></span> </a> </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table class="col-md-12">
                        <tbody>
                            <tr class="row mt-10">
                                <td class="col-md-4"><span class="p_specification">Sales Package :</span> </td>
                                <td class="col-md-8">
                                    <ul>
                                        <li>2 in 1 Laptop, Power Adaptor, Active Stylus Pen, User Guide, Warranty Documents</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr class="row mt-10">
                                <td class="col-md-4"><span class="p_specification">Model Number :</span> </td>
                                <td class="col-md-8">
                                    <ul>
                                        <li> 14-dh0107TU </li>
                                    </ul>
                                </td>
                            </tr>
                            <tr class="row mt-10">
                                <td class="col-md-4"><span class="p_specification">Part Number :</span> </td>
                                <td class="col-md-8">
                                    <ul>
                                        <li>7AL87PA</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr class="row mt-10">
                                <td class="col-md-4"><span class="p_specification">Color :</span> </td>
                                <td class="col-md-8">
                                    <ul>
                                        <li>Black</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr class="row mt-10">
                                <td class="col-md-4"><span class="p_specification">Suitable for :</span> </td>
                                <td class="col-md-8">
                                    <ul>
                                        <li>Processing & Multitasking</li>
                                    </ul>
                                </td>
                            </tr>
                            <tr class="row mt-10">
                                <td class="col-md-4"><span class="p_specification">Processor Brand :</span> </td>
                                <td class="col-md-8">
                                    <ul>
                                        <li>Intel</li>
                                    </ul>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</form>
 {/block}