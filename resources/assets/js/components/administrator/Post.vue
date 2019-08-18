	<template>
    <div class="container-fluid">
        <div class="container">
        	<div class="row">
        		<div class="col-md-5">
        			<div class="card">
        				<div class="card-header">
        					Tutorial Form
        				</div>
        				<div class="card-body">
        					<form @submit.prevent = "savePost">
        						<div class="form-group" :class="{'has-error':errors.post_title}">
                      <label for="post_title">Post Title<span class="text-danger">*</span></label>
                      <input type="text" name="post_title" class="form-control" placeholder="Post Title" autofocus v-model="postInput.post_title">
                      <div class="help-block" v-if="errors.post_title">
                        <div v-for="error in errors.post_title"><strong>{{error}}</strong></div>
                      </div>
                    </div>

                    <div class="form-group" :class="{'has-error':errors.category_id}">
        							<label for="category_id">Post Title<span class="text-danger">*</span></label>
                      <select class="form-control" v-model="postInput.category_id">
                        <option v-for="item in data_cat" :value="item.category_id"> {{item.category_name}}  </option>
                      </select>
        							<div class="help-block" v-if="errors.category_id">
        								<div v-for="error in errors.category_id"><strong>{{error}}</strong></div>
        							</div>
        						</div>

        						<div class="form-group" :class="{'has-error':errors.post_image}">
        							<label for="post_image">Post Image<span class="text-danger">*</span></label>
        						
						            <div v-if="!postInput.post_image">
                        	<input type="file" @change="avatarChange" name="">
                        </div>
                        <div v-else>

                        	<div v-if="!edit">
                          	<img :src="postInput.post_image" width="100" height="100">
                              <button @click="removeImage" type="button" class="btn btn-warning"> <i class="fa fa-trash"></i> </button>
                            </div>
                            <div v-if="edit">
                            	<p><input type="file" ref="fileinput" @change="avatarChangeEd"></p>
                              <img :src="'/images/'+postInput.post_image" width="100"  v-show="imgOri">

                             <img :src="postInput.post_image" width="100" height="100" v-show="tempImg">
                        	 </div>
                        </div>
		                           
		                      <div class="help-block" v-if="errors.post_image">
        								        <div v-for="error in errors.post_image"><strong>{{error}}</strong></div>
        							     </div> 	
 								    </div>


        						<div class="form-group" :class="{'has-error':errors.post_value}">
        							<label for="post_image">Post News<span class="text-danger">*</span></label>
	  								  <quill-editor ref="myTextEditor" rows="5"
                            v-model="postInput.post_value"
                            :options="editorOption"
                            @blur="onEditorBlur($event)"
                            @focus="onEditorFocus($event)"
                            @ready="onEditorReady($event)">
                    	</quill-editor>     
	                            	<div class="help-block" v-if="errors.post_value">
        								<div v-for="error in errors.post_value"><strong>{{error}}</strong></div>
        							</div> 						
	                            </div>
	             

	                           <div class="tex-left">
	                           		<button type="submit" class="btn btn-primary" v-if="!edit">Save</button>
	                           		<button type="button" class="btn btn-primary" v-if="edit" @click="updatePost(postInput.post_id)">Update</button>
	                           		<button type="button" class="btn btn-warning" @click="clearForm">Reset</button>
	                           </div>

        					</form>
        				</div>
        			</div>
        		</div>
        		<div class="col-md-7">
        			<div class="card">
        				<div class="card-header">Table Tutorial</div>
        				<div class="card-body">
        					<div class="form-group form-float">
        						<div id="imaginary_container">
        							<div class="input-group stylish-input-group">
        								<input type="text" class="form-control" placeholder="Search Post" v-model="search">
        								<span class="input-group-addon">
        									<button type="submit" class="btn btn-primary">
        										<i class="fa fa-search"></i>
        									</button>
        								</span>
        							</div>
        						</div>
        					</div>
        					<table class="table table-bordered">
        						<thead>
	        						<tr>
                        <td>Post Title</td>
	        							<td>Post Category</td>
	        							<td>Post Author</td>
	        							<td>Post Image</td>
	        							<td>Post Hit</td>
	        							<td>Action</td>
	        						</tr>
	        					</thead>
	        					<tbody class="data-ada" v-if="postShow.length">
	        						<tr v-for="row,index in postShow">
                        <td>{{row.post_title}}</td>
	        							<td>{{row.category_name}}</td>
	        							<td>{{row.post_author}}</td>
	        							<td><img :src="'/images/'+row.post_image" width="100"></td>
	        							<td>{{row.post_hit}}</td>
	        							<td>
	        								<button class="btn btn-success" type="button" @click="editPost(row.post_id)"><i class="fa fa-pencil"></i></button>
	        								<button class="btn btn-danger" type="button" @click="deletePost(row.post_id)"><i class="fa fa-minus"></i></button>
	        							</td>
	        						</tr>
	        					</tbody>
	        					<tbody v-else class="data-tidak-ada">
	        						<tr>
	        							<td colspan="5" class="text-center">Tida ada data</td>
	        						</tr>
	        					</tbody>
        					</table>
        				</div>
        			</div>

        		</div>
        	</div>
        </div>
    </div>
