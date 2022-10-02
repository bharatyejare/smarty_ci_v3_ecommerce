function validation(){
	var password = document.getElementById('password').value;
	
	if(password.length < 6)
    {
        document.getElementById('error').style.color="red";
        document.getElementById('error').innerHTML = "! Passwords must be at least 6 characters."
        return;
    }else{
        document.getElementById('error').innerHTML = ""
        document.forms["myform"].submit();
    }
    
}


$(document).ready(function() {
    $("#add").click(function() {
       alert($("#company").val());
        $.ajax({
            type: "POST",
            url: "sellers/store_brands",
           data: 'brand_name='+ $("#brand_name").val()+'&description='+ $("#description").val()+'&company_id='+ $("#company").val(),
            beforeSend: function() {
                $("#SearchName").css("background", "#FFF url(images/cart.svg) no-repeat 165px");
            },
            success: function(data) {
                //console.log(data);
                window.location.href="brand_listing";
            }
        });
    });
});

$(document).ready(function() {
    $("#company_add").click(function() {
        //alert('d');
        $.ajax({
            type: "POST",
            url: "sellers/store_company",
           data: 'company_name='+ $("#company_name").val()+'&company_description='+ $("#company_description").val()+'&country_name='+ $("#country_name").val(),
            beforeSend: function() {
                $("#SearchName").css("background", "#FFF url(images/cart.svg) no-repeat 165px");
            },
            success: function(data) {
                //console.log(data);
                window.location.href="company_listing";
            }
        });
    });
});

$(document).ready(function() {
    $("#add_category").click(function() {
        //alert('d');
        $.ajax({
            type: "POST",
            url: "sellers/store_category",
           data: 'category_name='+ $("#category_name").val(),
            beforeSend: function() {
                $("#SearchName").css("background", "#FFF url(images/cart.svg) no-repeat 165px");
            },
            success: function(data) {
                //console.log(data);
                window.location.href="category_listing";
            }
        });
    });
});

$(document).ready(function() {
    $("#add_product").click(function() {
         $("#add_product_form").submit();
        //alert('d');
        // $.ajax({
        //     type: "POST",
        //     url: "sellers/store_category",
        //    data: 'category_name='+ $("#category_name").val(),
        //     beforeSend: function() {
        //         $("#SearchName").css("background", "#FFF url(images/cart.svg) no-repeat 165px");
        //     },
        //     success: function(data) {
        //         //console.log(data);
        //         window.location.href="category_listing";
        //     }
        // });
    });
});

$('#exampleModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('whatever') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('New message to ' + recipient)
  modal.find('.modal-body input').val(recipient)
})

$('#exampleModal_company').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('company') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('New message to ' + recipient)
  modal.find('.modal-body input').val(recipient)
})

$('#exampleModal_category').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('company') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('New message to ' + recipient)
  modal.find('.modal-body input').val(recipient)
})

$('#exampleModal_product').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('company') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('New message to ' + recipient)
  modal.find('.modal-body input').val(recipient)
})