<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/userguide3/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'welcome';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
$route['loop'] = 'welcome/loop';
$route['products'] = 'products/search_products';
$route['seller_account'] = 'sellers/seller_registration';
$route['seller_login'] = 'sellers/login';
$route['create_product'] = 'sellers/create_product';
$route['brand_listing'] = 'sellers/brand_listing';
$route['company_listing'] = 'sellers/company_listing';
$route['category_listing'] = 'sellers/category_listing';
$route['add_product'] = 'sellers/add_product';
$route['logout'] = 'sellers/logout';
$route['product_listing'] = 'sellers/product_listing';
// $route['upload'] = 'Upload_Controller/custom_view';
// $route['do_upload'] = 'Upload_Controller/do_upload';
// $route['do_upload'] = 'Upload_Controller/do_upload';