</template>

<script type="text/javascript">
	import axios from 'axios';
	import Vue from 'vue';

	export default{
		data:function(){
			/* =============== For declare variable =========================== */
			return {
				errors:[],
				postInput : {
					post_title:'',
					post_author:'',
					post_image:'',
					post_value:'',
          category_id:'',
				},
				image:'',
        data_cat:[],
				tempImg:false,
				imgOri:true,
				editorOption: {
	              modules: {
	                toolbar: [
	                  ['bold', 'italic', 'underline', 'strike'],
	                  ['blockquote', 'code-block'],
	                  [{ 'header': 1 }, { 'header': 2 }],
	                  [{ 'list': 'ordered' }, { 'list': 'bullet' }],
	                  [{ 'script': 'sub' }, { 'script': 'super' }],
	                  [{ 'indent': '-1' }, { 'indent': '+1' }],
	                  [{ 'direction': 'rtl' }],
	                  [{ 'size': ['small', false, 'large', 'huge'] }],
	                  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
	                  [{ 'font': [] }],
	                  [{ 'color': [] }, { 'background': [] }],
	                  [{ 'align': [] }],
	                  ['clean'],
	                  ['link', 'image', 'video']
	                ],
	                syntax: {
	                  highlight: text => hljs.highlightAuto(text).value
	                }
	              }
		        },
				postShow: [],
				postData : {},
				loading:true,
				search : '',
				edit:false,
			}
		},
		 mounted() {
            console.log('Component mounted.')
            this.getPost();
            this.getCategory();
        },
        watch:{
        	search:function(q){
        		if(q!=''){
        			this.searchPost();
        		}
        		else
        		{
        			this.getPost();
        		}
        	}
        },
        methods :{

        	/* =============== For Function Image Handler =========================== */
			avatarChange(e){
				var files = e.target.files || e.dataTransfer.files;
				if(!files.length)
					return
				this.createImage(files[0]);

			},
			createImage(file){
				var image = new Image();
				var reader  = new FileReader();
				var app = this;

				reader.onload = (e)=>{
					app.postInput.post_image = e.target.result;
				}
				reader.readAsDataURL(file);
			},
			avatarChangeEd(e){
				var files = e.target.files || e.dataTransfer.files;
				if(!files.length)
					return
				this.createImageEd(files[0]);

				this.tempImg=true
				this.imgOri=false

			},
			createImageEd(file){
				var image = new Image();
				var reader  = new FileReader();
				var app = this;

				reader.onload = (e)=>{
					app.postInput.post_image = e.target.result;
				}
				reader.readAsDataURL(file);
			},
			removeImage(){
				this.postInput.post_image = '';
			},
			/* =============== For Clear Form =========================== */
			clearForm(){
				this.postInput.post_title='';
				this.postInput.post_id='';
				this.postInput.post_image='';
				this.postInput.post_author='';
        this.postInput.post_value='';
				this.postInput.category_id='';
				this.edit= false;
				this.errors=[];
			},
			editImg(){
				this.$refs.fileinput.click();
			},
			/* =============== For Update Post =========================== */
			updatePost(id){
				var app = this;
				var updatePost= app.postInput;
				axios.put('api/post/'+id,updatePost)
				.then(function(resp){
					app.clearForm();
					app.getPost();
					app.errors=[];
					app.edit= false;
					swal("Poof! your post has been updated",{
						icon:"success"
					});
				})
				.catch(function(resp){
					console.log('error update');
				})

			},
			/* =============== For quill editor =========================== */
    	 onEditorReady(quill) {
        	console.log('editor ready!', quill)
          },
          onEditorFocus(quill) {
            console.log('editor focus!', quill)
          },
          onEditorBlur(quill){
          	console.log('edit blur !',quill)
          },
          onEditorChange(quill,html,text){
          	console.log('editor change',quill,html,text);
          	this.postInput.post_value = html
          },
          searchPost(page){
          	var app =this;
          	if(typeof page === "undefined"){
          		page = 1;
          	}
          	axios.get('/api/searchPost?q='+app.search+'&page='+page)
          	.then(function(resp){
          		app.postShow = resp.data;
          		app.postData = {};
          	})
          	.catch(function(resp){
          		console.log('error search');
          	})
          },
          /* =============== For Save Post =========================== */
          savePost(){
    			var app = this;
    			var newPost = app.postInput;

            axios.post('api/post',newPost)
            .then(function(resp){
            	app.message = "Success input data tutorial";
				swal('Success',app.message,'success');
				app.clearForm();
            	app.getPost();
            })
            .catch(function(resp){
            	console.log('error save');
            	app.errors = resp.response.data.errors;

            })


          },

          /* =============== For Show Post =========================== */
          getPost(page){
          	var app = this;

          	if(typeof page == 'undefined'){
          		page = 1;
          	}
          	axios.get('api/post?page='+page)
          	.then(function(resp){
          		app.postShow = resp.data.data;
          		app.postData = resp.data;
          		app.loading = false;
          	})
          	.catch(function(resp){
          		console.log('error get post');
          		app.loading = false;
          	})
          },
          /* =============== For Edit Post =========================== */
          editPost(id){
            if(id!='')
            {
              var app = this;
              app.edit  = true;
              app.imgOri  = true;
              app.tempImg  = false;
              app.postInput.post_image = '';
              axios.get('/api/editPost/'+id)
              .then(function(resp){
                app.postInput.post_value = resp.data.post_value;
                app.postInput.post_id = resp.data.post_id;
                app.postInput.post_image = resp.data.post_image;
                app.postInput.post_title = resp.data.post_title;
                app.postInput.category_id = resp.data.category_id;
                
              })
              .catch(function(resp){
                console.log('error edit');
              });
            }
          },

           /* =============== For get category =========================== */
          getCategory(){
          	
          	 var app = this;
          		axios.get('api/getCategory')
          		.then(function(resp){

          			app.data_cat = resp.data;

                console.log(app.data_cat);
          		})
          		.catch(function(resp){
          			console.log('error getCategory');
          		});
          },
          /* =============== For Delete Post =========================== */
          deletePost(id){
          	swal({
          		title:"Are you sure",
          		text: "Once delete,you will not able finded more again",
          		icon:"warning",
          		buttons:true,
          		dangerMode :true,
          	})
          	.then((willDelete)=>{
      			if (willDelete){
      				var app = this;
      				axios.delete('api/post/'+id)
      				.then(function(resp){
      					if(resp.data=="1")
      					{
      						app.getPost();
      						app.clearForm();
      						swal("Poof! your post has been delete",{
      							icon:"success"
      						});
      						//this.clearForm()
      					}
      					else{
      						swal("Sorry data not found!",{
      							icon:"error",
      						})
      					}
      				})
      				.catch(function(resp){
      					console.log('error delete');
      				})
      			}
      			else{
      				swal("Your post is safe")
      			}
      		})
          },
          
        }
	}
</script>