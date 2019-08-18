<template>
    <!-- left content -->
      <div id="left-content" class="col-md-8">
  
          <div class="list-tutorial" >
              <h3>List Tutorial</h3>
              <div v-for="(month,index) in dataList.bulan">
              <h4><i class="fa fa-chevron-right"></i>{{month.name}}</h4>
              <ul>

                <li  v-for="(row,index) in listData" v-if="month.name == row.bulan">


                  <router-link :to="'/get_detail/' + row.post_id">{{row.post_title}}</router-link>
              
                </li>

              </ul>
              </div>
          </div>
      </div><!-- end left content-->
</template>
<script type="text/javascript">
export default {
  data () {
    return{
    
    listData :[],

    dataList:{
      bulan:[
      {name:'January'},
      {name:'February'},
      {name:'March'},
      {name:'April'},
      {name:'May'},
      {name:'June'},
      {name:'July'},
      {name:'August'},
      {name:'September'},
      {name:'October'},
      {name:'November'},
      {name:'December'},
      ]
    },
        
      }
  },
  mounted () {
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

  methods: {
    

    fetchData () {
    
        var app = this;
        var arlength = app.dataList.bulan.length;




         axios.get('/api/getList/')
            .then(function (resp){

                  app.listData = resp.data;



            })
            .catch(function (resp){ 
                console.log('Error')
            })  

    }
  }
}
</script>