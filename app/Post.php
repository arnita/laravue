<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    //



    protected $fillable = ['post_id','post_title','post_hit','post_value','post_author','post_image','category_id'];
    protected $table = 'table_post';
    protected $primaryKey = 'post_id';


    // public function Category()
    // {
    //     return $this->belongsTo('App\Category');
    // } 
}
