<template>  
  <div id="left-content" class="col-md-8" >
      <div class="article-detail">

        		<div class="article-detail-post">
		      		<h4> {{dataDetail.post_title}} </h4>
		      		<label><i class="fa fa-user"></i> Author : {{dataDetail.post_author}} </label>
		      		<label><i class="fa fa-calendar"></i> Date : {{dataDetail.post_date | moment("dddd, D MMMM  YYYY")}} </label> 
		      		<br><br>

		      		
					<img :src="'/images/'+dataDetail.post_image"  width="100%" height="400px">
	      			<p v-html="dataDetail.post_value">
	      				
	      			</p>
				</div>

				<div class="article-detail-related">
					<h4>Artikel Terkait</h4>
					<ul v-for="row in dataTerkait">



            <li><router-link :to="'/get_detail/'+row.post_id"><i class="fa fa-chevron-right"></i> {{row.post_title}}</router-link></li>


					</ul>
				</div>


      			<div id="disqus_thread"></div>
				
				<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>

      		</div>






      </div><!-- end left content-->
</template>
<script type="text/javascript">
export default {
  data () {
    return{
        dataDetail :{
        	post_title:'',
        	post_author:'',
        	post_date :'',
        	post_value :'',
        	post_image :''
        },
        dataTerkait : '',
        idTerkait:'',
      }
  },
  created () {
    // fetch the data when the view is created and the data is
    // already being observed
    this.fetchData();
    
  },
  watch: {
    // call again the method if the route changes
    '$route': 'fetchData'
  },
  methods: {
    fetchData () {
   
        var param = this.$route.params.id;
        var app = this;
         axios.get('/api/getDetail/'+param)
            .then(function (resp){

              app.dataDetail.post_title =resp.data[0].post_title ;  
              app.dataDetail.post_author =resp.data[0].post_author ;  
              app.dataDetail.post_date =resp.data[0].created_at ;  
              app.dataDetail.post_value =resp.data[0].post_value ;  
              app.dataDetail.post_image =resp.data[0].post_image ;  

              app.idTerkait = resp.data[0].category_id;


              app.getTerkait(app.idTerkait);
              
                
            })
            .catch(function (resp){ 
                console.log('Error')
            })  

    },


    getTerkait(id)
    {

        
        
        var app =this;
         axios.get('/api/getTerkait/'+id)
            .then(function (resp){
                app.dataTerkait = resp.data;

                
            })
            .catch(function (resp){ 
                console.log('Error')
            })   
    }
  }
}
</script>