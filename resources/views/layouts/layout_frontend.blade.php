<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>Arief Manggala Putra</title>

        <!-- Fonts -->
        <link href="{{ asset('css/style.css') }}" rel="stylesheet">
        <link rel="stylesheet" href="{{ asset('css/font/css/font-awesome.min.css') }}">
        <link href="{{ asset('css/bootstrap-grid.css') }}" rel="stylesheet">
        <link rel="dns-prefetch" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

       

        <!-- Styles -->
        <script src="{{ asset('js/app.js') }}" defer></script>
    </head>
<body>
    
<div id="app">
<!-- Header -->
  <header id="header">
      <div class="wrapper">
        <div class="logo">
          <a href="">Arief Manggala Putra </a>
        </div>
        <div class="nav">
            <ul>
                 <router-link to="/home" tag="li" exact-active-class="is-active"><a  class="nav-link">Home</a> </router-link>
                 <router-link to="/list_tutorial" tag="li" exact-active-class="is-active"><a  class="nav-link">List Tutorial</a> </router-link>
                 <router-link to="/download" tag="li" exact-active-class="is-active"><a  class="nav-link">Download</a> </router-link>
                 <router-link to="/about_us" tag="li" exact-active-class="is-active"><a  class="nav-link">About Us</a> </router-link>
            </ul>
        </div>
      </div>
      <div style="clear:both"></div>        
  </header> <!--end header-->


  <!-- Slider -->
  <div id="slider">
      <label class="slider_txt">[ Ikatlah Ilmu Dengan Menulis ] <span style="color:red">*</span></label>
  </div> <!-- end Slider-->


<template>
      

<!-- Content -->
  <div id="content" class="wrapper">
      
      <!-- left content -->
        	@yield('content')
      <!-- end left content -->


<!-- Right Content-->

      <div id="right-content" class="col-md-4">


        <div class="search-side">
            <h3 class="title-search-post">Search Post</h3>
            <div class="search-post">
                <form action="">
                  <input type="text"  v-model="query"  name="search" placeholder="Search Post ..">
                  <button type="button"@click="search()"><i class="fa fa-search"></i> Search </button>
                </form>
            </div>
        </div>



        <!--recent sode-->
        <div class="recent-side">
            <h3 class="title-recent-post">Recent Post</h3>

            @foreach($post as $dt)
              <div class="recent-post">
                <div class="recent-post-img">
                    <img src="<?php echo asset("/images/$dt->post_image")?>" width="100" height="70">
                </div>
                <div class="recent-post-article">
                    
                    <h4><router-link to="/get_detail/{{$dt->post_id}}" tag="li"><a  class="nav-link"><i class="fa fa-chevron-right"></i> {{$dt->post_title}}</a> </router-link></h4>

                    <label class="time_article"> <i class="fa fa-calendar"></i> <?php echo date('d F Y', strtotime($dt->created_at)); ?></label>
                </div>
                <div style="clear: both;"></div>
              </div>
            @endforeach
            
        </div><!--end recent side-->


        <div class="category-side">
          <h3 class="title-category">Category</h3>
          <div class="list-category">
              <ul>
                @foreach($category as $cat)
                  
                  <router-link to="/get_category/{{$cat->category_id}}" tag="li"><a  class="nav-link"><i class="fa fa-chevron-right"></i> {{$cat->category_name}} ({{$cat->tot_cat}})</a> </router-link>



                @endforeach
              </ul>
          </div>
        </div>

      </div><!-- end right content -->
  </div><!-- end Content-->
</template>



  <div style="clear: both;"></div>
	
  <footer id="footer">
      <p> &copy; Copyright Arief Manggala Putra</p>
  </footer>

  </div>
</body>

</html>
