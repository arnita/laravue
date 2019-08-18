<?php

namespace App\Http\Controllers;

use App\Post;
use App\Category;
use Image;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth as Auth;


class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        
                
        $validatedData = $request->validate([
                'post_title' => 'required',
                'post_value' => 'required',
                'category_id' => 'required',
                'post_image'=>'required'
            ]);


          $image = $request->get('post_image');
          $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
          \Image::make($request->get('post_image'))->save(public_path('images/').$name);
        $post = Post::create(['post_value'=>$request->post_value,'post_title'=>$request->post_title,'category_id'=>$request->category_id,'post_hit'=>1,'post_author'=>'arief','post_image'=>$name]);

        return $post;


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        //
        //return $post = Post::paginate(10);
       
        return $post_ = DB::table('table_post')
                ->join('table_category','table_post.category_id','=','table_category.category_id')
                ->select('*')
                ->paginate(10);
        



    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //

        return $data = Post::find($id);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        
        $find = Post::findOrFail($id);
        $imageOld = $find->post_image;
        if($imageOld === $request->post_image)
        {
            $find->post_value = $request->post_value;
            $find->post_title = $request->post_title;
            $find->category_id = $request->category_id;
            $find->save();
            return response()->json($find,200);

        }
        else
        {
            $image = $request->post_image;
             $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
            \Image::make($request->get('post_image'))->save(public_path('images/').$name);
            $find->post_value = $request->post_value;
            $find->post_image = $name;
            $find->post_title = $request->post_title;
            $find->category_id = $request->category_id;
            $find->save();
            return response()->json($find,200);
        }



    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $data = 0;


        if(!empty($id))
        { 

            $image = DB::table('table_post')->where('post_id', $id)->first();
            @unlink(public_path('images/').$image->post_image);
        
            $data = Post::destroy($id);
            return $data;
        }
    }

    public function search(Request $request)
    {        

        $data = Post::where('post_title','LIKE',"%$request->q%")->get();

        return $data;
    }

    public function searchPostArtikel(Request $request)
    {        


         $data = Post::where('post_title','LIKE',"%$request->q%")->get();


         return $data;
    }

    public function getCategory()
    {
        return Category::all();
    }


    public function getCategoryDetail($id)
    {
        
        return $data = DB::table('table_post as a')
                        ->join('table_category as b','a.category_id','=','b.category_id')
                        ->select('a.*','b.category_name')
                        ->where('b.category_id',$id)->get();
    }    

    public function getDetail($id)
    {
        
        return $data = DB::table('table_post as a')
                        ->join('table_category as b','a.category_id','=','b.category_id')
                        ->select('*')
                        ->where('a.post_id',$id)->get();

    }

     public function getSearch($param)
    {
        
        
        return $data = DB::table('table_post as a')
                        ->join('table_category as b','a.category_id','=','b.category_id')
                        ->select('*')
                        ->where('a.post_title','like','%'.$param.'%')->get();

    }

       public function getTerkait($id)
    {
        
        
        return $data = DB::table('table_post as a')
                        ->join('table_category as b','a.category_id','=','b.category_id')
                        ->select('*')
                        ->where('b.category_id',$id)->get();

    }

    public function getList()
    {

        $year =  date('Y');
        return $data = DB::table('table_post')->select('post_id','post_title','post_author','post_image','post_value','post_hit','created_at',DB::raw('MONTHNAME(created_at) AS bulan'))->where(DB::raw('YEAR(created_at)'),$year)->orderBy('post_id','desc')->get();
    }


}
