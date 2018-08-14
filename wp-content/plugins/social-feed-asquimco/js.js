$(document).ready(function(){
var d = document.getElementByClass('fts-jal-fb-right-wrap');
var x = document.createElement('div');
x.class = 'div-paddings-box col-md-12 col-lg-12 col-sm-12';
var y = document.createElement('div');
y.class = 'div-paddings-0px actividades-twitter-box font30px col-md-2';
var i = document.createElement('i');
i.class = 'margin-bottom0px fa fa-twitter';

d.insertBefore(x,d);

// $('.fts-fb-photo-post-wrap .fts-jal-single-fb-post').insertBefore('<div class="div-paddings-box col-md-12 col-lg-12 col-sm-12"  style="padding-bottom: 0px;">'+
//                 '<div class="div-paddings-0px actividades-twitter-box font30px col-md-2">'+
//                     '<i class="margin-bottom0px fa fa-twitter"></i>'+
//                 '</div>');
});
