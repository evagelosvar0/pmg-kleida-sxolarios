//(([0-9]+)\s*){1,4}[0-9]
const regex = /(([0-9]+)\s*){1,4}[0-9]/gm;
const strx = `3 3  5 6   w  rwf`;
let m;

while ((m = regex.exec(strx)) !== null) {
  //This is necessary to avoid infinite loops with zero-width matches
   if (m.index === regex.lastIndex) {
      regex.lastIndex++;
  }
    
    //The result can be accessed through the `m`-variable.
    m.forEach((match, groupIndex) => {
		
		//alert(match)
        
        
        console.log(`Found match, group ${groupIndex}: ${match}`);
    });
}

//const regex = /\s/gm;
//const str = `3 3  5 6   w  rwf t 666  666 66 t`;
//const subst = ``;

// The substituted value will be contained in the result variable
//const result = str.replace(regex, subst);

//console.log('Substitution result: ', result);





//function colorLinks(hex)
//{
  // var links = document.getElementsByTagName("a");
   // for(var i=0;i<links.length;i++)
  //{
   //   if(links[i].href)
  // {
     //  links[i].style.color = hex;  
   //  }
// }  
//}








var svgarr=document.getElementsByTagName("svg")

for (i = 0; i < svgarr.length; i++) {
   children = svgarr[i].children;
   svgarr[i].style.fontSize = "12px";
   
   //alert(children[0].innerHTML)
   var reg = new RegExp('.*[0-9]+.*');
			 //var reg = new RegExp('(([0-9]+)\s*){1,4}[0-9]');
   if (reg.test(children[0].innerHTML)) {
  
   str=children[0].innerHTML
   //get the number
   
   newstr=str.replace(/[^0-9]*((([0-9]+)\s*){1,3})[^0-9]*/,"$1")
   newstr=newstr.replace(/\s/g,"")
   
   svgarr[i].innerHTML = svgarr[i].innerHTML.replace(/(.*)/,'<a style="color:hotpink" href=https://www.w3schools.com#' + newstr + ">$1</a>")
   
   }
   
   
} 
//document.getElementsByTagName("p")[0].contentEditable = true;
//document.getElementById('Subtitle').style.fontSize = "25px";
var mapImg = document.getElementsByTagName("a")
for (i = 0; i < mapImg.length; i++) {


mapImg[i].setAttribute("style", "fill:red");
//mapImg[i].setAttribute("style", "font-family:Verdana");
//alert(mapImg[0].innerHTML)
//colorLinks("#00FF00");
}
