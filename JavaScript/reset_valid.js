function validate()
{
	if(document.myForm.username.value=="")
	{
		document.getElementById("mydiv").innerHTML="<font color='red'>*Fill The User Name</font>";
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
	
	if(document.myForm.question.value==0)
       	 {
		document.getElementById("mydiv1").innerHTML="<font color='red'>*Select The Security Question</font>";
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
	if(document.myForm.answer.value=="")
	{
		document.getElementById("mydiv2").innerHTML="<font color='red'>*Fill The Answer</font>";
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
	if(document.myForm.password1.value=="")
	{
		document.getElementById("mydiv3").innerHTML="<font color='red'>*Fill The Password</font>";
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
	if(document.myForm.password2.value=="")
	{
		document.getElementById("mydiv4").innerHTML="<font color='red'>*ReEnter the password</font>";
		return false;
	}
	else if(document.myForm.password1.value!=document.myForm.password2.value)
	{
		document.getElementById("mydiv4").innerHTML="<font color='red'>*Password  Mismatch!!!</font>";
		return false;
	}
	else
       	 {
		document.getElementById("mydiv4").innerHTML="";
		return true;
	}
}
		