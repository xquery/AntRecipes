$(document).ready(function(){
	var r = Math.floor(Math.random()*3);
	var d = [
		["splashphoto-parkdean","featurebox-parkdean","Selling the great british holiday","How we helped the UK\'s leading holiday park operator achieve online success","parkdean.html"],
		["splashphoto-pasport","featurebox-pasport","Back of the net","We get ready to kick off the new season with a hat trick of projects for PA Sport","pasport.html"],
		["splashphoto-intervoice","featurebox-intervoice","High impact collateral","See how we told a story of complex software products via the web, video and other channels","intervoice.html"]
	];
	$("div#featurebox-parkdean").attr("id",d[r][1]);
	$("div#splashphoto-parkdean").attr("id",d[r][0]);
	$("div#" + d[r][1] + " > p").html(d[r][3] + "<a href=\"" + d[r][4] + "\">Read the case study</a>");
	$("div#" + d[r][1] + " > h2 > span").html(d[r][2]);
	
});