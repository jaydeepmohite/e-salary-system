function CSVupload()
{
	if(document.form1.file.value.toLowerCase().lastIndexOf(".csv")==-1) 
	 {
		document.getElementById("err").innerHTML="<br><font color='red'>* Please upload only .csv extention file</font>";
		form1.file.focus(); 
		return false;
	}
}
function validate()
{
	if(document.myForm.schoolname.value=="")
	{
		document.getElementById("mydiv").innerHTML="<font color='red'>*Fill The School Name</font>";
		return false;
	}
	else
        {
		document.getElementById("mydiv").innerHTML="";
		return true;
	}
}
function validate1()
{
	if(document.myForm.schoolid.value=="")
	{
		document.getElementById("mydiv1").innerHTML="<font color='red'>*Fill The School ID Entry</font>";
		return false;
	}
	else
        {
		document.getElementById("mydiv1").innerHTML="";
		return true;
	}
}
function validate2()
{
	
	if(document.myForm.s_add1.value=="")
	{
		document.getElementById("mydiv2").innerHTML="<font color='red'>*Fill The School Address</font>";
		return false;
	}
	else
        {
		document.getElementById("mydiv2").innerHTML="";
		return true;
	}
}
function validate3()
{
	var a=document.myForm.city.value;
	if(a=="")
        {
		document.getElementById("mydiv3").innerHTML="<font color='red'>*Fill The City Name</font>";
		return false;
	}
	else if(!isNaN(a))
	{
		document.getElementById("mydiv3").innerHTML="<font color='red'>*City Name must include Characters only</font>";
		return false;
	}
	else
	{
		document.getElementById("mydiv3").innerHTML="";
		return true;
	}
}
function validate4()
{
	var a=document.myForm.pincode.value;
	if(a=="")
        {
		document.getElementById("mydiv4").innerHTML="<font color='red'>*Fill The Pin-Code</font>";
		return false;
	}
	else if(isNaN(a))
	{
		document.getElementById("mydiv4").innerHTML="<font color='red'>*Pin-Code must include numbers only</font>";
		return false;
	}
	else if(a.length!=6)
	{
		document.getElementById("mydiv4").innerHTML="<font color='red'>*Pin-Code Length should be 6 only</font>";
		return false;
	}
	else
	{
		document.getElementById("mydiv4").innerHTML="";
		return true;
	}
}
function validate5()
{
	var a=document.myForm.sarea.value;
	if(a=="")
        {
		document.getElementById("mydiv5").innerHTML="<font color='red'>*Fill The School Area</font>";
		return false;
	}
	else if(isNaN(a))
	{
		document.getElementById("mydiv5").innerHTML="<font color='red'>*Enter Proper Area</font>";
		return false;
	}
	else
	{
		document.getElementById("mydiv5").innerHTML="";
		return true;
	}
}
function validate6()
{
	var a=document.myForm.classrooms.value;
	if(a=="")
        {
		document.getElementById("mydiv6").innerHTML="<font color='red'>*Fill The No. of Classrooms</font>";
		return false;
	}
	else if(isNaN(a))
	{
		document.getElementById("mydiv6").innerHTML="<font color='red'>*Enter Valid No.</font>";
		return false;
	}
	else
	{
		document.getElementById("mydiv6").innerHTML="";
		return true;
	}
}
function validate7()
{
	var a=document.myForm.parea.value;
	if(a=="")
        {
		document.getElementById("mydiv7").innerHTML="<font color='red'>*Fill The Field</font>";
		return false;
	}
	else if(isNaN(a))
	{
		document.getElementById("mydiv7").innerHTML="<font color='red'>*Enter Proper Area</font>";
		return false;
	}
	else
	{
		document.getElementById("mydiv7").innerHTML="";
		return true;
	}
}
function validate8()
{
	
	if(document.myForm.taluka.value==0)
        {
		alert("* Select the Tahsil in Address Details !!!");
		document.getElementById("mydiv8").innerHTML="<font color='red'>*Select The Tahsil</font>";
		return false;
	}
	else
	{
		var a=validate12();
		document.getElementById("mydiv8").innerHTML="";
		return true;
	
	}
}
function validate9()
{
	var a=document.myForm.tstaff.value;
	if(a=="")
        {
		document.getElementById("mydiv9").innerHTML="<font color='red'>*Fill The Field</font>";
		return false;
	}
	else if(isNaN(a))
	{
		document.getElementById("mydiv9").innerHTML="<font color='red'>*Enter Valid No.</font>";
		return false;
	}
	else
	{
		document.getElementById("mydiv9").innerHTML="";
		return true;
	}
}
function validate10()
{
	if(document.myForm.terms.checked == false)
	{
		alert("* Check the terms and conditions !!!");
		document.getElementById("mydiv10").innerHTML="<font color='red'>Please Check The Terms And Conditions</font>";
		return false;
	}
	else
	{
		document.getElementById("mydiv10").innerHTML="";
		return true;
	}
}
function validate11()
{
	if(document.myForm.schooltype[0].checked == false && document.myForm.schooltype[1].checked == false)
	{
		alert("Please Select The School type in the Basic Details !!");
		document.getElementById("mydiv11").innerHTML="<font color='red'>Please Select The School Type</font>";
		return false;
	}
	else
	{
		var a=validate8();
		document.getElementById("mydiv11").innerHTML="";
		return true;
	}
}
function validate12()
{
	if(document.myForm.sanitary[0].checked == false && document.myForm.sanitary[1].checked == false)
	{
		alert("* Select the Sanitary Provisions in infrastructure details !!!");
		document.getElementById("mydiv12").innerHTML="<font color='red'>Please Select The Sanitary Provisions</font>";
		return false;
	}
	else
	{
		var a=validate13();
		document.getElementById("mydiv12").innerHTML="";
		return true;
	}
}
function validate13()
{
	if(document.myForm.water[0].checked == false && document.myForm.water[1].checked == false)
	{
		alert("* Select the Water Provisions in infrastructure details !!!");
		document.getElementById("mydiv13").innerHTML="<font color='red'>Please Select The Water Provisions</font>";
		return false;
	}
	else
	{
		var a=validate10();
		document.getElementById("mydiv13").innerHTML="";
		return true;
	}
}
function validate_contact()
{
	var a=document.myForm.contact.value;
	if(a=="")
        {
		document.getElementById("contact1").innerHTML="<font color='red'>*Fill The Contact No</font>";
		return false;
	}
	else if(isNaN(a))
	{
		document.getElementById("contact1").innerHTML="<font color='red'>*Contact NO must include numbers only</font>";
		return false;
	}
	else if(a.length!=10)
	{
		document.getElementById("contact1").innerHTML="<font color='red'>*Contact No Length should be 10 only</font>";
		return false;
	}
	else
	{
		document.getElementById("contact1").innerHTML="";
		return true;
	}
}
function validateEmail()
{
var x=document.myForm.email.value
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
  document.getElementById("email1").innerHTML="<font color='red'>*Not a Valid Address</font>";
		return false;
  }
else
{
document.getElementById("email1").innerHTML="";
		return true;
}
}
