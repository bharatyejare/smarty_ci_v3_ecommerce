<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Search_model extends CI_Model{
    function __construct() {
        $this->product_details = 'product_details';
        $this->categories_products = 'categories_products';
        $this->categories = 'categories';
        $this->db2=$this->load->database("ecommerce", TRUE);
    }

    function get_products_details($category,$product){
        $this->db2->select('pd.*');
        $this->db2->from($this->product_details.' as pd');
        $this->db2->join('categories_products','categories_products.product_id=pd.id');
        $this->db2->like('pd.name',$product);
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
        $this->db2->where('pd.id',$id);
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

    function check_email_mobile_no($emailormobileno){
        $this->db2->select('reg.*');
        $this->db2->from('registration as reg');
        $this->db2->where('reg.mobile_no',$emailormobileno);
        $this->db2->or_where('reg.email',$emailormobileno);
        $query = $this->db2->get();
        //print_r($this->db2->last_query());
        $result = ($query->num_rows() > 0)? $query->result_array():"failed";
        //return fetched data
        return $result;
    }

}