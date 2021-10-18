<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['middleware' => ['web']], function () {
    Route::post('login','ServiceController@login');  
    Route::post('register','ServiceController@userregister');  
    
    Route::post('getallmovie','ServiceController@allMovie');
    Route::post('timeAndSheat','ServiceController@getAlltimeAndSheat');
    Route::post('booking','ServiceController@booking');
    Route::get('listoftheatres','ServiceController@listoftheatres');
       
});
  

