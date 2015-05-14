<!--below code creates a registration page and  validates the values entered in those fields are saved in the respective parameters-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NetBidz</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">
</script>
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>
<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "top_nav", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>
<link rel="stylesheet" type="text/css" media="all" href="css/jquery.dualSlider.0.2.css" />
<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="js/jquery.timers-1.2.js" type="text/javascript"></script>
<script src="js/jquery.dualSlider.0.3.min.js" type="text/javascript"></script>
<script type="text/javascript">
    
    $(document).ready(function() {
        
        $(".carousel").dualSlider({
            auto:true,
            autoDelay: 6000,
            easingCarousel: "swing",
            easingDetails: "easeOutBack",
            durationCarousel: 1000,
            durationDetails: 600
        });
        
    });
 </script>
<script language="javascript" type="text/javascript">

function validate()
{
	//Validation for name field
	var x=document.forms["registration"]["username"].value;
	
	re = /^[A-Za-z]+$/;
	if(!(re.test(document.registration.username.value)))
	{
	alert('Enter only Alphabets');
	return false;
	}
	//validation for password field
	var z=document.forms["registration"]["password1"].value;
	var a=z.length;
	if(a<6)
	{
	alert("Enter atleast 6 characters");
	return false;
	}
	

	//validation for phone number field  
	var q=document.forms["registration"]["phoneNo"].value; 
	var r=q.length;
	if(r!=10)
	{
	alert("Invalid Phone Number");
	return false;
	}
	//Validation for other feilds
	
	var d=document.forms["registration"]["Address"].value;
	
	var g=d.length;
	if(g==0)
		{
		alert("Some fields are incomplete");
		return false;
		}
	
	}
function pwdcheck()
{
	
	var z=document.forms["registration"]["password1"].value; 
	var zz=document.forms["registration"]["password2"].value;
	if(z!=zz)
		{
		alert("Passwords dont match");
		registration.password2.value='';
		registration.password1.focus();
		return false;
		}
	
}


function textCounter(field,cntfield,maxlimit) {
if (field.value.length > maxlimit) 
field.value = field.value.substring(0, maxlimit);
else
cntfield.value = maxlimit - field.value.length;
}

function check(value){ 
	xmlHttp=GetXmlHttpObject();
	var url="checkajax.jsp";
	url=url+"?name="+value;
	xmlHttp.onreadystatechange=stateChanged; 
	xmlHttp.open("GET",url,true);
	xmlHttp.send(null);
	}
	function stateChanged(){ 
	if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
	    var showdata = xmlHttp.responseText; 
	    document.getElementById("mydiv").innerHTML= showdata;
	    } 
	}
	function GetXmlHttpObject(){
	var xmlHttp=null;
	try{
	  xmlHttp=new XMLHttpRequest();
	 }
	catch (e) {
	 try {
	  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	  }
	 catch (e){
	  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	 }
	return xmlHttp;
	}
</script>


<style type="text/css">
form legend {
	
	font-size: 1.29em;
	color:#97d9f9;
	padding: 0.6em;
	font-weight: bold;
	
	
}
</style>

</head>
<body>
<div id="templatemo_wrapper">
	<div id="templatemo_header">
       	<div id="site_title">
        	<h1><a href="#">Netbidz</a></h1>
        </div>
            
        <div class="cleaner"></div>
    </div> <!-- END of templatemo_header -->
    
    <div id="templatemo_menu">
    	<div id="top_nav" class="ddsmoothmenu">
            <ul>
               
                 <li><a href="login.html">Login</a></li>
                <li><a href="reg.jsp" class="selected">Register</a></li>
                
                
            </ul>
            <br style="clear: left" />
			
        </div> <!-- end of ddsmoothmenu -->
       
    </div> <!-- END of templatemo_menu -->
       
	<!-- END of templatemo_middle -->
	     <div id="menu_second_bar" style="position:relative;top:-25px">
        	<div id="top_shopping_cart">
            	<font color="white" size="4pt">Welcome <strong>Guest !</strong></font>
            </div>
        	
            <div class="cleaner"></div>
         </div>
		
		
    <div id="templatemo_main" style="position:relative;top:-35px">

	<form action="register.jsp" method="post" name="registration"
		onsubmit="return validate()" class="register">
		<font color="white">
			<table width="60%" align="center">
				<tr>
					<td colspan="2">
						<fieldset>
							<legend>Personal Information</legend>				
							
						
<br><br>	
						
							<p>
								<label> Username:
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</label> <input type="text" name="username" size="20"
									onBlur="check(this.value);"><br>
							</p>
                                             
							<p>
								<label>Password:
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</label> <input type="password" name="password1" size="20" onFocus="this.value=''">
							</p>
							<p>
								<label>Confirm Password:&nbsp;&nbsp;</label> <input
									type="password" name="password2" size="20"
									onBlur="return pwdcheck()" onFocus="this.value=''">
							</p>


							
								
							
							
						</fieldset>
					</td>
					<td>
						<fieldset>
							<legend>Billing Information</legend>
							<p>
								<label> Phone Number:&nbsp;&nbsp;</label>+1 <input type="text"
									name="phoneNo" size="10" maxlength="10">
							</p>

							<p>
								<label> Address:</label>
								<textarea name="Address" cols="25" rows="4"
									style="overflow: hidden"
									onKeyDown="textCounter(document.registration.address,document.registration.remLen1,100)"
									onKeyUp="textCounter(document.registration.address,document.registration.remLen1,100)"></textarea>
								<br> 
							</p>
						</fieldset>
					</td>
				</tr>
				
					




				
			</table>
		</font> <br> 
		<center>
			<br> <input type="submit" value="Register" style="padding:5px"  class="sub_btn">
			<input type="reset" value="Reset"  style="padding:5px" class="sub_btn">
		</center><br> <br>
	</form>
   <div id="templatemo_footer">
    	<p>
			<a href="index.html">Home</a>  | <a href="login.html">Login</a> 
		</p>

    	Copyright © 2014 <a href="#">Netbidz</a> 
    </div> <!-- END of templatemo_footer -->
    
</div> <!-- END of templatemo_wrapper -->

</body>
</html>
