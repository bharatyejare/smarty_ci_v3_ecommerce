<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Product_model extends CI_Model{
    function __construct() {
        $this->product_details = 'product_details';
        $this->categories_products = 'categories_products';
        $this->sub_products = 'sub_products';
        $this->categories = 'categories';
        $this->db2=$this->load->database("ecommerce", TRUE);
    }

    function get_products_details($category,$product){
        $this->db2->select('pd.*');
        $this->db2->from($this->product_details.' as pd');
        $this->db2->join('categories','categories.iCategoryId=pd.iProductCategory');
        $this->db2->like('pd.vName',$product);
        //$this->db2->like('pd.brand',$product);
        //$this->db2->like('categories.id',$category);
        $query = $this->db2->get();
        //print_r($this->db2->last_query());die();
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;

        //return fetched data
        return $result;
    }

    function get_kitchen_categories($category){
        $this->db2->select('pd.*');
        $this->db2->from($this->product_details.' as pd');
        $this->db2->join('categories_products','categories_products.product_id=pd.iProductId');
        $this->db2->like('categories_products.category_id',$category);
        //$this->db2->like('pd.brand',$product);
        //$this->db2->like('categories.id',$category);
        $query = $this->db2->get();
        //print_r($this->db2->last_query());
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;

        //return fetched data
        return $result;
    }

    function get_change_details($id){
        $this->db2->select('subpd.*');
        $this->db2->from($this->sub_products.' as subpd');
        $this->db2->like('subpd.sub_prod_id',$id);
        //$this->db2->like('pd.brand',$product);
        //$this->db2->like('categories.id',$category);
        $query = $this->db2->get();
        //print_r($this->db2->last_query());
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;

        //return fetched data
        return $result;
    }

    function get_display_brands($brands){
        $this->db2->select('pd.*');
        $this->db2->from($this->product_details.' as pd');
        $this->db2->like('pd.vBrand',$brands);
        //$this->db2->like('pd.brand',$product);
        //$this->db2->like('categories.id',$category);
        $query = $this->db2->get();
        //print_r($this->db2->last_query());
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;

        //return fetched data
        return $result;
    }

    function get_all_products(){
        $ids=array(1,2,4);
        $this->db2->select('pd.*');
        $this->db2->from($this->product_details.' as pd');
        $this->db2->join('categories_products','categories_products.product_id=pd.iProductId');
        $this->db2->where_in('category_id', $ids);
        //$this->db->group_by('pd.name');
        //$this->db2->like('categories.id',$category);
        $query = $this->db2->get();
        //print_r($query->num_rows());
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;

        //return fetched data
        return $result;
    }

    function get_single_products_details($id){
        $this->db2->select('pd.*');
        $this->db2->from($this->product_details.' as pd');
        $this->db2->where('pd.iProductId',$id);
        $query = $this->db2->get();
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;
        //return fetched data
        return $result;
    }

    function get_single_product($id){
        $this->db2->select('cp.*');
        $this->db2->from($this->categories_products.' as cp');
        $this->db2->where('cp.product_id',$id);
        $query = $this->db2->get();
        //echo "<pre>";print_r($this->db2->last_query());die();
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;
        //return fetched data
        return $result;
    }

     function get_single_category($id){
        $this->db2->select('c.*');
        $this->db2->from($this->categories.' as c');
        $this->db2->where('c.id',$id);
        $query = $this->db2->get();
        //echo "<pre>";print_r($this->db2->last_query());die();
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;
        //return fetched data
        return $result;
    }
    

    function get_multiple_products_details($id){
        $this->db2->select('subpd.*');
        $this->db2->from($this->sub_products.' as subpd');
        $this->db2->where('subpd.product_id',$id);
        $query = $this->db2->get();
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;
        //return fetched data
        return $result;
    }

    function get_qty(){
        $this->db2->select('qt.*');
        $this->db2->from('qty as qt');
        $query = $this->db2->get();
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;
        //return fetched data
        return $result;
    }

    function get_country_code(){
        $this->db2->select('cc.*');
        $this->db2->from('country_code as cc');
        $query = $this->db2->get();
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;
        //return fetched data
        return $result;
    }
   
    function user_registration($data){
    $id=$this->db2->insert('registration', $data);
    return $id;
    }

    function order_confirmation($data){
      $order_id=$this->db2->insert('orders', $data);
      //print_r($this->db2->last_query());die();
      $lastId = $this->db2->insert_id(); /* get last inserted id */
      return $lastId;
    }

    function get_mail_exist($email){

        $this->db2->select('reg.*');
        $this->db2->from('registration as reg');
        $this->db2->where('reg.email',$email);
        $query = $this->db2->get();

        $result = ($query->num_rows() > 0)? "exists":"no_exists";
        //return fetched data
        return $result;
    }

    function get_order($id){

        $this->db2->select('ord.*,product_details.item_image');
        $this->db2->from('orders as ord');
        $this->db2->join('product_details', 'product_details.id = ord.product_id');
        $this->db2->where('ord.order_id',$id);
        $query = $this->db2->get();
         //print_r($this->db2->last_query());die();
        $result = ($query->num_rows() > 0)? $query->result_array():"no_exists";
        //return fetched data
        return $result;
    }

    function get_mobile_exist($mobile_no){
        $this->db2->select('reg.*');
        $this->db2->from('registration as reg');
        $this->db2->where('reg.mobile_no',$mobile_no);
        $query = $this->db2->get();
        $result = ($query->num_rows() > 0)? "exists":"no_exists";
        //return fetched data
        return $result;
    }

    function check_email_mobile_no($emailormobileno,$password){
        $this->db2->select('reg.*');
        $this->db2->from('registration as reg');
        $this->db2->where('reg.mobile_no',$emailormobileno);
        $this->db2->or_where('reg.email',$emailormobileno);
        $this->db2->where('reg.password',$password);
        $query = $this->db2->get();
        //print_r($this->db2->last_query());
        $result = ($query->num_rows() > 0)? $query->result_array():"failed";
        //return fetched data
        return $result;
    }

    function create_product($data){
        try {  
        $id=$this->db2->insert('product_details', $data);
        return $this->db2->insert_id();
        }catch(Exception $e) {
            echo $e->getMessage();
        }
    }

    function get_product_listing(){
        $this->db2->select('pd.*');
        $this->db2->from('product_details as pd');
        $query = $this->db2->get();
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;
        //return fetched data
        return $result;
    }

}