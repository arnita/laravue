<template>
  <div class="container-fluid">
       <div class="container">
    <div class="row justify-content-center">
  <div class="col-sm-6">
    <div class="card">
      <div class="card-header"> Dashboard  </div>

      <div class="card-body">

       <form @submit.prevent="saveCategory" @keydown="$event.keyCode==13?$event.preventDefault():false"> 
            <div class="form-group" :class="{'has-error':errors.category_name}">
              <label for="Category Name">Category Name <span class="text-danger">*</span></label>
              <input type="text" v-model="categoryInput.category_name" class="form-control"  id="category_name" placeholder="Category Name" autofocus>
              <div class="help-block" v-if="errors.category_name">
                  <div v-for="error in errors.category_name"><strong>{{error}}</strong></div>
              </div>
            </div>

            <div class="form-group" :class="{'has-error':errors.category_description}">
              <label for="Category Description">Category Description <span class="text-danger">*</span></label>
              <textarea v-model="categoryInput.category_description" class="form-control" id="category_description" placeholder="Category Description" autofocus>
              </textarea>
              <div class="help-block" v-if="errors.category_description">
                  <div v-for="error in errors.category_description"><strong>{{error}}</strong></div>
              </div>
            </div>
            <div class="text-left">
              <button type="submit" class="btn btn-primary" v-if="!edit">Save</button>
              <button type="button" class="btn btn-primary" v-if="edit" @click="updateCategory(categoryInput.category_id)">Update</button>
              <button @click="clearForm()" type="button" class="btn btn-warning">Reset</button>
            </div>
        </form>

      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-header"> Table Category </div>
      <div class="card-body">
         <div class="form-group form-float">
            <div id="imaginary_container">
                  <div class="input-group stylish-input-group">
                      <input type="text" class="form-control"  placeholder="Search Category" v-model="search" >
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
                      <th>No</th>
                      <th>Category Name</th>
                      <th>Category Description</th>
                      <th>Aksi</th>
                    </tr>
                  </thead>
                  <tbody class="data-ada" v-if="categoryShow.length">
                    <tr v-for="row,index in categoryShow">
                      <td>{{index+1}}</td>
                      <td>{{row.category_name}}</td>
                      <td>{{row.category_description}}</td>
                      <td width="130px">
                        <button class="btn btn-xs btn-success" @click="editCategory(row.category_id,index)"><i class="fa fa-pencil"></i></button>
                        <button class="btn btn-xs btn-danger" v-bind:id="'delete-'+row.category_id" @click="deleteCategory(row.category_id,index,row.category_name)"><i class="fa fa-minus"></i></button>
                      </td>
                    </tr>
                  </tbody>  
                  <tbody class="data-tidak-ada" v-else>
                      <tr>
                        <td colspan="5" class="text-center">Tidak ada data</td>
                      </tr>
                  </tbody>
                </table>
                <vue-simple-spinner v-if="loading"></vue-simple-spinner>
                <div class="body" align="right">
                  <vue-pagination :data="categoryData" v-on:pagination-change-page="getCategory"></vue-pagination>
                </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>

</template>

<script>
import axios from 'axios';
import  Vue from 'vue'

    export default {
       
        data: function(){
          return {
            errors:[],
            categoryInput:{
              category_id:'',
              category_name:'',
              category_description:''
            },
            categoryShow :[],
            categoryData :{},
            url:window.location.origin + window.location.pathname,
            loading:true,
            search:'',
            edit:false,
          }
        },
        mounted() {
            var app = this
            app.getCategory();
            console.log('Component mounted.')
        },
        watch:{
          search:function(q){
            if(q != ''){
              this.searchCategory()
            }
            else
            {
              this.getCategory()
            }
          }
        },
        methods:{
          clearForm(){
            var app = this;
            app.edit = false
            app.categoryInput.category_name = ''
            app.categoryInput.category_description=''
          },
          getCategory(page){
            var app = this
            if(typeof page == 'undefined'){
              page = 1
            }
            axios.get('/api/category?page='+page)
            .then(function (resp){
              app.categoryShow = resp.data.data;
              app.categoryData = resp.data;
              app.loading = false;
            })
            .catch(function (resp){
                console.log('Error')
                app.loading = false;
            })
          },

          deleteCategory(id,index,name){

            swal({
                title: "Are you sure?",
                text: "Once deleted, you will not be able to finded more again!",
                icon: "warning",
                buttons: true,
                dangerMode: true,
              })
              .then((willDelete) => {
                if (willDelete) {
                  var app = this;
                  axios.delete('/api/category/'+id)
                  .then(function(resp){
                    if(resp.data=="1")
                    {
                      app.getCategory();
                      app.clearForm();
                      swal("Poof! Your category has been deleted!", {
                          icon: "success",
                      });       
                      //this.clearForm();             
                    }
                    else
                    {
                      swal(" Sorry data not Found !", {
                          icon: "error",
                      });                    
                    }
                    
                   })
                  .catch(function(resp){
                      console.log('error delete');      
                  });
                 
                } else {
                  swal("Your category is safe!");
                }
              });
     
          },
          saveCategory(){
            var app = this;
            var newCategory = app.categoryInput;
            axios.post('/api/category',newCategory)
            .then(function(resp){


              app.message = "Success input data : " + app.categoryInput.category_name;

              app.alert(app.message); 
              app.clearForm();
              app.getCategory();
              app.errors ='';

              console.log('success');
            })
            .catch(function(resp){
              console.log('error save');
              app.success = false;
              app.errors = resp.response.data.errors;
            })
          },
          searchCategory(page){
                var app = this;
                if(typeof page ==="undefined"){
                  page = 1;
                }
                axios.get('/api/searchCategory?q='+app.search+'&page='+page)
                .then(function(resp){
                  app.categoryShow = resp.data;
                  app.categoryData = {};

                 
                })
                .catch(function(resp){
                  console.log('error search');
                })
          },
          editCategory(id,index){
              if(id!=''){
                var app = this;
                app.edit = true;
                axios.get('/api/editCategory/'+id)
                .then(function(resp){
                app.categoryInput.id = resp.data.id;
                app.categoryInput = resp.data
                })             
              }
              else{
                swal('Warning','Data not found','danger');               
              }
          },
          updateCategory(id){
              var app = this;
              var updateCategory = app.categoryInput;
              axios.put('api/category/'+id,updateCategory)
              .then(function(resp){
                app.message = 'Success update data : '+app.categoryInput.category_name;
                app.alert(app.message);
                app.clearForm();
                app.getCategory();
                app.edit= false;
                app.errors = [];
              })
              .catch(function(resp){
                app.success = false;
                console.log('error update');
              })
          },
          alert(message){
            swal({
              title:"Success",
              text:message,
              icon:'success'
            })
          }
        }

    }
</script>
