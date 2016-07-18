<?php
	require_once "includes/session.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
<title>Login :: Ranch Hand Inventory API</title>

<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/londinium-theme.css" rel="stylesheet" type="text/css">
<link href="css/styles.css" rel="stylesheet" type="text/css">
<link href="css/icons.css" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&amp;subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

<script type="text/javascript" src="js/plugins/charts/sparkline.min.js"></script>

<script type="text/javascript" src="js/plugins/forms/uniform.min.js"></script>
<script type="text/javascript" src="js/plugins/forms/select2.min.js"></script>
<script type="text/javascript" src="js/plugins/forms/inputmask.js"></script>
<script type="text/javascript" src="js/plugins/forms/autosize.js"></script>
<script type="text/javascript" src="js/plugins/forms/inputlimit.min.js"></script>
<script type="text/javascript" src="js/plugins/forms/listbox.js"></script>
<script type="text/javascript" src="js/plugins/forms/multiselect.js"></script>
<script type="text/javascript" src="js/plugins/forms/validate.min.js"></script>
<script type="text/javascript" src="js/plugins/forms/tags.min.js"></script>
<script type="text/javascript" src="js/plugins/forms/switch.min.js"></script>

<script type="text/javascript" src="js/plugins/forms/uploader/plupload.full.min.js"></script>
<script type="text/javascript" src="js/plugins/forms/uploader/plupload.queue.min.js"></script>

<script type="text/javascript" src="js/plugins/forms/wysihtml5/wysihtml5.min.js"></script>
<script type="text/javascript" src="js/plugins/forms/wysihtml5/toolbar.js"></script>

<script type="text/javascript" src="js/plugins/interface/daterangepicker.js"></script>
<script type="text/javascript" src="js/plugins/interface/fancybox.min.js"></script>
<script type="text/javascript" src="js/plugins/interface/moment.js"></script>
<script type="text/javascript" src="js/plugins/interface/jgrowl.min.js"></script>
<script type="text/javascript" src="js/plugins/interface/datatables.min.js"></script>
<script type="text/javascript" src="js/plugins/interface/colorpicker.js"></script>
<script type="text/javascript" src="js/plugins/interface/fullcalendar.min.js"></script>
<script type="text/javascript" src="js/plugins/interface/timepicker.min.js"></script>

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/application.js"></script>
<script type="text/javascript" src="js/jquery.forms.js"></script>

</head>

<body class="full-width page-condensed">

	<!-- Navbar -->
	<div class="navbar navbar-inverse" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-right">
				<span class="sr-only">Toggle navbar</span>
				<i class="icon-grid3"></i>
			</button>
			<a class="navbar-brand" href="#"><img src="images/logo-pro-b.png" width="81" alt="Pro-B"></a>
		</div>

		<ul class="nav navbar-nav navbar-right collapse">
			<li><a href="#"><i class="icon-screen2"></i></a></li>
			<li><a href="#"><i class="icon-paragraph-justify2"></i></a></li>
			<li>
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-cogs"></i></a>
                <ul class="dropdown-menu icons-right dropdown-menu-right">
					<li><a href="#"><i class="icon-cogs"></i> This is</a></li>
					<li><a href="#"><i class="icon-grid3"></i> Dropdown</a></li>
					<li><a href="#"><i class="icon-spinner7"></i> With right</a></li>
					<li><a href="#"><i class="icon-link"></i> Aligned icons</a></li>
                </ul>
			</li>
		</ul>
	</div>
	<!-- /navbar -->


	<!-- Login wrapper -->
	<div class="login-wrapper">
    	<form action="api/login.php" role="form" method="post" name="frm-login">
			<div class="popup-header">
				<a href="#" class="pull-left"><i class="icon-user-plus"></i></a>
				<span class="text-semibold">User Login</span>
			</div>
			<div class="well">
				<div class="form-group has-feedback">
					<label>Username</label>
					<input type="text" class="form-control" placeholder="Username" name="username">
					<i class="icon-users form-control-feedback"></i>
				</div>

				<div class="form-group has-feedback">
					<label>Password</label>
					<input type="password" class="form-control" placeholder="Password" name="password">
					<i class="icon-lock form-control-feedback"></i>
				</div>

				<div class="row form-actions">
					<div class="col-xs-12 col-md-12" style="text-align: center;">
						<img src="images/interface/loader.gif" class="loader" style="display:none;" />
						<button type="submit" class="btn btn-warning pull-right"><i class="icon-menu2"></i> Sign in</button>
					</div>
				</div>
			</div>
    	</form>
	</div>  
	<!-- /login wrapper -->


    <!-- Footer -->
    <div class="footer clearfix">
        <div class="pull-left">&copy; 2015. Pro-B</div>
    	<div class="pull-right icons-group">
    		<a href="#"><i class="icon-screen2"></i></a>
    		<a href="#"><i class="icon-balance"></i></a>
    		<a href="#"><i class="icon-cog3"></i></a>
    	</div>
    </div>
    <!-- /footer -->

	<script type="text/javascript">
		$(document).ready(function(){
			$('form[name="frm-login"]').ajaxForm({
				beforeSubmit:function(){
					$('.loader').show();
					$('button[type="submit"]').hide();
				},
				success:function(responseText){
					console.log(responseText);
					try{
						var json=JSON.parse(responseText);
						if(json.success)
							document.location="./";
						else
							alert(json.message);
					}catch(e){
						alert(e.toString());
					}finally{
						$('.loader').hide();
						$('button[type="submit"]').show();
					}
				},error:function(error){
					$('.loader').hide();
					$('button[type="submit"]').show();
				}
			});
		});
	</script>
</body>
</html>