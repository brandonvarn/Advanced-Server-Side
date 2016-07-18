<?php
	include_once "includes/header.php";
	include_once "includes/sidebar.php";
?>
			<!-- Page header -->
			<div class="page-header">
				<div class="page-title">
					<h3>Change Password <small>Change your Login Password.</small></h3>
				</div>
			</div>
			<!-- /page header -->

			<form name="frm_change_password" id="frm_change_password" method="post" action="api/profile.php?action=changePassword">
            <div class="row">
            	<div class="col-md-4">
                	<p class="alert">
                    </p>
                	<div class="panel panel-info">
                	<div class="panel-heading">
                    	<h6 class="panel-title"><i class="icon-pencil"></i> Change Password</h6>
                    </div>
                    <div class="panel-body">
                    	<div class="form-group">
                        	<label>Current Password</label>
                            <input type="text" name="current_password" id="current_password" class="form-control" required />
                        </div>
                        <div class="form-group">
                        	<label>New Password</label>
                            <input type="password" name="new_password" id="new_password" class="form-control" required />
                        </div>
                    	<div class="form-group">
                        	<label>Confirm Password</label>
                            <input type="password" name="confirm_password" id="confirm_password" class="form-control" required />
                        </div>
                        <div class="form-group" style="text-align:right;">
                        	<button type="submit" class="btn btn-primary">Update Password</button>
                        </div>
                    </div>
                    </div>
                </div>
            </div>            
           </form>			
<script>
	$(document).ready(function(){
		$frm_change_password=$("#frm_change_password");
		$frm_change_password.ajaxForm({
			beforeSubmit:function(){
				$frm_change_password.find('button[type="submit"]').html("updating...");
				$frm_change_password.find('button[type="submit"]').prop("disabled",true);
				return false;
			}
		});
	});
</script>
<?php
	include_once 'includes/footer.php';
?>