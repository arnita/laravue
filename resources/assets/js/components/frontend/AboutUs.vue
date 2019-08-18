<template>
    <!-- left content -->
      <div id="left-content" class="col-md-8">
  
          <div class="aboutus-content">
            <p class="about-me">
          "

          Hallo perkenalkan saya Arief Manggala Putra , semoga dengan blog ini bisa membuat sesuatu yang bermanfaat bagi nusa dan bangsa  :) 
          <br>JOsssssss .


          "  
        </p>

        <p class="contact-me">
          Contact Me : 
          <br>
          Arief Manggala Putra (089603800164)
          <br>
          Email manggala.corp@gmail.com
        </p>

        <div class="form-contact">
              <h4>  Contact Form : </h4>
              <div>
                <form>
                  <div>
                    <input type="text" name="name" placeholder="Name">
                  </div>
                  <br>
                  <div>
                    <input type="text" name="subject" placeholder="Subject">
                  </div>
                  <br>
                  <div>
                    <input type="text" name="email" placeholder="Email">
                  </div>
                  <br>
                    <textarea name="message" placeholder="Message"></textarea>
                  <br>
                  <br>
                  <button type="submit"> Send </button>
                </form>
              </div>
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