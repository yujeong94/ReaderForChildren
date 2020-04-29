<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 	* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0} */
.mySlides {display: none}
.sImg {vertical-align: middle; width: 600px; height: 450px;}

/* Slideshow container */
.slideshow-container {
  max-width: 600px;
  position: relative;
  margin-top: 0;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 70%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  background: red;
}

/* Position the "next button" to the right */
.next {
  right: 200px;
  border-radius: 3px;
}

.prev {
	left: 600px;
	border-radius: 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  /* background-color: rgba(0,0,0,0.8); */
  background-color: yellow;
}

/* Caption text */
/* .text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
} */

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}


</style>
</head>
<body>
<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<div class="slideshow-container">

	<div class="mySlides fade">
	  <div class="numbertext">1 / 3</div>
	  <img src="${ contextPath }/resources/images/slide1.jpg" class="sImg">
	  <!-- <div class="text">Caption Text</div> -->
	</div>
	
	<div class="mySlides fade">
	  <div class="numbertext">2 / 3</div>
	  <img src="${ contextPath }/resources/images/slide2.png" class="sImg">
	</div>
	
	<div class="mySlides fade">
	  <div class="numbertext">3 / 3</div>
	  <img src="http://placehold.it/300x100" class="sImg">
	</div>

</div>
<a class="next" onclick="plusSlides(1)">&#10095;</a>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
</body>
</html>