
<div class="modal fade" id="exampleModal_product" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action={$create_product} name="add_product" id="add_product_form" method="POST" enctype="multipart/form-data" >
        <div class="form-group">
            <label for="recipient-name" class="col-form-label">Product Name:</label>
            <input type="text" class="form-control" id="name" name="product_details[vName]">
          </div>
          <div class="dropdown">
          <label for="recipient-name" class="col-form-label">Product Category:</label>
         <select name="product_details[iProductCategory]" id="category" class="form-control">
        <option>--Select--</option>
        {foreach item=category from=$categories}
        <option value="{$category.iCategoryId}" > {$category.vCategoryName} </option>
        {/foreach}
        </select>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Available Quantity:</label>
            <input type="number" class="form-control" id="available_qty" name="product_details[iQty]">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Product Weight:</label>
            <input type="text" class="form-control" id="product_weight" name="product_details[vWeight]">
          </div>
          <div class="dropdown">
          <label for="recipient-name" class="col-form-label">Brand Name:</label>
         <select name="product_details[vBrand]" id="brand_name" class="form-control">
        <option>--Select--</option>
        {foreach item=brand from=$brands}
        <option value="{$brand.iBrandId}" > {$brand.vBrandName} </option>
        {/foreach}
        </select>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Product Image:</label>
            <input type="file" class="form-control" id="pimage" name="product_details[vProductImage]" required="" accept="image/png, image/jpeg,image/jpg">
          </div>
          <div class="dropdown">
          <label for="recipient-name" class="col-form-label">Company:</label>
         <select name="product_details[vCompanyName]" id="company" class="form-control">
        <option>--Select--</option>
        {foreach item=company from=$companies}
        <option value="{$company.iCompanyId}" > {$company.vCompanyName} </option>
        {/foreach}
        </select>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Product Short Code:</label>
            <input type="text" class="form-control" id="product_short_code" name="product_details[vProductShortCode]">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Product Dimensionse:</label>
            <input type="text" class="form-control" id="product_dimensions" name="product_details[vDimensions]">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Product Price:</label>
            <input type="text" class="form-control" id="product_price" name="product_details[iPrice]">
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Product SKU:</label>
            <input type="text" class="form-control" id="product_sku" name="product_details[vSku]">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Product Description:</label>
            <textarea class="form-control" id="product_description" name="product_details[tDescription]"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" id="add_product" >Add</button>
      </div>
    </div>
  </div>
</div>