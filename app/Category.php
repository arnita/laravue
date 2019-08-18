<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    //

    
    protected $fillable = ['category_id','category_name','category_description'];
    protected $table = 'table_category';
    protected $primaryKey = 'category_id';


 
}
