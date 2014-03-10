
var imgIndex = 0;
var imgArray= [];
for(var i=0; i<7; i++){
    var loadImage = new Image();
    loadImage.src= "tour/tour"+(i+1)+".jpg";
    imgArray.push(loadImage);

}

//display the slide before the currently displayed slide
//Had some help cause I got all mixed up....
function prev_slide(){
    if(imgIndex - 1 == -1){
        imgIndex = imgArray.length -1
    } else{
        imgIndex = imgIndex - 1;
    }
    document.getElementById("original").src=imgArray[imgIndex].src;
    return false;
}

//#####################################

//display the slide after the current image

function next_slide(){
    if(imgIndex + 1==imgArray.length){
        imgIndex=0;
    }else{
        imgIndex++
    }
    document.getElementById("original").src=imgArray[imgIndex].src;
    return false;
}