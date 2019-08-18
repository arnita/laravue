<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
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
                'category_name' => 'required',
                'category_description' => 'required',
            ]);
        $category = Category::create(['category_name'=>$request->category_name,'category_description'=>$request->category_description]);


        
        return $category;


      
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        //
       // $data = DB::table('table_category')->paginate(10);

       //  return $data;

        return Category::orderBy('category_id','desc')->paginate(10);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //

        return $data = Category::find($id);


    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        //
        $category = Category::findOrFail($id);
        $category->category_name = $request->category_name;
        $category->category_description = $request->category_description;
        $category->save();
        return response()->json($category,200);
    }


    public function search(Request $request)
    {
        $data = Category::where('category_name','LIKE',"%$request->q%")->get();


        return $data;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $data = 0;

        
        if(!empty($id))
        {
            $data = Category::destroy($id);
            return $data;
        }
        

    }
}
