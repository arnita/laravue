<template>
      

      
      <!-- left content -->
      <div id="left-content" class="col-md-8">
        <div class="article" v-for="row in dataHome">        
            <div class="col-md-4 article-img">
                  

                  <router-link :to="'/get_detail/' + row.post_id"><img :src="'/images/'+row.post_image"  width="300px" height="200px"><label class="label-img">{{row.category_name}}</label></router-link>
            </div> 

            <div class="col-md-8 article-content">
              <h2 class="left-title"><router-link :to="'/get_detail/' + row.post_id"> {{row.post_title}}</router-link></h2>
              <label class="author"><i class="fa fa-user"></i> {{row.post_author}}</label>
              <label class="time_article"> <i class="fa fa-calendar"></i> {{row.created_at | moment("dddd, D MMMM  YYYY")}}</label>
              

             <div class="article-val" v-html="$options.filters.word_cut(row.post_value)"> 
              </div><router-link :to="'/get_detail/' + row.post_id">[.......]</router-link>
             
              
            </div>
          <div style="clear: both;"></div>            
        </div>


       

      </div><!-- end left content-->



</template>
<script type="text/javascript">
  export default {
  data () {
    return{
        dataHome : []  
      }
  },
  created () {
    // fetch the data when the view is created and the data is
    // already being observed
    this.fetchData()
  },
  filters:{
    word_cut(val){
        if(val === null) 
          return null;
        else 
          return val.substr(0, val.lastIndexOf(' ', 200));
    }

  },

  watch: {
    // call again the method if the route changes
    '$route': 'fetchData'
  },
  methods: {
    fetchData (page) {
   
        var app = this;
        if(typeof page == 'undefined'){
          page = 1;
        }

        var param = this.$route.query.q;
        var app = this;
         axios.get('/api/getSearch/'+param)
            .then(function (resp){
            	   

            	   console.log(resp.data);
           		app.dataHome = resp.data;

            })
            .catch(function (resp){ 
                console.log('Error')
            })  

      }

  }
}
</script>