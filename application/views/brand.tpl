
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Brand</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Brand Name:</label>
            <input type="text" class="form-control" id="brand_name" name="brand_name">
          </div>
          <div class="dropdown">
          <label for="recipient-name" class="col-form-label">Company:</label>
         <select name="company" id="company" class="form-control">
        <option>--Select--</option>
        {foreach item=company from=$companies}
        <option value="{$company.iCompanyId}" > {$company.vCompanyName} </option>
        {/foreach}
        </select>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Description:</label>
            <textarea class="form-control" id="description" name="description"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="add" onclick="add_brand();">Add</button>
      </div>
    </div>
  </div>
</div>