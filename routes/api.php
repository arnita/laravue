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
Route::resource('/category','CategoryController',['except'=>'show','store']);
Route::get('/category','CategoryController@show');
Route::delete('/category/{id}','CategoryController@destroy');
Route::get('searchCategory','CategoryController@search');
Route::get('editCategory/{id}','CategoryController@edit');


Route::resource('/post','PostController',['except'=>'show','store']);
Route::get('/post','PostController@show');
Route::get('/getList','PostController@getList');
Route::get('/getCategory','PostController@getCategory');
Route::delete('/post/{id}','PostController@destroy');
Route::get('searchPost','PostController@search');
Route::get('searchPostArtikel','PostController@searchPostArtikel');
Route::get('editPost/{id}','PostController@edit');

Route::get('getCategoryDetail/{id}','PostController@getCategoryDetail');
Route::get('getDetail/{id}','PostController@getDetail');
Route::get('getSearch/{id}','PostController@getSearch');
Route::get('getTerkait/{id}','PostController@getTerkait');

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
