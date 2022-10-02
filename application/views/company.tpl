<div class="modal fade" id="exampleModal_company" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel_company" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel_company">Add Company</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Company Name:</label>
            <input type="text" class="form-control" id="company_name" name="company_name">
          </div>
          
          <div class="form-group">
            <label for="message-text" class="col-form-label">Description:</label>
            <textarea class="form-control" id="company_description" name="company_description"></textarea>
          </div>
           <div class="form-group">
            <label for="message-text" class="col-form-label">Company Country:</label>
            <input type="text" class="form-control" id="country_name" name="country_name">
         
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="company_add" >Add</button>
      </div>
    </div>
  </div>
</div>