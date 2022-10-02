<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Country_model extends CI_Model{
    function __construct() {
        $this->countryTbl = 'countries';
        $this->stateTbl = 'states';
        $this->cityTbl = 'cities';
        $this->categoriesTbl = 'categories';
        $this->db2=$this->load->database("ecommerce", TRUE);
    }

    function getCountryRows(){
        $this->db->select('c.id, c.country_name');
        $this->db->from($this->countryTbl.' as c');
        $query = $this->db->get();
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;

        //return fetched data
        return $result;
    }

    function getcategories(){
        $this->db2->select('ca.iCategoryId, ca.vCategoryName');
        $this->db2->from($this->categoriesTbl.' as ca');
        $query = $this->db2->get();
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;

        //return fetched data
        return $result;
    }

    function getStateRows($params = array()){
        $this->db->select('s.id, s.state_name');
        $this->db->from($this->stateTbl.' as s');
        
        //fetch data by conditions
        if(array_key_exists("conditions",$params)){
            foreach ($params['conditions'] as $key => $value) {
                if(strpos($key,'.') !== false){
                    $this->db->where($key,$value);
                }else{
                    $this->db->where('s.'.$key,$value);
                }
            }
        }
        
        $query = $this->db->get();
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;

        //return fetched data
        return $result;
    }
    
    /*
     * Get city rows from the countries table
     */
    function getCityRows($params = array()){
        $this->db->select('c.id, c.city_name');
        $this->db->from($this->cityTbl.' as c');
        
        //fetch data by conditions
        if(array_key_exists("conditions",$params)){
            foreach ($params['conditions'] as $key => $value) {
                if(strpos($key,'.') !== false){
                    $this->db->where($key,$value);
                }else{
                    $this->db->where('c.'.$key,$value);
                }
            }
        }
        
        $query = $this->db->get();
        $result = ($query->num_rows() > 0)?$query->result_array():FALSE;

        //return fetched data
        return $result;
    }

    function form_insert($data){
    $id=$this->db->insert('personal_details', $data);
    return $id;
    }
}