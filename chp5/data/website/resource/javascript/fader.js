var delay=5000

var fwidth=150 //set scroller width
var fheight=150 //set scroller height
var begintag='<br\/> <p class=newstext >'
var closetag='<\/p>'
///No need to edit below this line/////////////////

var ie4=document.all&&!document.getElementById
var ns4=document.layers
var DOM2=document.getElementById
var faderdelay=2000
var index=0

if (DOM2)
faderdelay=3000

//function to change content
function changecontent(){
if (index>=fcontent.length)
index=0
if (DOM2){
document.getElementById("fscroller").style.color="rgb(255,255,255)";
document.getElementById("fscroller").innerHTML=begintag+fcontent[index]+closetag;
colorfade()
}
else if (ie4)
document.all.fscroller.innerHTML=begintag+fcontent[index]+closetag;
else if (ns4){
document.fscrollerns.document.fscrollerns_sub.document.write(begintag+fcontent[index]+closetag);
document.fscrollerns.document.fscrollerns_sub.document.close();
}

index++
setTimeout("changecontent()",delay+faderdelay)
}

// colorfade() partially by Marcio Galli for Netscape Communications.  ////////////
// Modified by Dynamicdrive.com

frame=20;
hex=255  // Initial color value.

function colorfade() {	         	
// 20 frames fading process
if(frame>0) {	
hex-=12; // increase color value
document.getElementById("fscroller").style.color="rgb("+hex+","+hex+","+hex+")"; // Set color value.
frame--;
setTimeout("colorfade()",20);	
}
else{
document.getElementById("fscroller").style.color="rgb(0,0,0)";
frame=20;
hex=255
}
}

window.onload=changecontent
