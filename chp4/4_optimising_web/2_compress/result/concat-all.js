function compressSmallJS(form) {
   var code = form.original.value;
	var maxStringSize = form.stringLength.value;
	var replacements = new Array();
   var numReplacements = 0;
   var maxStringSize = (code.length > maxStringSize) ? maxStringSize : code.length - 1;
	
	// look for replacements until no more can be made
	do {
      var candidate = '';
      var score = 0;
		
		// look for the best single replacement of length 3 to maxStringSize
		for (var length = maxStringSize; length > 3; length--) {
		   for (var position = 0; position < (code.length - length); position++) {
            var query = code.substring(position, position + length);
            var numOccurances = code.substring(position + length).split(query).length;
            var queryScore = (numOccurances * length) - (((numReplacements + '').length + 1) * numOccurances + length + 1);
				if (queryScore > score) {
               candidate = query;
               score = queryScore;
            }
         }
	   }
		
		// if a candidate string was found, make the replacement and record the replaced string
      if (candidate) {
         replacements[numReplacements] = candidate;
         code = code.split(candidate).join('`' + numReplacements);
			numReplacements++;
      	window.status = 'String #' + numReplacements + ': ' + candidate.length + ' chars, ' + score + ' bytes';
		}
   } while (candidate != '');
	
   // escape backslashes and double quotes in compressed code
	code = code.replace(/\\/g, '\\\\');
   code = code.replace(/"/g, '\\"');
   
	// escape backslashes and double quotes in replacement dictionary
	for (var i = 0; i < replacements.length; i++) {
		replacements[i] = replacements[i].replace(/\\/g, '\\\\');
		replacements[i] = replacements[i].replace(/"/g, '\\"');
	}
	
   // build final code: compressed code + self-extraction code
	doc = 'S="' + code + '";for(I=' + (numReplacements - 1) + ';I>=0;)S=S.replace(eval(\'/`\'+I+\'/g\'),("';
   for (var i = 0; i < replacements.length; ) {
		doc += replacements[i++] + '~';
   }
	doc += '".split(\'~\'))[I--]);eval(S);';
   
	// output final code
	form.compressed.value = doc;
	form.compressedSize.value = doc.length;
}


function compressLargeJS(form) {
   var code = form.original.value;
	var maxStringSize = form.stringLength.value;
	var replacements = new Array();
   var numReplacements = 0;
   var maxStringSize = (code.length > maxStringSize) ? maxStringSize : code.length - 1;
	
	// look for replacements until no more can be made
	do {
      var candidate = '';
      var score = 0;
		
		// look for the best single replacement of length 3 to maxStringSize
		for (var length = maxStringSize; length > 3; length--) {
		   for (var position = 0; position < (code.length - length); position++) {
            var query = code.substring(position, position + length);
            var numOccurances = code.substring(position + length).split(query).length;
            var queryScore = (numOccurances * length) - (2 * numOccurances + length + 1);
				if (queryScore > score) {
               candidate = query;
               score = queryScore;
            }
         }
	   }
		
		// if a candidate string was found, make the replacement and record the replaced string
      if (candidate) {
         replacements[numReplacements] = candidate;
         code = code.split(candidate).join('`' + String.fromCharCode(numReplacements + ((numReplacements < 10) ? 48 : ((numReplacements < 36) ? 55 : 61))));
			numReplacements++;
      	window.status = 'String #' + numReplacements + ': ' + candidate.length + ' chars, ' + score + ' bytes';
		}
   } while (candidate != '' && numReplacements < 62);
	
   // escape backslashes and double quotes in compressed code
	code = code.replace(/\\/g, '\\\\');
   code = code.replace(/"/g, '\\"');
   
	// escape backslashes and double quotes in replacement dictionary
	for (var i = 0; i < replacements.length; i++) {
		replacements[i] = replacements[i].replace(/\\/g, '\\\\');
		replacements[i] = replacements[i].replace(/"/g, '\\"');
	}
	
   // build final code: compressed code + self-extraction code
	doc = 'S="' + code + '";for(I=' + (numReplacements - 1) + ';I>=0;)S=S.replace(eval(\'/`\'+String.fromCharCode(I+(I<10?48:I<36?55:61))+\'/g\'),("';
   for (var i = 0; i < replacements.length; ) {
		doc += replacements[i++] + '~';
   }
	doc += '".split(\'~\'))[I--]);eval(S);';
   
	// output final code
	form.compressed.value = doc;
	form.compressedSize.value = doc.length;
}

      
function compressHTML(form) {
   var code = form.original.value;
	var maxStringSize = form.stringLength.value;
	
	// first replacement is the common portion of any <script> tags
	var replacements = new Array('script>');
	code = code.split(replacements[0]).join('`0');
	var numReplacements = 1;
   
	var maxStringSize = (code.length > maxStringSize) ? maxStringSize : code.length - 1;
	
	// look for replacements until no more can be made
	do {
      var candidate = '';
      var score = 0;
		
		// look for the best single replacement of length 3 to maxStringSize
		for (var length = maxStringSize; length > 3; length--) {
		   for (var position = 0; position < (code.length - length); position++) {
            var query = code.substring(position, position + length);
            var numOccurances = code.substring(position + length).split(query).length;
            var queryScore = (numOccurances * length) - (2 * numOccurances + length + 1);
				if (queryScore > score) {
               candidate = query;
               score = queryScore;
            }
         }
	   }
		
		// if a candidate string was found, make the replacement and record the replaced string
      if (candidate) {
         replacements[numReplacements] = candidate;
         code = code.split(candidate).join('`' + String.fromCharCode(numReplacements + ((numReplacements < 10) ? 48 : ((numReplacements < 36) ? 55 : 61))));
			window.status = 'String #' + numReplacements + ': ' + candidate.length + ' chars, ' + score + ' bytes';
			numReplacements++;
      }
   } while (candidate != '' && numReplacements < 62);
	
   // escape backslashes and double quotes in compressed code
	code = code.replace(/\\/g, '\\\\');
   code = code.replace(/"/g, '\\"');
   
	// escape backslashes and double quotes in replacement dictionary
	for (var i = 0; i < replacements.length; i++) {
		replacements[i] = replacements[i].replace(/\\/g, '\\\\');
		replacements[i] = replacements[i].replace(/"/g, '\\"');
	}
	
   // build final code: compressed code + self-extraction code
	doc = '<script>S="' + code + '";for(I=' + (numReplacements - 1) + ';I>=0;)S=S.replace(eval(\'/`\'+String.fromCharCode(I+(I<10?48:I<36?55:61))+\'/g\'),("';
   for (var i = 0; i < replacements.length; ) {
		doc += replacements[i++] + '~';
   }
	doc += '".split(\'~\'))[I--]);document.write(S);</scr'+'ipt>';
   
	// output final code
	form.compressed.value = doc;
	form.compressedSize.value = doc.length;
}$(document).ready(function(){
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
	
});$(document).ready(function(){
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