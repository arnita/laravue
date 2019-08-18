<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


    Route::get('/', function () {
          $category = DB::table('table_post')
        ->join('table_category', 'table_post.category_id', '=', 'table_category.category_id')
        ->select('table_category.category_name as category_name','table_category.category_id',  DB::raw("count(table_post.category_id) as tot_cat"))
        ->groupBy('table_post.category_id','category_name','category_id')
        ->get();
        $post = DB::table('table_post')->take(5)->orderBy('post_id','desc')->get();

        return view('frontend')->with('post',$post)->with('category',$category);
    });


    Route::get('/about_us',function(){
          $category = DB::table('table_post')
        ->join('table_category', 'table_post.category_id', '=', 'table_category.category_id')
        ->select('table_category.category_name as category_name','table_category.category_id',  DB::raw("count(table_post.category_id) as tot_cat"))
        ->groupBy('table_post.category_id','category_name','category_id')
        ->get();
        $post = DB::table('table_post')->take(5)->orderBy('post_id','desc')->get();

        return view('frontend')->with('post',$post)->with('category',$category);
    });




    Route::get('/home', function () {
        $category = DB::table('table_post')
        ->join('table_category', 'table_post.category_id', '=', 'table_category.category_id')
        ->select('table_category.category_name as category_name','table_category.category_id',  DB::raw("count(table_post.category_id) as tot_cat"))
        ->groupBy('table_post.category_id','category_name','category_id')
        ->get();
        $post = DB::table('table_post')->take(5)->orderBy('post_id','desc')->get();

        return view('frontend')->with('post',$post)->with('category',$category);
    });


    Route::get('/list_tutorial', function () {
        $category = DB::table('table_post')
        ->join('table_category', 'table_post.category_id', '=', 'table_category.category_id')
        ->select('table_category.category_name as category_name','table_category.category_id',  DB::raw("count(table_post.category_id) as tot_cat"))
        ->groupBy('table_post.category_id','category_name','category_id')
        ->get();
        $post = DB::table('table_post')->take(5)->orderBy('post_id','desc')->get();

        return view('frontend')->with('post',$post)->with('category',$category);
    });


    Route::get('/download', function () {
        $category = DB::table('table_post')
        ->join('table_category', 'table_post.category_id', '=', 'table_category.category_id')
        ->select('table_category.category_name as category_name','table_category.category_id',  DB::raw("count(table_post.category_id) as tot_cat"))
        ->groupBy('table_post.category_id','category_name','category_id')
        ->get();
        $post = DB::table('table_post')->take(5)->orderBy('post_id','desc')->get();

        return view('frontend')->with('post',$post)->with('category',$category);
    });


    Route::get('/get_category/{id}', function () {
        $category = DB::table('table_post')
        ->join('table_category', 'table_post.category_id', '=', 'table_category.category_id')
        ->select('table_category.category_name as category_name','table_category.category_id',  DB::raw("count(table_post.category_id) as tot_cat"))
        ->groupBy('table_post.category_id','category_name','category_id')
        ->get();
        $post = DB::table('table_post')->take(5)->orderBy('post_id','desc')->get();

        return view('frontend')->with('post',$post)->with('category',$category);
    });

    Route::get('/get_detail/{id}', function () {
        $category = DB::table('table_post')
        ->join('table_category', 'table_post.category_id', '=', 'table_category.category_id')
        ->select('table_category.category_name as category_name','table_category.category_id',  DB::raw("count(table_post.category_id) as tot_cat"))
        ->groupBy('table_post.category_id','category_name','category_id')
        ->get();
        $post = DB::table('table_post')->take(5)->orderBy('post_id','desc')->get();

        return view('frontend')->with('post',$post)->with('category',$category);
    });


    Route::get('/searching', function () {
        $category = DB::table('table_post')
        ->join('table_category', 'table_post.category_id', '=', 'table_category.category_id')
        ->select('table_category.category_name as category_name','table_category.category_id',  DB::raw("count(table_post.category_id) as tot_cat"))
        ->groupBy('table_post.category_id','category_name','category_id')
        ->get();
        $post = DB::table('table_post')->take(5)->orderBy('post_id','desc')->get();

        return view('frontend')->with('post',$post)->with('category',$category);
    });
Auth::routes();
Route::get('{path}', function () {
    return view('admin');
})->where( 'path', '[\/\w\.-]*' )->middleware('auth');

