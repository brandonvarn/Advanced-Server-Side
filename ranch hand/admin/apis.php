<?php
	include_once "includes/header.php";
	include_once "includes/sidebar.php";
?>
<style>
	#pin-entries .row:first-child{
		background:#eeeeee;
		padding:2%;
		border:2px solid #ddd;
	}
</style>
			<!-- Page header -->
			<div class="page-header">
				<div class="page-title">
					<h3>Create API Key <small>Creating API key will automatically Email the key to the Email address given in the form.</small></h3>
				</div>
			</div>
			<!-- /page header -->
            <div class="row">
            	<div class="col-md-2">
	                <a href="#" data-toggle="modal" data-target="#modal-create-api" class="btn btn-primary">Create Key</a>
                </div>
                <div class="col-md-10">
                	<input type="text" id="search_keyword" class="form-control" placeholder="Enter search keyword and hit Return/Enter" />
                </div>
            </div>
			
			
            <table class="table table-striped" id="table-keys">
            	<thead>
                	<th>API Key</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Telephone</th>
                    <th>Delete?</th>
                </thead>
                <tbody>
                	<tr class="no-records" style="display:none;">
                    	<td colspan="5" style="text-align:center;">No Records found on the Server</td>
                    </tr>
                    <tr	 class="loading" style="display:none;">
                    	<td colspan="5" style="text-align:center;"><img src="images/interface/loader.gif" /></td>
                    </tr>
                </tbody>
            </table>
			<div class="modal fade" tabindex="-1" role="dialog" id="modal-create-api">
              <div class="modal-dialog">
              	<form class="form-horizontal" id="frm-create-key" method="post" action="api/keys.php?action=create">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Create a API Key</h4>
                  </div>
                  <div class="modal-body" style="padding:5%;">
                  
                  	<div class="row">
                    	<div class="col-md-12">
                            <div class="form-group">
                                <label for="full_name">Full Name</label>
                                <input type="text" class="form-control" name="full_name" id="full_name" />
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="text" class="form-control" name="email" id="email" />
                            </div>
                            <div class="form-group">
                                <label for="telephone">Telephone <small>(optional)</small></label>
                                <input type="text" class="form-control" name="telephone" id="telephone" />
                            </div>
                        </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Create API Key</button>
                  </div>
                  </form>
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            
            <div class="modal fade" tabindex="-1" role="dialog" id="modal-delete-key">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Confirm Deletion</h4>
                  </div>
                  <div class="modal-body" style="padding:1%">
                  	<p class="main-message">
                    Are you sure want to delete the Selected API Key?
                    </p>
                    <p style="font-weight:bold;color:#F00;" id="selected-key-to-delete"></p>
                  </div>
                  <div class="modal-footer">
                    <span class="post-message">&nbsp;</span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" data-id="" id="confirm-delete-key">Delete Key</button>
                  </div>
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
			<script type="text/javascript">
				$(document).ready(function(){
					function loadKeys(){
						var tableKeys=$("#table-keys");
						var tableBodyKeys=tableKeys.find("tbody");
						var tableLoader=tableBodyKeys.find("tr.loading");
						var tableNoRecords=tableBodyKeys.find("tr.no-records");
						$.ajax({
							type:'post',
							url:"api/keys.php?action=getAll",
							data:{searchKey:$('#search_keyword').val()},
							beforeSend:function(){
								tableBodyKeys.find("tr").each(function(index,tr){
									if(!$(this).hasClass("loading") && !$(this).hasClass("no-records"))
										$(this).remove();
									else
										$(this).hide();
								});
								tableLoader.show();
								
							},
							success:function(response){
								var _success=false;
								var _message="";
								var json=null;
								var data=null;
								try{
									json=JSON.parse(response);
									_success=json.success;
									_message=json.message;
									if(_success) {
										console.log("Fetching Data:\n");
										console.log(data);
										data=json.data;
									}
								}catch(x){
									_success=false;
									_message=x.toString();
									data=null;
								}finally{
									tableLoader.hide();
									if(data.length>0){
										$(data).each(function(index,row){
											console.log("Fetching Row: " + index);
											tableBodyKeys.append('<tr><td>'+ row.key +'</td><td>'+ row.full_name +'</td><td>'+ row.email_address +'</td><td>'+ row.telephone +'</td><td><a href="#" class="btn btn-xs btn-danger btn-icon" data-toggle="modal" data-target="#modal-delete-key" data-id="'+ row.id +'" data-key="'+ row.key +'"><i class="icon-remove"></i></a></td></tr>');
										});
										tableNoRecords.hide();
									}else{
										tableNoRecords.show();
									}
								}
							}
						});
					}
					
					$('#search_keyword').keyup(function(evt){
						evt.preventDefault();
						if(evt.keyCode==13)
							loadKeys();
					});
					$('#frm-create-key').ajaxForm({
						beforeSubmit:function(){
							$('#frm-create-key').find('button[type="submit"]').prop("disabled",true).html("adding...");
							$('#frm-create-key').find(".post-message").html("");
						},
						success:function(responseText){
							
							$('button[type="submit"]').show();
							console.log(responseText);
							try{
								var json=JSON.parse(responseText);
								if(json.success){
									loadKeys();
									$("#modal-create-api").modal("hide");
								}
							}catch(e){
								alert(e.toString())
							}finally{
								$('button[type="submit"]').prop("disabled",false).html("Create API Key");
								$('#frm-create-key').find(".post-message").html(_message);
							}
						}
					});
					$("#modal-delete-key").on("shown.bs.modal",function(evt){
						$caller=$(evt.relatedTarget);
						$("#confirm-delete-key").attr("data-id",$caller.data("id"))
							.html("Delete Key");
						$("#selected-key-to-delete").html($caller.data("key"));
					});
					$("#confirm-delete-key").click(function(evt){
						evt.preventDefault();
						$this=$(this);
						
						$.ajax({
							type:"POST",
							url:"api/keys.php?action=delete",
							data:{key_id:$this.attr("data-id")},
							beforeSend:function(){
								$this.html("deleting...")
									.prop("disabled",true);
							},
							success:function(response){
								var _success=false;
								var _message="Error connecting to server!";
								try{
									var json=JSON.parse(response);
									_success=json.success;
									_message=json.message;
								}catch(x){
									_success=false;
									_message=x.toString();
								}finally{
									$this.prop("disabled",false);
									$this.html("Try again!");
									$("#modal-delete-key").find(".main-message").html(_message);
									if(_success){ 
										loadKeys();
										$("#modal-delete-key").modal("hide");
									}
								}
							}
						});
					});
					loadKeys();
				});
			</script>			
<?php
	include_once 'includes/footer.php';
?>