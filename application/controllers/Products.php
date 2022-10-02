<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Products extends CI_Controller {

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
        $this->load->model('Product_model');
        $this->load->library('cart');
         $this->load->model('Country_model');
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

	public function single_display_product()
	{
		$single_display_product = $this->Product_model->get_single_products_details($_GET['id']);
		$single_product= $this->Product_model->get_single_product($_GET['id']);
		$single_category = $this->Product_model->get_single_category($single_product[0]['category_id']);
		//echo "<pre>";print_r($single_category[0]['name']);
		$multiple_display_product = $this->Product_model->get_multiple_products_details($_GET['id']);
		//echo "<pre>";print_r($multiple_display_product);die();
		$qty = $this->Product_model->get_qty();
		$image_url="http://localhost/amazon/".$single_display_product[0]['item_image'];
		if(!empty($multiple_display_product)){
			foreach($multiple_display_product as $value){
			   $multiple_image_url[]="http://localhost/amazon/".$value['multiple_images'];
			   $this->smarty->assign('multiple_image_url',$multiple_image_url);
		    }
	    }
		//echo "<pre>";print_r($multiple_image_url);die();
		$js1_path="http://localhost/amazon/js/popper.min.js";
		$this->smarty->assign('js1_path',$js1_path);
		$js_path="http://localhost/amazon/js/autocomplete.js";
		$boostrap_js="http://localhost/amazon/js/bootstrap.min.js";
		$product_cart_url="add_to_cart";
		$search_url=base_url().'products/index';
		$this->smarty->assign('search_url',$search_url);
		$categories = $this->Country_model->getcategories();
		$username=$this->session->userdata('username');
		$this->smarty->assign('username',$username);
		$this->smarty->assign('categories',$categories);
		$this->smarty->assign('js_path',$js_path);
		$this->smarty->assign('boostrap_js',$boostrap_js);
		$this->smarty->assign('image_url',$image_url);
		$this->smarty->assign('product_cart_url',$product_cart_url);
		$this->smarty->assign('quantity',$qty);
		$this->smarty->assign('id',$_GET['id']);
		$this->smarty->assign('categories_name',$single_category[0]['name']);
		$this->smarty->assign('single_display_product',$single_display_product);
		$this->smarty->assign('single_display_product',$single_display_product);
		$this->smarty->assign('multiple_display_product',$multiple_display_product);
		$this->smarty->display('single_product.tpl');
	}

	public function product_cart()
	{
		$this->smarty->display('product_cart.tpl');
	}

	public function registration()
	{
		$get_country_code = $this->Product_model->get_country_code();
		$image_url="http://localhost/amazon/images/amazon.jpeg";
		$search_url="http://localhost/amazon/products/store";
		$this->smarty->assign('search_url',$search_url);
		$this->smarty->assign('image_url',$image_url);
		$this->smarty->assign('country_code',$get_country_code);
		$this->smarty->display('registration.tpl');
	}

	public function store()
	{
		if(!empty($this->input->post('name')) && !empty($this->input->post('mobile_no')) && !empty($this->input->post('country_code')) && !empty($this->input->post('password'))){
		$email=$this->Product_model->get_mail_exist($this->input->post('email'));
		//echo $email;die();
		if($email==='exists'){
			echo '<script language="javascript" type="text/javascript">
			alert("Email Already Exists");
			window.location = "'.base_url().'products/registration";
			</script>';
			die();
		}

		$mobile_no=$this->Product_model->get_mobile_exist($this->input->post('mobile_no'));
		$validate_mobile_no=preg_match('/^[0-9]{10}+$/', $this->input->post('mobile_no'));
		if($validate_mobile_no==0){
			echo '<script language="javascript" type="text/javascript">
			alert("Please Enter Valid mobile No");
			window.location = "'.base_url().'products/registration";
			</script>';
			die();
		}
		//echo $validate_mobile_no;die();
		if($mobile_no==='exists'){
			echo '<script language="javascript" type="text/javascript">
			alert("Mobile No Already Exists");
			window.location = "'.base_url().'products/registration";
			</script>';
			die();
		}

		$data = array(
		'name' => $this->input->post('name'),
		'mobile_no' => $this->input->post('mobile_no'),
		'country_code' => $this->input->post('country_code'),
		'email' => $this->input->post('email'),
		'password' => $this->input->post('password')
		);
		
    	$id=$this->Product_model->user_registration($data);
    	if(!empty($id)){
			echo '<script language="javascript" type="text/javascript">
			alert("Registration successfully Done");
			window.location = "'.base_url().'products/login";
			</script>';
    	}else{
    		echo '<script language="javascript" type="text/javascript">
			alert("Registration Failed");
			window.location = "'.base_url().'products/registration";
			</script>';
    	}
    }else{
    		
    		echo '<script language="javascript" type="text/javascript">
			alert("Please Fill up the Registration Form");
			window.location = "'.base_url().'products/registration";
			</script>';
    }
	}

	public function login()
	{
		
		$image_url="http://localhost/amazon/images/amazon.jpeg";
		$search_url="http://localhost/amazon/products/sign_in";
		$this->smarty->assign('search_url',$search_url);
		$this->smarty->assign('image_url',$image_url);
		$this->smarty->display('login.tpl');
	}

	public function sign_in()
	{
		if(!empty($this->input->post('emailormobile_no')) && !empty($this->input->post('password'))){
			$check_sign_in = $this->Product_model->check_email_mobile_no($this->input->post('emailormobile_no'),$this->input->post('password'));
			//print_r($check_sign_in);
			if(!empty($check_sign_in[0]['name'])){
			$data = array('username' =>$check_sign_in[0]['name']);
			$this->session->set_userdata($data);
			$cart_data_exists=$this->cart->contents();
			//print_r($cart_data_exists);die();
			if(!empty($cart_data_exists)){
			foreach($cart_data_exists as $value){
				if(isset($value['rowid'])){
					echo '<script language="javascript" type="text/javascript">
					alert("Login Sucessfully Done");
					window.location = "http://localhost/amazon/products/checkout";
					</script>';
				}else{

					echo '<script language="javascript" type="text/javascript">
					alert("Login Sucessfully Done");
					window.location = "http://localhost/amazon/";
					</script>';
					
				}
			}
		}else{
				echo '<script language="javascript" type="text/javascript">
				alert("Login Sucessfully Done");
				window.location = "http://localhost/amazon/";
				</script>';
    	}
		}else{
    		echo '<script language="javascript" type="text/javascript">
			alert("Login Failed");
			window.location = "'.base_url().'products/login";
			</script>';
    	}
		}else{
    		
    		echo '<script language="javascript" type="text/javascript">
			alert("Please Enter Form Details");
			window.location = "'.base_url().'products/login";
			</script>';
        }
	}

	public function logout(){
		$this->session->unset_userdata('username'); 
		echo '<script language="javascript" type="text/javascript">
			alert("Logout Successfully Done");
			window.location = "'.base_url().'products/login";
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

    function checkout(){
        $form_url="order_place";
        //print_r($this->cart->contents());die();
        $this->smarty->assign('form_url',$form_url);
        //$this->smarty->assign('url',$url);
        $this->smarty->assign('cart_array',$this->cart->contents());
        $this->smarty->display('product_cart.tpl');
    }

    public function seller_registration()
	{
		$get_country_code = $this->Product_model->get_country_code();
		$image_url="http://localhost/amazon/images/amazon.jpeg";
		$search_url="http://localhost/amazon/products/store";
		$autocomplete_js="http://localhost/amazon/js/seller.js";
		$this->smarty->assign('search_url',$search_url);
		$this->smarty->assign('image_url',$image_url);
		$this->smarty->assign('autocomplete_js',$autocomplete_js);
		$this->smarty->assign('country_code',$get_country_code);
		$this->smarty->display('seller_registration.tpl');
	}

}