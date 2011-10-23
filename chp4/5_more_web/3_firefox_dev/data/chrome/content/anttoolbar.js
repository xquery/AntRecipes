/////////////////////////////////////////////////////////////////////////////////////////// TOOLBAR FUNCTIONS

function go_website(url){
	Utility_LoadURL(url);
}//end func

function test_action(string)
{
	alert(string);
}//end func

////////////////////////////////////////////////////////////////////////////////////////// UTILITY FUNCTIONS


//BROWSE TO:
function Utility_LoadURL(URL)
{
        window._content.document.location = URL;
        window.content.focus();
}//end func
