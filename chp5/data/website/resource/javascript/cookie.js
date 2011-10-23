/*
COPYRIGHT:
	2002 Concentric Spheres, Inc.  All Rights Reserved.
PURPOSE: 
	Cookie reader/writer
COMMENTS: 
	This code was written specifically for Carrier Wave
*/


// set the cookie, if no expire days it's only active during browser session
function setCookie(cookieName, value, expiredays) {
	if ((cookieName.length>0) && (value.length>0)) {
		var ExpireDate = new Date ();
  		ExpireDate.setTime(ExpireDate.getTime() + (expiredays * 24 * 3600 * 1000));
  		document.cookie = cookieName + "=" + escape(value) + ((expiredays == null) ? "" : "; expires=" + ExpireDate.toGMTString());
	} else {
		return null;  
	}
}


// get the cookie, if name is missing or cookie not found show a message
function getCookie(cookieName)  {
	if (document.cookie.length > 0) { 
	    begin = document.cookie.indexOf(cookieName+"="); 
    	if (begin != -1)  { 
			begin += cookieName.length+1; 
      		end = document.cookie.indexOf(";", begin);
      		if (end == -1) end = document.cookie.length;
      			return unescape(document.cookie.substring(begin, end));       
		} 
	} else {
		return null;  
	}
}
 

// wipe out cookie, if not found show a message
function delCookie(cookieName) {
	document.cookie = cookieName + "=" + "; expires=Thu, 01-Jan-70 00:00:01 GMT";
}


// every screen in the system checks to see if the user disabled cookies
setCookie("cookietest", "good");
if (getCookie("cookietest") != "good") {
	self.location.href = "director.cfm?direction=logout&issue=nocookies";
}










