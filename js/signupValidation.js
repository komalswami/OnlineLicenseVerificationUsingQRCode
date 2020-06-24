var flag=10;
flag=parseInt(flag);

function validateUsername()
{
	with(document.forms.SignUpForm)
	{
	}
}

function validateDLNo()
{
	with(document.forms.SignUpForm)
	{
		var lNo=dlNo.value
		var re=/^(\D{2})[ -\.]?(\d{13})$/
		if(re.test(lNo))
		{
			dlNo.value=lNo.split('-').join('')
			dlNo.value=dlNo.value.slice(0,2)+"-"+dlNo.value.slice(2,15);
			dlNo.value=dlNo.value.toUpperCase();
			getLicense.disabled=false
			flag=0;
		}
		else
		{
			flag=1;
			alert("Invalid License Format..!");
			//dlNo.focus();
		}
	}
}

function validatePass1(ch)
{
	with(document.forms.SignUpForm)
	{
		if(ch==2)
		{
			if(pass1.value.length>=4)
			{
				flag=0;
			}
			else
			{
				alert("Password 1 must be at least four characters");
				flag=2
				pass1.focus();	
			}
		}
		else
		{
			validateDLNo();
		}
	}
}
function validatePass2(ch)
{
	with(document.forms.SignUpForm)
	{
		if(ch==1)
		{	
			if(pass1.value.length<4)
			{
				pass1.focus();
				alert("Enter Pass1 first");
				flag=3;
			}
			else
			{
			
			}
		}
		else
		{
			if(pass1.value==pass2.value)
			{
				flag=0;
			}
			else
			{
				pass2.value="";
				alert("Password Do not match");
				flag=4
				pass2.focus();
			}
		}
	}
}

function validateSubmit()
{
	with(document.forms.SignUpForm)
	{ 
		if(flag==0)//All OK
		{
			//process further
				if(pass1.value.length!=0 && pass2.value.length!=0 && username.value.length!=0)
				{
					alert("Can go further")
				}
		}
		else if(flag==1)//DLNO Not ok
		{
			validateDLNo();
		}
		else if(flag==2)//Pass1 Length
		{
			validatePass1(2);
		}
		else if(flag==3)//Enter PAss1 first
		{
			validatePass2(1);
		}
		else if(flag==4)//PAssword not match
		{
			validatePass2(2)
		}
	}
}
