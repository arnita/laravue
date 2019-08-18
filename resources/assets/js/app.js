
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

import router from './routes.js'
require('./bootstrap');


import VueRouter from 'vue-router';
import VueSwal from 'vue-swal';
import Spinner from 'vue-simple-spinner';
import FontAwesome from 'vue-awesome';
import VueQuillEditor from 'vue-quill-editor'
import Vue from 'vue';
import VueMoment from 'vue-moment';







window.Vue = require('vue');
window.Vue.use(VueRouter);
window.Vue.use(VueMoment);
window.Vue.use(VueSwal)
window.Vue.use(Spinner)
window.Vue.use(FontAwesome)
Vue.use(VueQuillEditor, /* { default global options } */)

  import 'quill/dist/quill.core.css'
  import 'quill/dist/quill.snow.css'
  import 'quill/dist/quill.bubble.css'
  
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */


// Vue.component('rightContent', require('./components/ExampleComponent.vue'));
Vue.component('vue-simple-spinner', require('vue-simple-spinner'));
Vue.component('vue-pagination', require('laravel-vue-pagination'));

const app = new Vue({
    el: '#app',
    router,
    
	 data: function(){
          return {

            query:'',
          }
        },
    methods:{
    	search:function(e)
    	{
    		          

            this.$router.push('/searching?q='+this.query);
	

   //  		axios.get('api/searchPostArtikel?q='+this.query)
   //  		.then(function(resp){
   //  			console.log('success');
   //  			console.log(resp);
   //                                //  router.go('/list_tutorial')
   // this.$route.router.go('/list_tutorial');


   //  		})
   //  		.catch(function(resp){
   //  			console.log('error')
   //  		})
    		

    	}
    }
});
router.beforeEach((to, from, next) => {
    document.title = to.meta.title

    next()
});
