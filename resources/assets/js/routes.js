import VueRouter from 'vue-router';

let routes = [
	
	{
		path:'/category',
		component:require('./components/administrator/Category.vue'),
		meta:{title:'Page - Category'}
	},
	{
		path:'/post',
		component:require('./components/administrator/Post.vue'),
		meta:{title:'Page - Post'}
	},
	{
		path:'/admin',
		component:require('./components/administrator/Dashboard.vue'),
		meta:{title:'Page - Dashboad'}
	},
	{
		path:'/home',
		component:require('./components/frontend/Home.vue'),
		meta:{title:'Page - Dashboad'}
	},
	{
		path:'/',
		component:require('./components/frontend/Home.vue'),
		meta:{title:'Page - Dashboad'}
	},
	{
		path:'/list_tutorial',
		component:require('./components/frontend/ListTutorial.vue'),
		meta:{title:'Page - Dashboad'}
	},

	{
		path:'/download',
		component:require('./components/frontend/Download.vue'),
		meta:{title:'Page - Dashboad'}
	},
	{
		path:'/get_category/:id',
		component:require('./components/frontend/GetCategory.vue'),
		meta:{title:'Page - Dashboad'}
	},	
	{
		path:'/get_detail/:id',
		component:require('./components/frontend/GetDetail.vue'),
		meta:{title:'Page - Dashboad'}
	},

	{
		path:'/about_us',
		component:require('./components/frontend/AboutUs.vue'),
		meta:{title:'Page - Dashboad'}
	},
	{
		path:'/searching',
		component:require('./components/frontend/Searching.vue'),
		meta:{title:'Page - Searching'}
	},


	{
		path:'*',
		component:require('./components/frontend/NotFound.vue'),
		meta:{title:'Page - NotFound'}
	}



	
]

export default new VueRouter({
	routes,
	mode:'history'
})