<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sellers extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/userguide3/general/urls.html
	 */

	public function __construct() {
        parent::__construct();
        $this->load->model('Seller_model');
        $this->load->library('cart');
        //$this->load->library('upload');
        $this->load->model('Country_model');
        $this->load->model('Product_model');
    }
    
    public function order_place()
	{
		$unique_id = "HB".mt_rand() . $this->input->post('id');
		$session_exists=$this->session->userdata('username');
		if(!empty($session_exists)){
		$data = array(
		'order_id'      =>   $unique_id,
		'product_id' => $this->input->post('id'),
		'order_name' => $this->input->post('product_name'),
		'amount' => $this->input->post('product_price'),
		'qty' => $this->input->post('select_qty'),
		'payment_mode' => 'Online',
		'status' =>'Paid',
		'created_date'=>date('Y-m-d H:i:s')
		);

		$id=$this->Product_model->order_confirmation($data);
		$this->cart->destroy();
		$order_details=$this->Product_model->get_order($unique_id);
		$image_url=base_url();
		$this->smarty->assign('image_url',$image_url);
		$this->smarty->assign('order_details',$order_details);
		$this->smarty->display('order_details.tpl');

		}else{
		    redirect('products/login');
		}

	}


	public function search_products()
	{
		$category = $_GET['category'];
		$product = $_GET['product'];
		if (! empty($product)) {
    	$query = $this->Product_model->get_products_details($category,$product);
		if (! empty($query)) {
		?>
		<ul id="country-list">
		<?php
		foreach ($query as $value) {
		?>
		<li
		onClick="selectproduct('<?php echo $value["vName"]; ?>');" style="color: white;">
		<?php echo $value["vName"]; ?>
		</li>
		<?php
		} // end for
		?>
		</ul>
		<?php
		} // end if not empty
		}
	}

	public function display_product()
	{
		$display_products = $this->Product_model->get_products_details($_GET['category'],$_GET['product']);
		echo json_encode($display_products);
	}

	public function change_details()
	{
		$change_display_products = $this->Product_model->get_change_details($_GET['sub_product_id']);
		echo json_encode($change_display_products);
	}

	// public function display_brands()
	// {
	// 	//echo $_GET['brands'];die();
	// 	$change_display_brands = $this->Product_model->get_display_brands($_GET['brands']);
	// 	//echo "<pre>";print_r($_GET['brands']);die();
	// 	$this->smarty->assign('change_display_brands',$change_display_brands);
	// 	$this->smarty->display('index.tpl');
	// 	//redirect('welcome');
	// }


	public function store()
	{
		if(!empty($this->input->post('name')) && !empty($this->input->post('mobile_no')) && !empty($this->input->post('country_code')) && !empty($this->input->post('password'))){
		$email=$this->Seller_model->get_mail_exist($this->input->post('email'));
		//echo $email;die();
		if($email==='exists'){
			echo '<script language="javascript" type="text/javascript">
			alert("Email Already Exists");
			window.location = "'.base_url().'sellers/seller_registration";
			</script>';
			die();
		}

		$mobile_no=$this->Seller_model->get_mobile_exist($this->input->post('mobile_no'));
		$validate_mobile_no=preg_match('/^[0-9]{10}+$/', $this->input->post('mobile_no'));
		if($validate_mobile_no==0){
			echo '<script language="javascript" type="text/javascript">
			alert("Please Enter Valid mobile No");
			window.location = "'.base_url().'sellers/seller_registration";
			</script>';
			die();
		}
		//echo $validate_mobile_no;die();
		if($mobile_no==='exists'){
			echo '<script language="javascript" type="text/javascript">
			alert("Mobile No Already Exists");
			window.location = "'.base_url().'sellers/seller_registration";
			</script>';
			die();
		}

		$data = array(
		'vSellerName' => $this->input->post('name'),
		'iMobileNo' => $this->input->post('mobile_no'),
		'vEmail' => $this->input->post('email'),
		'vPassword' => $this->input->post('password'),
		'vCountryCode' => $this->input->post('country_code')
		);
		//echo "<pre>";print_r($data);
    	$id=$this->Seller_model->seller_create($data);
    	if(!empty($id)){
			echo '<script language="javascript" type="text/javascript">
			alert("Registration successfully Done");
			window.location = "'.base_url().'seller_login";
			</script>';
    	}else{
    		echo '<script language="javascript" type="text/javascript">
			alert("Registration Failed");
			window.location = "'.base_url().'seller_account";
			</script>';
    	}
    }else{
    		
    		echo '<script language="javascript" type="text/javascript">
			alert("Please Fill up the Registration Form");
			window.location = "'.base_url().'seller_account";
			</script>';
    }
	}

	public function login()
	{
		
		$image_url="http://localhost/amazon/images/amazon.jpeg";
		$search_url="http://localhost/amazon/sellers/sign_in";
		$this->smarty->assign('search_url',$search_url);
		$this->smarty->assign('image_url',$image_url);
		$this->smarty->display('seller_login.tpl');
	}

	public function sign_in()
	{
		//echo $this->input->post('emailormobile_no');
		//echo $this->input->post('password');
		if(!empty($this->input->post('emailormobile_no')) && !empty($this->input->post('password'))){
			$check_sign_in = $this->Seller_model->check_email_mobile_no($this->input->post('emailormobile_no'),$this->input->post('password'));
			//print_r($check_sign_in);
			if(!empty($check_sign_in[0]['vSellerName'])){
			$data = array('username' =>$check_sign_in[0]['vSellerName'],'id'=>$check_sign_in[0]['iSellerRegistrationId']);
			//print_r($data);die();
			$this->session->set_userdata($data);
			//$cart_data_exists=$this->cart->contents();
			//print_r($cart_data_exists);die();
			echo '<script language="javascript" type="text/javascript">
			alert("Login successfully Done");
			window.location = "'.base_url().'create_product";
			</script>';
		}else{
    		echo '<script language="javascript" type="text/javascript">
			alert("Login Failed");
			window.location = "'.base_url().'seller_login";
			</script>';
    	}
		}else{
    		
    		echo '<script language="javascript" type="text/javascript">
			alert("Please Enter Form Details");
			window.location = "'.base_url().'seller_login";
			</script>';
        }
	}

	public function logout(){
		$this->session->unset_userdata('username'); 
		echo '<script language="javascript" type="text/javascript">
			alert("Logout Successfully Done");
			window.location = "'.base_url().'seller_login";
			</script>';
	}

	function add_to_cart(){ 
        $data = array(
            'id' => $this->input->post('id'), 
            'qty' => $this->input->post('qty'),
            'price' => $this->input->post('product_price'), 
            'name' => $this->input->post('product_name')
        );
        $id=$this->cart->insert($data);
        redirect('products/checkout');
        
    }

    function create_product(){
        $search_url=base_url()."js/bootstrap.min.js";
        $seller_url=base_url()."js/seller.js";
        $create_product=base_url()."sellers/store_products";
        $companies = $this->Seller_model->get_company_listing();
        $categories = $this->Seller_model->get_category_listing();
        $brands = $this->Seller_model->get_brands();
        //echo "<pre>";print_r($brands);die();
        $this->smarty->assign('create_product',$create_product);
        $this->smarty->assign('boostrap',$search_url);
        $this->smarty->assign('seller',$seller_url);
        $this->smarty->assign('companies',$companies);
        $this->smarty->assign('categories',$categories);
        $this->smarty->assign('brands',$brands);
        $this->smarty->display('sidebar-nav.tpl');
    }

    function brand_listing(){
        $search_url=base_url()."js/bootstrap.min.js";
        $seller_url=base_url()."js/seller.js";
        $brands = $this->Seller_model->get_brands();
        $companies = $this->Seller_model->get_company_listing();
        $categories = $this->Seller_model->get_category_listing();
        $create_product=base_url()."sellers/store_products";
       // echo "<pre>";print_r($brands);die();
        $this->smarty->assign('create_product',$create_product);
        $this->smarty->assign('boostrap',$search_url);
        $this->smarty->assign('seller',$seller_url);
        $this->smarty->assign('brands',$brands);
        $this->smarty->assign('companies',$companies);
        $this->smarty->assign('categories',$categories);
        $this->smarty->display('brand_listing.tpl');
    }

    function company_listing(){
        $search_url=base_url()."js/bootstrap.min.js";
        $seller_url=base_url()."js/seller.js";
        $create_product=base_url()."sellers/store_products";
        $companies = $this->Seller_model->get_company_listing();
       // echo "<pre>";print_r($brands);die();
        $this->smarty->assign('boostrap',$search_url);
        $this->smarty->assign('create_product',$create_product);
        $this->smarty->assign('seller',$seller_url);
        $this->smarty->assign('companies',$companies);
        $this->smarty->display('company_listing.tpl');
    }

    function category_listing(){
        $search_url=base_url()."js/bootstrap.min.js";
        $seller_url=base_url()."js/seller.js";
        $create_product=base_url()."sellers/store_products";
        $categories = $this->Seller_model->get_category_listing();
        $companies = $this->Seller_model->get_company_listing();
        $brands = $this->Seller_model->get_brands();
       // echo "<pre>";print_r($brands);die();
        $this->smarty->assign('brands',$brands);
        $this->smarty->assign('create_product',$create_product);
        $this->smarty->assign('boostrap',$search_url);
        $this->smarty->assign('seller',$seller_url);
        $this->smarty->assign('categories',$categories);
        $this->smarty->assign('companies',$companies);
        $this->smarty->display('category_listing.tpl');
    }

    function product_listing(){
        $search_url=base_url()."js/bootstrap.min.js";
        $seller_url=base_url()."js/seller.js";
        $product_listing = $this->Product_model->get_product_listing();
        $categories = $this->Seller_model->get_category_listing();
        $brands = $this->Seller_model->get_brands();
        $companies = $this->Seller_model->get_company_listing();
       // echo "<pre>";print_r($product_listing);die();
        $create_product=base_url()."sellers/store_products";
        $this->smarty->assign('boostrap',$search_url);
        $this->smarty->assign('seller',$seller_url);
        $this->smarty->assign('create_product',$create_product);
        $this->smarty->assign('product_listing',$product_listing);
        $this->smarty->assign('brands',$brands);
        $this->smarty->assign('companies',$companies);
        $this->smarty->assign('categories',$categories);
        $this->smarty->display('product_listing.tpl');
    }


    public function seller_registration()
	{
		$get_country_code = $this->Seller_model->get_country_code();
		$image_url=base_url()."images/amazon.jpeg";
		$search_url=base_url()."sellers/store";
		$autocomplete_js="http://localhost/amazon/js/seller.js";
		$this->smarty->assign('search_url',$search_url);
		$this->smarty->assign('image_url',$image_url);
		$this->smarty->assign('autocomplete_js',$autocomplete_js);
		$this->smarty->assign('country_code',$get_country_code);
		$this->smarty->display('seller_registration.tpl');
	}

	public function store_brands(){
		$data = array(
		'vBrandName' => $this->input->post('brand_name'),
		'vDescription' => $this->input->post('description'),
		'iCompanyId' => $this->input->post('company_id')
		);
    	$id=$this->Seller_model->create_brand($data);
    	echo $id;
	}

	public function store_category(){
		$data = array(
		'vCategoryName' => $this->input->post('category_name')
		);
    	$id=$this->Seller_model->create_category($data);
    	echo $id;
	}

	public function store_company(){
		$data = array(
		'vCompanyName' => $this->input->post('company_name'),
		'vDescription' => $this->input->post('company_description'),
		'vCountryName' => $this->input->post('country_name'),
		);
		//print_r($data);die();
    	$id=$this->Seller_model->create_company($data);
    	echo $id;
	}

	public function add_product(){
		$search_url=base_url()."js/bootstrap.min.js";
        $seller_url=base_url()."js/seller.js";
        $create_product=base_url()."sellers/store_products";
        $categories = $this->Seller_model->get_category_listing();
        $companies = $this->Seller_model->get_company_listing();
        //echo "<pre>";print_r($companies);die();
        $this->smarty->assign('boostrap',$search_url);
        $this->smarty->assign('create_product',$create_product);
        $this->smarty->assign('seller',$seller_url);
        $this->smarty->assign('categories',$categories);
        $this->smarty->assign('companies',$companies);
		$this->smarty->display('add_product.tpl');
	}


	// public function do_upload($id){
	// $folderName = 'images/product_images/'.$id;
	// if(!is_dir($folderName))
	// {
	// 	mkdir($folderName, 0777,true);
	// 	chmod($folderName, 0777);
	// }


	// $config = array(
	// 'upload_path' => $folderName,
	// 'allowed_types' => "gif|jpg|png|jpeg|pdf",
	// 'overwrite' => TRUE,
	// 'max_size' => "2048000", // Can be set to particular file size , here it is 2 MB(2048 Kb)
	// 'max_height' => "768",
	// 'max_width' => "1024"
	// );
	// echo "<pre>";print_r($config);die();
	// $this->load->library('upload', $config);
	// // if($this->upload->do_upload())
	// // {
	// // $data = array('upload_data' => $this->upload->data());
	// // $this->load->view('upload_success',$data);
	// // }
	// // else
	// // {
	// // $error = array('error' => $this->upload->display_errors());
	// // $this->load->view('custom_view', $error);
	// // }
	// }
	
	public function store_products(){
		//$product_image=array('vProductImage'=>$_FILES['product_details']['name']['vProductImage']);
		//echo  "<pre>";print_r($_FILES['product_details']['name']['vProductImage']);die();
		$product_details_arr=$_POST;
		$product_details_arr['product_details']['vProductImage']=$_FILES['product_details']['name']['vProductImage'];
		$product_details_arr['product_details']['iAddedBy']=$this->session->userdata('id');
		$product_details_arr['product_details']['dAddedDate']=date('Y-m-d_H:i:s');
		// $product_details_arr['product_details']['iUpdateBy']=$this->session->userdata('id');
		// $product_details_arr['product_details']['dUpdateDate']=date('Y-m-d_H:i:s');

    	$id=$this->Product_model->create_product($product_details_arr['product_details']);
    	if(!empty($id)){
		$folderName = 'images/product_images/'.$id;
		if(!is_dir($folderName))
		{
			mkdir($folderName, 0777,true);
			chmod($folderName, 0777);
		}

		$file_location = $folderName .'/'. basename($_FILES['product_details']['name']['vProductImage']);

		if(isset($_FILES['product_details']['name']['vProductImage'])){ 

		if(move_uploaded_file($_FILES['product_details']['tmp_name']['vProductImage'], $file_location)){

		};

		} 
    		echo '<script language="javascript" type="text/javascript">
			alert("Product Added Successfully");
			window.location = "'.base_url().'product_listing";
			</script>';
    	}
	}

}