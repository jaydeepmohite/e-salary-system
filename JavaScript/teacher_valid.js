function photoupload()
{
	
		if(document.form1.file1.value.toLowerCase().lastIndexOf(".jpg")==-1) 
		 {
			document.getElementById("err").innerHTML="<br><font color='red'>* Please upload only .jpg extention file</font>";
			form1.file1.focus(); 
			return false;
		}
		else
			return true;
	
}
function validateSchool()
{
	if(document.my.t_school.value==0)
	{
		alert("Select Your School");
		return false;
	}
}
function validate()
{
	if(document.my.t_rid.value=="")
	{
		document.getElementById("mydiv").innerHTML="<font color='red'>*Fill The Teacher ID</font>";
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
	if(document.myForm.t_name.value="")
        {
		document.getElementById("mydiv1").innerHTML="<font color='red'>*Fill Your Name</font>";
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
	
	if(document.myForm.t_add1.value=="")
	{
		document.getElementById("mydiv2").innerHTML="<font color='red'>*Fill Your Address</font>";
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
	var a=document.myForm.pyear.value;
	if(a=="")
        {
		document.getElementById("mydiv5").innerHTML="<font color='red'>*Fill The Passing Year</font>";
		return false;
	}
	else if(isNaN(a))
	{
		document.getElementById("mydiv5").innerHTML="<font color='red'>*Enter Proper Passing Year</font>";
		return false;
	}
	else if(a.length!=4)
	{
		document.getElementById("mydiv5").innerHTML="<font color='red'>*Year Length must be 4 only</font>";
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
	if(document.myForm.branch.value=="")
	{
		document.getElementById("mydiv6").innerHTML="<font color='red'>*Fill The Bank Branch Name</font>";
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
	var a=document.myForm.account1.value;
	var b=document.myForm.account2.value;
	
	 if(a=="")
	{
		document.getElementById("mydiv71").innerHTML="<font color='red'>*Fill Account No</font>";
		return false;
	}
	else if(b=="")
	{
		document.getElementById("mydiv7").innerHTML="<font color='red'>*Re-Enter Account No</font>";
		return false;
	}
	else if(a != b)
	{
		document.getElementById("mydiv7").innerHTML="<font color='red'>*Account No Mismatch</font>";
		return false;
	}
	else
	{
		document.getElementById("mydiv7").innerHTML="";
		document.getElementById("mydiv71").innerHTML="";
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
	if(document.myform.terms.checked==false)
	{
                alert("IIII");
		document.getElementById("mydiv10").innerHTML="jjj";
		return false;
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
		var a=validate11();
		document.getElementById("mydiv8").innerHTML="";
		return true;
	
	}
}
function validate11()
{
	if(document.myForm.teachertype[0].checked == false && document.myForm.teachertype[1].checked == false)
	{
		alert("Please Select The Teacher type in the Qualification Details !!");
		document.getElementById("mydiv11").innerHTML="<font color='red'>Please Select The Teacher Type</font>";
		return false;
	}
	else
	{
		var a=validate12();
		document.getElementById("mydiv11").innerHTML="";
		return true;
	}
}

function validate12()
{
	
	if(document.myForm.certificate.value==0)
        {
		alert("* Select the Degree in Qualification Details !!!");
		document.getElementById("mydiv12").innerHTML="<font color='red'>*Select The Degree</font>";
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
	
	if(document.myForm.bank.value==0)
        {
		alert("* Select the Bank in Bank Details !!!");
		document.getElementById("mydiv13").innerHTML="<font color='red'>*Select The Bank</font>";
		return false;
	}
	else
	{
		var a=validateTerms();
		document.getElementById("mydiv13").innerHTML="";
		return true;
	
	}
}
function validateEmail()
{
var x=document.myForm.email.value;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
  document.getElementById("email1").innerHTML="<font color='red'>*Not a Valid Email Address</font>";
		return false;
  }
else
{
document.getElementById("email1").innerHTML="";
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
function validateTerms()
{
	if(document.myForm.terms.checked == false)
	{
		alert("* Check the terms and conditions !!!");
		document.getElementById("mydiv14").innerHTML="<font color='red'>Please Check The Terms And Conditions</font>";
		return false;
	}
	else
	{
		document.getElementById("mydiv14").innerHTML="";
		return true;
	}
}
