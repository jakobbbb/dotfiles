// ==UserScript==
// @name          Not Reddit Dark Theme
// @namespace     http://userstyles.org
// @description	  Simple flat dark grey theme not for Reddit.
// @author        jakobbbb
// @homepage      https://github.com/jakobbbb/dotfiles
// @include       http://news.ycombinator.com/*
// @include       https://news.ycombinator.com/*
// @include       https://news.ycombinator.com/
// @run-at        document-start
// @version       0.20181013223425
// ==/UserScript==
(() => {let css = `
body  { font-family:Verdana, Geneva, sans-serif; font-size:10pt; color:#7d7d7d; background-color:black;}
td    { font-family:Verdana, Geneva, sans-serif; font-size:10pt; color:#7d7d7d; }
table#hnmain { background-color:#16160f }
#hnmain > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1) > table:nth-child(1) {  background-color:#572300; }
textarea { background-color:#201f1f }

.admin td   { font-family:Verdana, Geneva, sans-serif; font-size:8.5pt; color:#ffffff; }
.subtext td { font-family:Verdana, Geneva, sans-serif; font-size:  7pt; color:#7d7d7d; }

input    { font-family:monospace; font-size:10pt; background-color: black;border: none;color: grey;}
input[type=\"submit\"] { font-family:Verdana, Geneva, sans-serif; }
textarea { font-family:monospace; font-size:10pt; background-color: #201f1f;border: none;}

a:link    { color:#ffffff; text-decoration:none; }
a:visited { color:#7d7d7d; text-decoration:none; }

.default { font-family:Verdana, Geneva, sans-serif; font-size: 10pt; color:#7d7d7d; }
.admin   { font-family:Verdana, Geneva, sans-serif; font-size:8.5pt; color:#ffffff; }
.title   { font-family:Verdana, Geneva, sans-serif; font-size: 10pt; color:#7d7d7d; }
.subtext { font-family:Verdana, Geneva, sans-serif; font-size:  7pt; color:#7d7d7d; }
.yclinks { font-family:Verdana, Geneva, sans-serif; font-size:  8pt; color:#7d7d7d; }
.pagetop { font-family:Verdana, Geneva, sans-serif; font-size: 10pt; color:#dddddd; }
.comhead { font-family:Verdana, Geneva, sans-serif; font-size:  8pt; color:#7d7d7d; }
.comment { font-family:Verdana, Geneva, sans-serif; font-size:  9pt; }
.hnname  { margin-right: 5px; }

.comment a:link, .comment a:visited { text-decoration: underline; }
.noshow { display: none; }
.nosee { visibility: hidden; pointer-events: none; cursor: default }

.c00, .c00 a:link { color:#ffffff; }
.c5a, .c5a a:link, .c5a a:visited { color:#a5a5a5; }
.c73, .c73 a:link, .c73 a:visited { color:#8c8c8c; }
.c82, .c82 a:link, .c82 a:visited { color:#7d7d7d; }
.c88, .c88 a:link, .c88 a:visited { color:#777777; }
.c9c, .c9c a:link, .c9c a:visited { color:#636363; }
.cae, .cae a:link, .cae a:visited { color:#515151; }
.cbe, .cbe a:link, .cbe a:visited { color:#414141; }
.cce, .cce a:link, .cce a:visited { color:#313131; }
.cdd, .cdd a:link, .cdd a:visited { color:#222222; }

.pagetop a:visited { color:#ffffff;}
.topsel a:link, .topsel a:visited { color:#000000; }

.subtext a:link, .subtext a:visited { color:#7d7d7d; }
.subtext a:hover { text-decoration:underline; }

.comhead a:link, .subtext a:visited { color:#7d7d7d; }
.comhead a:hover { text-decoration:underline; }

.hnmore a:link, a:visited { color:#7d7d7d; }
.hnmore { text-decoration:underline; }

.default p { margin-top: 8px; margin-bottom: 0px; }

.pagebreak {page-break-before:always}

pre { overflow: auto; padding: 2px; }
pre:hover { overflow:auto }

.votearrow {
  width:      10px;
  height:     10px;
  border:     0px;
  margin:     3px 2px 6px;
  background: url("grayarrow.gif")
  no-repeat;
}

.votelinks.nosee div.votearrow.rotate180 {
  display: none;
}

@media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min-device-pixel-ratio: 2) {
  .votearrow { background-size: 10px; background-image: url("grayarrow2x.gif"); }
}

.rotate180 {
  -webkit-transform: rotate(180deg);  /* Chrome and other webkit browsers */
  -moz-transform:    rotate(180deg);  /* FF */
  -o-transform:      rotate(180deg);  /* Opera */
  -ms-transform:     rotate(180deg);  /* IE9 */
  transform:         rotate(180deg);  /* W3C complaint browsers */

  /* IE8 and below */
  -ms-filter: "progid:DXImageTransform.Microsoft.Matrix(M11=-1, M12=0, M21=0, M22=-1, DX=0, DY=0, SizingMethod='auto expand')";
}

/* mobile device */
@media only screen
and (min-width : 300px)
and (max-width : 750px) {
  #hnmain { width: 100%; }
  body { padding: 0; margin: 0; width: 100%; -webkit-text-size-adjust: none; }
  td { height: inherit !important; }
  .title, .comment { font-size: inherit;  }
  span.pagetop { display: block; margin: 3px 5px; font-size: 12px; }
  span.pagetop b { display: block; font-size: 15px; }
  table.comment-tree .comment a { display: inline-block; max-width: 200px; overflow: hidden; white-space: nowrap;
    text-overflow: ellipsis; vertical-align:top; }
  img[src='s.gif'][width='40'] { width: 12px; }
  img[src='s.gif'][width='80'] { width: 24px; }
  img[src='s.gif'][width='120'] { width: 36px; }
  img[src='s.gif'][width='160'] { width: 48px; }
  img[src='s.gif'][width='200'] { width: 60px; }
  img[src='s.gif'][width='240'] { width: 72px; }
  img[src='s.gif'][width='280'] { width: 84px; }
  img[src='s.gif'][width='320'] { width: 96px; }
  img[src='s.gif'][width='360'] { width: 108px; }
  img[src='s.gif'][width='400'] { width: 120px; }
  img[src='s.gif'][width='440'] { width: 132px; }
  img[src='s.gif'][width='480'] { width: 144px; }
  img[src='s.gif'][width='520'] { width: 156px; }
  img[src='s.gif'][width='560'] { width: 168px; }
  img[src='s.gif'][width='600'] { width: 180px; }
  img[src='s.gif'][width='640'] { width: 192px; }
  img[src='s.gif'][width='680'] { width: 204px; }
  img[src='s.gif'][width='720'] { width: 216px; }
  img[src='s.gif'][width='760'] { width: 228px; }
  img[src='s.gif'][width='800'] { width: 240px; }
  img[src='s.gif'][width='840'] { width: 252px; }
  .title { font-size: 11pt; line-height: 14pt;  }
  .subtext { font-size: 9pt; }
  .itemlist { padding-right: 5px;}
  .votearrow { transform: scale(1.3,1.3); margin-right: 6px; }
  .votearrow.rotate180 {
    -webkit-transform: rotate(180deg) scale(1.3,1.3);  /* Chrome and other webkit browsers */
    -moz-transform:    rotate(180deg) scale(1.3,1.3);  /* FF */
    -o-transform:      rotate(180deg) scale(1.3,1.3);  /* Opera */
    -ms-transform:     rotate(180deg) scale(1.3,1.3);  /* IE9 */
    transform:         rotate(180deg) scale(1.3,1.3);  /* W3C complaint browsers */
  }
  .votelinks { min-width: 18px; }
  .votelinks a { display: block; margin-bottom: 9px; }
  input[type='text'], input[type='number'], textarea { font-size: 16px; width: 90%; }
}

.comment { max-width: 1215px; overflow: hidden }
pre { max-width: 900px; }

@media only screen and (min-width : 300px) and (max-width : 389px) {
  .comment { max-width: 270px; overflow: hidden }
  pre { max-width: 200px; }
}
@media only screen and (min-width : 390px) and (max-width : 509px) {
  .comment { max-width: 350px; overflow: hidden }
  pre { max-width: 260px; }
}
@media only screen and (min-width : 510px) and (max-width : 599px) {
  .comment { max-width: 460px; overflow: hidden }
  pre { max-width: 340px; }
}
@media only screen and (min-width : 600px) and (max-width : 689px) {
  .comment { max-width: 540px; overflow: hidden }
  pre { max-width: 400px; }
}
@media only screen and (min-width : 690px) and (max-width : 809px) {
  .comment { max-width: 620px; overflow: hidden }
  pre { max-width: 460px; }
}
@media only screen and (min-width : 810px) and (max-width : 899px) {
  .comment { max-width: 730px; overflow: hidden }
  pre { max-width: 540px; }
}
@media only screen and (min-width : 900px) and (max-width : 1079px) {
  .comment { max-width: 810px; overflow: hidden }
  pre { max-width: 600px; }
}
@media only screen and (min-width : 1080px) and (max-width : 1169px) {
  .comment { max-width: 970px; overflow: hidden }
  pre { max-width: 720px; }
}
@media only screen and (min-width : 1170px) and (max-width : 1259px) {
  .comment { max-width: 1050px; overflow: hidden }
  pre { max-width: 780px; }
}
@media only screen and (min-width : 1260px) and (max-width : 1349px) {
  .comment { max-width: 1130px; overflow: hidden }
  pre { max-width: 840px; }
}
`;
if (typeof GM_addStyle != "undefined") {
  GM_addStyle(css);
} else if (typeof PRO_addStyle != "undefined") {
  PRO_addStyle(css);
} else if (typeof addStyle != "undefined") {
  addStyle(css);
} else {
  var node = document.createElement("style");
  node.type = "text/css";
  node.appendChild(document.createTextNode(css));
  var heads = document.getElementsByTagName("head");
  if (heads.length > 0) {
    heads[0].appendChild(node);
  } else {
    // no head yet, stick it whereever
    document.documentElement.appendChild(node);
  }
}
})();
