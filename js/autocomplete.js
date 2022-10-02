$(document).ready(function() {
	$("#SearchName").keyup(function() {
		$.ajax({
			type: "GET",
			url: "products/search_products",
			data: 'category='+ $("#category").val()+'&product='+ $("#SearchName").val(),
			beforeSend: function() {
				$("#SearchName").css("background", "#FFF url(images/cart.svg) no-repeat 165px");
			},
			success: function(data) {
				$("#suggesstion-box").show();
				$("#suggesstion-box").html(data);
				$("#SearchName").css("background", "#FFF");
			}
		});
	});
});
	//To select a country name
	function selectproduct(val) {
		$("#SearchName").val(val);
		$("#suggesstion-box").hide();

		
	}

	function selectedNum(val) {
		
		$("#select_qty").val(val);
	}

	function select_product(){

		$.ajax({
			type: "GET",
			url: "products/display_product",
			data: 'category='+ $("#category").val()+'&product='+ $("#SearchName").val(),
			beforeSend: function() {
				$("#SearchName").css("background", "#FFF url(images/cart.svg) no-repeat 165px");
			},
			success: function(data) {
				const products = JSON.parse(data);
				
				for (let i = 0; i < products.length; i++) {
				//console.log(products[i]['name']);
				$(products[i]['name']).find('h2').text()
				$('#product_name').html(products[i]['name']);
				$("#price").html(products[i]['price']);
				$("#price_symbol").html('&#x20B9;');
				$("a").attr("href", "products/single_display_product?id="+products[i]['id']+"&name="+products[i]['name']+"&price="+products[i]['price']);
				$("#product_img").attr("src", products[i]['item_image']);
				$("#hide_data").hide();
				}
				//console.log(products[0]['id']);
				
				// $("#suggesstion-box").html(data);
				// $("#SearchName").css("background", "#FFF");
			}
		});
	}

	function change_details(value){
		$.ajax({
			type: "GET",
			url: "change_details",
			data: 'sub_product_id='+ value,
			beforeSend: function() {
				$("#SearchName").css("background", "#FFF url(images/cart.svg) no-repeat 165px");
			},
			success: function(data) {
				const products = JSON.parse(data);
				//console.log(products);
				for (let i = 0; i < products.length; i++) {
				//console.log(products[i]['ram_memory_installed_size']);
				$(products[i]['name']).find('h2').text();
				$('#ram_memory_installed_size').html(products[i]['ram_memory_installed_size']);
				$("#brand").html(products[i]['brand']);
				$("#hard_disk_size").html(products[i]['hard_disk_size']);
				$("#cpu_model").html(products[i]['cpu_model']);
				$("#operating_system").html(products[i]['operating_system']);
				$("#description").html(products[i]['description']);
				}
				//console.log(products[0]['id']);
				
				// $("#suggesstion-box").html(data);
				// $("#SearchName").css("background", "#FFF");
			}
		});
	}

$(document).ready(function() {
	$("#addtocart").click(function() {
		
		$.ajax({
			type: "POST",
			url: "add_to_cart",
			data: 'qty='+ $("#qty").val()+"&id="+$("#product_id").val()+"&name="+$("#product_name").val()+"&price="+$("#product_price").val(),
			beforeSend: function() {
				$("#SearchName").css("background", "#FFF url(images/cart.svg) no-repeat 165px");
			},
			success: function(data) {
				console.log(data);
			}
		});
	});
});



	

