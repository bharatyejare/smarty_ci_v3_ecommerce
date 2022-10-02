<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

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
        $this->load->model('Country_model');
        $this->load->model('Product_model');
        $this->load->library('form_validation');
    }
    

	public function index()
	{
		
		$search_url=base_url().'products/index';
		$this->smarty->assign('search_url',$search_url);
		$categories = $this->Country_model->getcategories();
		$display_products = $this->Product_model->get_all_products();
		$kitchen_products = $this->Product_model->get_kitchen_categories(6);
		//echo "<pre>";print_r($display_products);
		$username=$this->session->userdata('username');
		$this->smarty->assign('username',$username);
		$this->smarty->assign('categories',$categories);
		$this->smarty->assign('display_products',$display_products);
		$this->smarty->assign('kitchen_products',$kitchen_products);
		$this->smarty->assign('copyright','© 1996-2022, Amazon.com, Inc. or its affiliates');
		$this->smarty->display('index.tpl');
		$this->smarty->assign('cart_array',$this->cart->contents());
		$this->smarty->display('product_cart.tpl');

	}

	public function loop()
	{	
		$url=base_url().'welcome/store';
		$this->smarty->assign('url',$url);
		$countries = $this->Product_model->getCountryRows();
		$this->smarty->assign('countries',$countries);
		$this->smarty->display('loop.tpl');
	}

	public function getStates(){
        $states = array();
        $country_id = $this->input->get('country_id');
        //echo $country_id;die();
        if($country_id){
            $con['conditions'] = array('country_id'=>$country_id);
            $states = $this->Product_model->getStateRows($con);
            
        }
        if(!empty($states)){
        		//echo count($states);
        	echo '<select name="state" id="state">';
        	echo '<option value="-1">Select State</option>'; 
        	for($k=0;$k<count($states);$k++){
        		echo '<option value="'.$states[$k]['id'].'">'.$states[$k]['state_name'].'</option>';
        	}
        	echo '</select>';
        	}
        	
    }

    public function getcitites(){
		//echo "dd";
        $cities = array();
        $state_id = $this->input->get('state_id');
        //echo $state_id;die();
        if($state_id){
            $con['conditions'] = array('state_id'=>$state_id);
            $cities = $this->Product_model->getCityRows($con);
            
        }
        if(!empty($cities)){
        		//echo count($states);
        	echo '<select name="city" id="city">';
        	echo '<option value="-1">Select City</option>'; 
        	for($k=0;$k<count($cities);$k++){
        		echo '<option value="'.$cities[$k]['id'].'">'.$cities[$k]['city_name'].'</option>';
        	}
        	echo '</select>';
        	}
        	
    }


    public function store(){
    	if(!empty($this->input->post('name')) && !empty($this->input->post('country')) && !empty($this->input->post('state')) &&!empty($this->input->post('city'))){
		$data = array(
		'name' => $this->input->post('name'),
		'country' => $this->input->post('country'),
		'state' => $this->input->post('state'),
		'city' => $this->input->post('city')
		);
    	$id=$this->Product_model->form_insert($data);
    	if(!empty($id)){
			echo '<script language="javascript" type="text/javascript">
			alert("Data successfully Inserted");
			window.location = "'.base_url().'loop";
			</script>';
    	}else{
    		echo '<script language="javascript" type="text/javascript">
			alert("Data Failed");
			window.location = "'.base_url().'loop";
			</script>';
    	}
    }else{

    		echo '<script language="javascript" type="text/javascript">
			alert("Please select field");
			window.location = "'.base_url().'loop";
			</script>';
    }
    }
}

