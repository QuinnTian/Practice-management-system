/*
Theme Name: SmartMenus
Theme URI: http://www.smartmenus.org/
Description: The default theme for SmartMenus.org
Version: 1.0
Author: Vasil Dinkov
Author URI: http://vadikom.com/
*/



	/* ==================== | DEFAULT FONTS | ==================== */

body {
	font:112.5% Lora,Georgia,'Times New Roman',Times,serif;
	-webkit-text-size-adjust:100%;
}
table, th, td, input, select, textarea {
	font:1em Lora,Georgia,'Times New Roman',Times,serif;
}
pre, code {
	font:1em Consolas,'Lucida Console',Monaco,'Courier New',Courier,monospace;
}
@font-face {
	font-family:'Vadikom Icons';
	src:url('fonts/vadikom_icons.eot');
	src:url('fonts/vadikom_icons.eot?#iefix') format('embedded-opentype'),
		url('fonts/vadikom_icons.woff') format('woff'),
		url('fonts/vadikom_icons.ttf') format('truetype'),
		url('fonts/vadikom_icons.svg#VadikomIconsRegular') format('svg');
	font-weight:normal;
	font-style:normal;
}
@font-face {
	font-family:'Lora';
	src:url('fonts/lora_bold.eot');
	src:url('fonts/lora_bold.eot?#iefix') format('embedded-opentype'),
		url('fonts/lora_bold.woff') format('woff'),
		url('fonts/lora_bold.ttf') format('truetype'),
		url('fonts/lora_bold.svg#LoraBold') format('svg');
	font-weight:bold;
	font-style:normal;
}
@font-face {
	font-family:'Lora';
	src:url('fonts/lora_bold_italic.eot');
	src:url('fonts/lora_bold_italic.eot?#iefix') format('embedded-opentype'),
		url('fonts/lora_bold_italic.woff') format('woff'),
		url('fonts/lora_bold_italic.ttf') format('truetype'),
		url('fonts/lora_bold_italic.svg#LoraBoldItalic') format('svg');
	font-weight:bold;
	font-style:italic;
}
@font-face {
	font-family:'Lora';
	src:url('fonts/lora_italic.eot');
	src:url('fonts/lora_italic.eot?#iefix') format('embedded-opentype'),
		url('fonts/lora_italic.woff') format('woff'),
		url('fonts/lora_italic.ttf') format('truetype'),
		url('fonts/lora_italic.svg#LoraItalic') format('svg');
	font-weight:normal;
	font-style:italic;
}
@font-face {
	font-family:'Lora';
	src:url('fonts/lora.eot');
	src:url('fonts/lora.eot?#iefix') format('embedded-opentype'),
		url('fonts/lora.woff') format('woff'),
		url('fonts/lora.ttf') format('truetype'),
		url('fonts/lora.svg#LoraRegular') format('svg');
	font-weight:normal;
	font-style:normal;
}
@font-face {
	font-family:'PT Sans Narrow';
	src:url('fonts/pt_sans_narrow_bold.eot');
	src:url('fonts/pt_sans_narrow_bold.eot?#iefix') format('embedded-opentype'),
		url('fonts/pt_sans_narrow_bold.woff') format('woff'),
		url('fonts/pt_sans_narrow_bold.ttf') format('truetype'),
		url('fonts/pt_sans_narrow_bold.svg#PTSansNarrowBold') format('svg');
	font-weight:bold;
	font-style:normal;
}
@font-face {
	font-family:'PT Sans Narrow';
	src:url('fonts/pt_sans_narrow.eot');
	src:url('fonts/pt_sans_narrow.eot?#iefix') format('embedded-opentype'),
		url('fonts/pt_sans_narrow.woff') format('woff'),
		url('fonts/pt_sans_narrow.ttf') format('truetype'),
		url('fonts/pt_sans_narrow.svg#PTSansNarrowRegular') format('svg');
	font-weight:normal;
	font-style:normal;
}



	/* ==================== | DEFAULT STYLES | ==================== */

html, body, h1, h2, h3, h4, p, ul, ol, li, form, input, select, dl, dt, dd, fieldset, blockquote {
	margin:0;
	padding:0;
}
a img {
	border:none;
}
a.sup {
	text-decoration:none;
}
fieldset {
	display:block;
	border:0 solid;
}
abbr {
	border-bottom:1px dotted;
}
::selection {
	color:#222 !important;
	background:#fef5a5;
}
::-moz-selection {
	color:#222 !important;
	background:#fef5a5;
}
[data-icon]:before {
	font-family:"Vadikom Icons";
	content:attr(data-icon);
	font-weight:normal;
	font-style:normal;
}
abbr, acronym {
	border-bottom:1px dotted #DAD3C9;
}



	/* ==================== | LAYOUT | ==================== */

html {
	background:#7a756e url(images/footer_pattern.png) 50% 0;
}
body {
	color:#222;
}
#holder {
	background:#fbf3e8 url(images/content_pattern.png) 50% 0;
}
#header {
	padding:0 5px;
}
#header .inner, #content .inner , #banners .inner, #footer .inner {
	position:relative;
	margin:0 auto;
	max-width:780px;
}
* html #header .inner, * html #content .inner , * html #banners .inner, * html #footer .inner {
	width:780px;
}
#content {
	position:relative;
	z-index:2;
	padding:2.22em 10px 3em 10px;
	-moz-box-shadow:0 2px 2px rgba(0,0,0,0.15);
	-webkit-box-shadow:0 2px 2px rgba(0,0,0,0.15);
	box-shadow:0 2px 2px rgba(0,0,0,0.15);
}
#content .inner {
	max-width:730px;
}
* html #content .inner {
	width:730px;
}
body.home #content {
	text-shadow:0 1px 1px #fff;
}
body.home #content .inner {
	max-width:926px;
}
* html body.home #content .inner {
	width:926px;
}
body.forums #content {
	padding-bottom:1.77em;
}
#banners {
	padding:0 10px;
	position:relative;
	z-index:1;
	background:#fff;
	-moz-box-shadow:0 2px 2px rgba(0,0,0,0.15);
	-webkit-box-shadow:0 2px 2px rgba(0,0,0,0.15);
	box-shadow:0 2px 2px rgba(0,0,0,0.15);
}
#footer {
	padding:1.833em 10px 0 10px;
	background:#7a756e url(images/footer_pattern.png) 50% 0;
}



	/* ==================== | HEADER | ==================== */

#header .inner {
	z-index:3;
}
#menu-button {
	display:none;
	padding-top:1em;
	margin-bottom:-1.5em;
	text-align:center;
}
#menu-button.expand {
	margin-bottom:-3em;
}
#menu-button a {
	display:inline-block;
	border:1px solid #dad3c9;
	padding:0.111em 0.666em;
	text-decoration:none;
	color:#1675A1;
	white-space:nowrap;
	font-weight:bold;
	line-height:1.61em;
	-moz-border-radius:50px;
	-webkit-border-radius:50px;
	border-radius:50px;
}
#menu-button a:before {
	content:'Menu -';
}
#menu-button.expand a:before {
	content:'Menu +';
}
#nav {
	padding-top:2.778em;
}
#logo-menu {
	margin-right:-4px;
	font:italic bold 1em/10px Verdana,Arial,Helvetica,sans-serif;
}



	/* ==================== | CONTENT COLUMN | ==================== */

#content h1 {
	text-shadow:0 1px 1px #fff;
}
#content h1, #content h2, #content h3 {
	font-family:"PT Sans Narrow","Arial Narrow",Arial,Helvetica,sans-serif;
	font-weight:bold;
	color:#1675a1;
}
#content h1 {
	margin-bottom:0.36em;
	font-size:2.26em;
}
#content h2 {
	margin-bottom:0.416em;
	font-size:1.667em;
}
#content h3 {
	margin-bottom:0.4em;
	font-size:1.33em;
}
#content p, #content ul, #content dl, #content table {
	margin-bottom:1.5em;
	line-height:1.625em;
}
#content ul {
	list-style-type:circle;
	padding-left:1.3em;
}
#content ul ul {
	margin-bottom:0;
}
#content dt {
	margin-left:1.3em;
}
#content dd {
	margin:0 0 1.5em 1.3em;
}
#content dt a [data-icon] {
	position:relative;
}
#content dl a [data-icon]:before {
	position:absolute;
	margin:-1px 0 0 -1.3em;
	font-size:0.9375em;
}
#content a {
	color:#d23600;
	text-decoration:none;
}
#content a:hover, #content a:focus, #content a:active {
	color:#980000;
}
#content h2 a, #content h3 a {
	color:#1675A1;
	text-decoration:none;
}
#content h2 a:hover, #content h2 a:focus, #content h2 a:active, #content h3 a:hover, #content h3 a:focus, #content h3 a:active {
	color:#d23600;
}
#content img {
	max-width:100%;
}
/* home banner */
#home-banner h1 {
	margin-bottom:1em;
	font:italic 2.33em Lora,Georgia,'Times New Roman',Times,serif;
	color:#838383;
	text-align:center;
}
#home-banner h1 span {
	font-size:0.714em;
}
#home-banner h1 img {
	margin:0.34em 0 -0.2em 0;
	vertical-align:top;
}
#home-banner #slogan-1 {
	position:absolute;
	top:110px;
	left:550px;
	font-size:1.666em;
	line-height:1.222em !important;
}
#home-banner #slogan-1 strong {
	color:#d23600;
}
#home-banner #devices {
	margin-bottom:0.5em !important;
}
#home-banner #slogan-2 {
	text-align:center;
}
#home-banner #slogan-2 a, #content a.gray-button {
	display:inline-block;
	margin-left:1em;
	border:1px solid #dad3c9;
	padding:0.111em 0.666em;
	text-decoration:none;
	color:#1675A1;
	white-space:nowrap;
	font-weight:bold;
	line-height:1.61em;
	-moz-border-radius:50px;
	-webkit-border-radius:50px;
	border-radius:50px;
}
#home-banner #slogan-2 a:hover, #home-banner #slogan-2 a:focus, #home-banner #slogan-2 a:active, #content a.gray-button:hover, #content a.gray-button:focus, #content a.gray-button:active {
	color:#d23600;
}
#content a.gray-button {
	margin-left:auto;
}
/* Blog */
.post {
	border-top:1px dashed #dad3c9;
	padding-top:1.5em;
}
.post:first-child {
	border-top:0;
	padding-top:0;
}
.post-meta {
	font-size:0.889em;
}
#content a.tweet {
	margin-right:0.21em;
	border:1px solid #dad3c9;
	padding:0.14em 0.5em;
	text-decoration:none;
	color:#222;
	font-size:0.875em;
	-moz-border-radius:50px;
	-webkit-border-radius:50px;
	border-radius:50px;
}
#content a.tweet:hover, #content a.tweet:focus, #content a.tweet:active {
	color:#d23600;
}
#content a.tweet [data-icon]:before {
	position:relative;
	top:2px;
	margin-right:0.375em;
	font-size:0.9375em;
}
.pagination {
	text-align:center;
}
#content .pagination a {
	margin:1em 0.5em 0 0.5em;
	display:inline-block;
	border:1px solid #dad3c9;
	padding:0.111em 0.666em;
	text-decoration:none;
	color:#1675A1;
	-moz-border-radius:50px;
	-webkit-border-radius:50px;
	border-radius:50px;
}
#content .pagination a:hover, #content .pagination a:focus, #content .pagination a:active {
	color:#d23600;
}
table.generic {
	width:100%;
	border-collapse:collapse;
}
table.generic thead th {
	border-bottom:1px solid #DAD3C9;
	padding:0 0.5em 0.3em 0;
	font:bold 1.33em "PT Sans Narrow","Arial Narrow",Arial,Helvetica,sans-serif;
	background:transparent;
	color:#1675A1;
	text-align:left;
	vertical-align:bottom;
}
table.generic tbody th {
	border-bottom:1px dashed #DAD3C9;
	font:bold 1em Lora,Georgia,'Times New Roman',Times,serif;
	padding:0.833em 0.5em 0.833em 0;
	background:transparent;
	color:#BBB1A3;
	text-align:left;
	font-weight:normal;
	vertical-align:top;
}
table.generic tbody td {
	border-bottom:1px dashed #DAD3C9;
	padding:0.833em 0.5em 0.833em 0;
	text-align:left;
	vertical-align:top;
}
table.generic tfoot th, table.generic tfoot td {
	border-bottom:0;
	padding:0.833em 0.5em 0.833em 0;
}
table.generic span.note {
	font-size:0.833em;
	color:#70727C;
}
[data-rel='external']:after {
	margin-left:7px;
	content:'e';
	font-family:"Vadikom Icons";
	font-weight:normal;
	font-style:normal;
	font-size:11px;
	color:#838383;
}
#eula {
	width:95%;
	height:250px;
	border:1px solid #DAD3C9;
	padding:2%;
	background:#fff;
	font-family:Consolas,'Lucida Console',Monaco,'Courier New',Courier,monospace;
	font-size:0.833em;
}
#eula:focus {
	outline:none;
}
pre.code {
	border:1px solid #DAD3C9;
	padding:0.5em;
	background:#fafafa;
	overflow:auto;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
}
code {
	padding:0.15em;
	background:#fafafa;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;
}
a.more-link {
	display:block;
	margin-top:-0.5em;
	margin-bottom:1.5em;
}


	/* ==================== | BANNERS | ==================== */

#banners {
	height:100px;
}



	/* ==================== | FOOTER | ==================== */

#footer .col {
	width:30%;
}
#footer .col-1, #footer .col-2 {
	float:left;
}
#footer .col-1 {
	padding-right:5%;
}
#footer .col-3 {
	float:right;
}
#footer h2 {
	margin-bottom:0.27em;
	font-family:"PT Sans Narrow","Arial Narrow",Arial,Helvetica,sans-serif;
	font-size:1.375em;
	font-weight:bold;
	color:#fbecd7;
	text-shadow:0 1px 1px rgba(0,0,0,0.3);
}
#footer ul, #footer li {
	list-style:none;
}
#footer li {
	margin-bottom:0.44em;
}
#footer a {
	color:#fefaee;
	text-decoration:none;
	text-shadow:0 1px 1px rgba(0,0,0,0.3);
}
#footer a:hover, #footer a:focus, #footer a:active,
#footer a:hover [data-icon], #footer a:focus [data-icon], #footer a:active [data-icon] {
	color:#151515;
	text-shadow:0 1px 1px rgba(255,255,255,0.3);
}
#footer .col-1 [data-icon]:before {
	position:relative;
	top:2px;
	margin-right:0.375em;
	font-size:0.9375em;
}
#footer .icon-rss {
	color:#fd9e22;
}
#footer .icon-forum {
	color:#c3c3c3;
}
#footer .icon-twitter {
	color:#3cb2e5;
}
#footer .icon-contact {
	color:#DAD3C9;
}
#newsletter p {
	margin-bottom:0.75em;
	font-family:"Lucida Sans","Lucida Grande",Helvetica,Arial,sans-serif;
	font-size:0.75em;
	color:#fefaee;
}
#newsletter-input {
	position:relative;
	border:1px solid #6b655e;
	padding:7px 39px 7px 12px;
	background:#fbf1e3;
	cursor:text;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px;
	-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,0.3);
	-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,0.3);
	box-shadow:inset 0 1px 2px rgba(0,0,0,0.3);
}
#newsletter input {
	border:none;
	width:100%;
	background:transparent;
	color:#bbb1a3;
	font-family:Arial,Helvetica,sans-serif;
}
#newsletter input:focus {
	outline:none;
	color:#222;
}
#subscribe-button {
	position:absolute !important;
	top:50% !important;
	margin:-0.5em 0 0 11px !important;
	color:#388630;
	font-size:1.5em !important;
	cursor:pointer;
}
#subscribe-button.disabled {
	color:#d4dcbf;
	cursor:default;
}
#copyright {
	clear:both;
	padding:40px 0 35px 0;
	font-family:"PT Sans Narrow","Arial Narrow",Arial,Helvetica,sans-serif;
	font-size:0.8125em;
	font-weight:bold;
	color:#4e4b47;
	text-shadow:0 1px 1px rgba(255,255,255,0.2);
}
#copyright a {
	color:#4e4b47;
	text-decoration:none;
	text-shadow:0 1px 1px rgba(255,255,255,0.2);
}
/*
#project-vadikom {
	position:absolute;
	bottom:35px;
	right:0;
	text-align:right;
	font-size:0.875em;
	font-family:"PT Sans Narrow","Arial Narrow",Arial,Helvetica,sans-serif;
	font-weight:bold;
	text-shadow:none;
}
#project-vadikom a, #project-vadikom a:hover, #project-vadikom a:focus, #project-vadikom a:active {
	color:#fbecd7;
	text-shadow:none;
}
*/
#share {
	position:absolute;
	bottom:35px;
	right:0;
	text-align:right;
	font-family:"PT Sans Narrow","Arial Narrow",Arial,Helvetica,sans-serif;
	font-size:0.8125em;
	font-weight:bold;
	vertical-align:bottom;
	color:#4e4b47;
	text-shadow:0 1px 1px rgba(255,255,255,0.2);
}
#share .icon-share {
	font-size:1.2em;
	margin-left:5px;
	vertical-align:bottom;
	color:#4e4b47;
	text-shadow:0 1px 1px rgba(255,255,255,0.2);
}
#share iframe.twitter-share-button {
	width:96px !important;
}
#share #___plusone_0 {
	width:70px !important;
}



	/* ==================== | Docs page | ==================== */

html.docs {
	background:#fbf3e8;
}
body.docs {
	padding-bottom:0;
}
body.docs #content {
	padding-top:1em;
	padding-bottom:0.5em;
	min-width:1px; /* fix IE 7 */
}
body.docs #content .inner {
	margin:0 0.5em 0 15em;
}
body.docs #home-banner h1 {
	border-bottom:1px solid #DAD3C9;
	padding-bottom:0.7em;
}
.docs-home-link {
	display:none;
	text-align:center;
}
.docs-home-link a {
	font-weight:normal !important;
}
body.docs #content dl.docs-terms dt {
	margin:0 0 0.5em 0;
	font-weight:bold;
}
body.docs #content dl.docs-arguments {
	margin:0 0 0 1.3em;
}
body.docs #content dl.docs-arguments dt, body.docs #content dl.docs-arguments dd {
	margin:0;
}
#docs-footer {
	margin-top:3em;
	border-top:1px solid #DAD3C9;
	padding-top:0.5em;
	font-size:0.88em;
}
#docs-footer p {
	margin-bottom:0;
}
#docs-nav {
	position:fixed;
	top:0;
	left:0;
	width:13em;
	height:100%;
	overflow:auto;
	border-right:1px solid #DAD3C9;
	z-index:3;
}
/* Docs Menu */
/* The following will make the sub menus collapsible for small screen devices (it's not recommended editing these) */
ul#docs-menu ul{display:none;position:static !important;top:auto !important;left:auto !important;margin-left:0 !important;margin-top:0 !important;width:auto !important;min-width:0 !important;max-width:none !important;}
ul#docs-menu>li{float:none;}
ul#docs-menu>li>a{white-space:normal;}
ul#docs-menu ul.sm-nowrap>li>a{white-space:normal;}
ul#docs-menu iframe{display:none;}
#docs-menu {
	width:100%;
}
#docs-menu a {
	padding:10px 0 10px 28px;
	font-family:"PT Sans Narrow","Arial Narrow",Arial,Helvetica,sans-serif;
	font-size:1em;
	font-weight:bold;
	text-decoration:none;
	color:#1675a1;
}
#docs-menu a:hover, #docs-menu a:focus, #docs-menu a:active,
#docs-menu a.highlighted {
	color:#D23600;
}
#docs-menu > li {
	border-top:1px dashed #DAD3C9;
}
#docs-menu > li:first-child {
	border-top:0;
}
#docs-menu > li:last-child {
	text-align:center;
}
#docs-menu > li:last-child > a {
	margin:1.5em auto;
	display:inline-block;
	border:1px solid #dad3c9;
	padding:0.111em 0.666em;
	font-family:Lora,Georgia,'Times New Roman',Times,serif;
	font-size:0.88em;
	font-weight:normal;
	line-height:1.61em;
	-moz-border-radius:50px;
	-webkit-border-radius:50px;
	border-radius:50px;
}
/* Make sub indicators align to the left of the item */
#docs-menu a span.sub-arrow,
#docs-menu ul a span.sub-arrow {
	position:absolute;
	top:50%;
	margin-top:-9px;
	margin-left:-22px;
	width:17px;
	height:17px;
	font:bold 16px/16px monospace !important;
	text-align:center;
	border:0;
	text-shadow:none;
	background:rgba(0,0,0,0.1);
	-moz-border-radius:100px;
	-webkit-border-radius:100px;
	border-radius:100px;
}
/* Hide sub indicator "+" when item is expanded - we enable the item link when it's expanded */
#docs-menu a.highlighted span.sub-arrow {
	display:none !important;
}
#docs-menu ul {
	padding-bottom:10px;
}
#docs-menu ul a {
	padding:4px 0 4px 28px;
	font-family:Lora,Georgia,'Times New Roman',Times,serif;
	font-size:0.88em;
	font-weight:normal;
	color:#1675a1;
}
#docs-menu ul a:hover, #docs-menu ul a:focus, #docs-menu ul a:active {
	color:#D23600;
}
#docs-menu span.disabled {
	display:block;
	font-family:"PT Sans Narrow","Arial Narrow",Arial,Helvetica,sans-serif;
	font-size:1em;
	color:#BBB1A3;
	text-transform:uppercase;
	text-shadow:0px 1px 1px #fff;
	font-size:1em;
}



	/* ==================== | MISC | ==================== */

/* JS support on */
.js {

}
.hide {
	position:absolute;
	top:-9999px;
	left:-800px;
}
.nodisplay {
	display:none;
}
.pretty-amp {
	font-family:baskerville,'book antiqua',serif !important;
	font-style:italic !important;
	font-size:1.2em;
	line-height:1em;
}
.align-left {
	float:left;
}
.notice {
	padding:0.5em;
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	border-radius:8px;
	background:#FEF5A5;
}
/* START clearfix */
.clearfix:after {
	content:".";
	display:block;
	height:0;
	clear:both;
	visibility:hidden;
}
.clearfix {
	min-height:1px;
}
* html .clearfix {
	height:1px;
}
* html>body .clearfix {
	height:auto;
	display:inline-block;
}
/* END clearfix */



	/* ==================== | SmartMenus | ==================== */

/* Main Menu */
#main-menu {
	position:relative;
	top:0;
	left:0;
	width:auto;
	z-index:2;
}
#main-menu ul {
	width:12em;
}
/* right align and no separator for the last item */
#main-menu > li:last-child {
	float:right;
	border-left:0;
}
/* main menu icons */
#main-menu > li [data-icon]:before {
	position:relative;
	top:2px;
	line-height:20px;
	margin-right:0.375em;
	font-size:0.89em;
	text-shadow:none;
}
#main-menu.sm-blue > li [data-icon]:before {
	color:#A4CDE1;
}
/* round the right corners of the last item */
.sm-blue > li:last-child > a {
	-moz-border-radius:0 8px 8px 0;
	-webkit-border-radius:0 8px 8px 0;
	border-radius:0 8px 8px 0;
}
.sm-blue > li:first-child, .sm-blue > li:last-child {
	border-left:0;
}



	/* ==================== | Resposiveness | ==================== */

@media screen and (max-width: 966px) {
	/* home banner */
	body:not(.docs) #home-banner h1 {
		margin-bottom:0.6em;
		font-size:1.888em;
	}
	body:not(.docs) #home-banner h1 span {
		font-size:0.7058em;
	}
	body:not(.docs) #home-banner #smartmenus-logo {
		width:214px;
	}
	body:not(.docs) #home-banner #jquery-logo {
		width:135px;
	}
	body:not(.docs) #home-banner #slogan-1 {
		margin-bottom:1.33em;
		position:static;
		text-align:center;
		font-size:1.33em;
	}
	body:not(.docs) #home-banner #slogan-1 br {
		display:none;
	}
}
@media screen and (max-width: 799px) {
	body.docs #content .inner {
		margin:0 auto;
	}
	/* Docs menu */
	#docs-nav {
		display:none;
	}
	.docs-home-link {
		display:block;
	}
}
@media screen and (max-width: 700px) {
	#footer .col {
		width:47%;
	}
	#footer .col-1 {
		padding-right:5.5%;
	}
	#footer .col-3 {
		clear:both;
		float:none;
		width:auto;
		padding-top:1.5em;
	}
}
@media screen and (max-width: 640px) {
	#nav {
		padding-top:1em;
	}
	#menu-button {
		display:block;
	}
	/* Main menu */
	#main-menu.hidden {
		display:none;
	}
	/* the last item should not be floated to the right */
	#main-menu > li:last-child {
		float:none;
	}
	/* hide main menu icons */
	#main-menu > li [data-icon] {
		display:none;
	}
}
@media screen and (max-width: 520px) {
	body {
		font-size:94.44%;
	}
	#home-banner h1 {
		margin-bottom:0.8em;
	}
	#home-banner h1 span {
		display:block;
	}
	#home-banner #smartmenus-logo {
		width:187px;
	}
	#home-banner #jquery-logo {
		width:118px;
	}
	/* normal/visited items */
	ul.sm a, ul.sm a:visited {
		font-size:1.2em;
	}
	/* normal/visited items */
	ul.sm ul a, ul.sm ul a:visited {
		font-size:1.0667em;
	}
	#footer .col {
		float:none;
		clear:none;
		margin-bottom:1.5em;
		width:auto;
		padding:0;
	}
	#copyright {
		margin-bottom:2em;
		padding:0;
		text-align:center;
	}
	/*
	#project-vadikom {
		position:static;
		margin-bottom:2em;
		text-align:center;
	}
	*/
	#share {
		display:none;
	}
	table.generic th, table.generic td {
		padding-right:0.111em !important;
	}
	#content table.generic a.gray-button {
		display:inline;
		padding:0.111em 0.222em;
	}
}



	/* ==================== | SmartMenus .sm-blue class | ==================== */

/* SmartMenus Core CSS (it's not recommended editing this)
===============================================================*/

ul.sm,ul.sm li{display:block;list-style:none;padding:0;margin:0;line-height:normal;direction:ltr;}
ul.sm li{position:relative;}
ul.sm a{position:relative;display:block;}
ul.sm a.disabled{cursor:default;}
ul.sm ul{position:absolute;top:-9999px;left:-800px;width:100px;}
ul.sm li{float:left;}
ul.sm-rtl{direction:rtl;}
ul.sm-rtl li{float:right;}
ul.sm ul li,ul.sm-vertical li{float:none;}
ul.sm a{white-space:nowrap;}
ul.sm ul a,ul.sm-vertical a{white-space:normal;}
* html ul.sm-vertical li{float:left;width:100%;}
* html ul.sm-vertical ul li{float:none;width:auto;}
*:first-child+html ul.sm-vertical>li{float:left;width:100%;}
ul.sm ul.sm-nowrap>li>a{white-space:nowrap;}
ul.sm:after{content:"\00a0";display:block;height:0;font:0/0 serif;clear:both;visibility:hidden;overflow:hidden;}
* html ul.sm{height:1px;}
*:first-child+html ul.sm{min-height:1px;}
ul.sm{-webkit-tap-highlight-color:rgba(0,0,0,0);}


/*
---------------------------------------------------------------
  Note that styles you apply to the main menu items are inherited by the sub menus items too.
  If you'd like to avoid this, you could use child selectors (not supported by IE6) - for example:
  .sm-blue > li > a { ... } instead of .sm-blue a { ... }
---------------------------------------------------------------*/


/* Menu box
===================*/

	.sm-blue {
		background:#3193c0; /* Old browsers */
		background-image:url(css-gradients-fallback/main-menu-bg.png);
		background-image:-moz-linear-gradient(top,#4cb1e0 0%,#1675a1 100%);
		background-image:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#4cb1e0),color-stop(100%,#1675a1));
		background-image:-webkit-linear-gradient(top,#4cb1e0 0%,#1675a1 100%);
		background-image:-o-linear-gradient(top,#4cb1e0 0%,#1675a1 100%);
		background-image:-ms-linear-gradient(top,#4cb1e0 0%,#1675a1 100%);
		background-image:linear-gradient(top,#4cb1e0 0%,#1675a1 100%);
		-moz-border-radius:8px;
		-webkit-border-radius:8px;
		border-radius:8px;
		-moz-box-shadow:0 1px 1px rgba(0,0,0,0.3);
		-webkit-box-shadow:0 1px 1px rgba(0,0,0,0.3);
		box-shadow:0 1px 1px rgba(0,0,0,0.3);
	}
	.sm-blue-vertical {
		-moz-box-shadow:0 1px 4px rgba(0,0,0,0.3);
		-webkit-box-shadow:0 1px 4px rgba(0,0,0,0.3);
		box-shadow:0 1px 4px rgba(0,0,0,0.3);
	}
	.sm-blue ul {
		border:1px solid #a9a9a9;
		padding:7px 0;
		background:#fff;
		-moz-border-radius:0 0 4px 4px;
		-webkit-border-radius:0 0 4px 4px;
		border-radius:0 0 4px 4px;
		-moz-box-shadow:0 5px 12px rgba(0,0,0,0.3);
		-webkit-box-shadow:0 5px 12px rgba(0,0,0,0.3);
		box-shadow:0 5px 12px rgba(0,0,0,0.3);
	}
	/* for vertical main menu subs and 2+ level horizontal main menu subs round all corners */
	.sm-blue-vertical ul,
	.sm-blue ul ul {
		-moz-border-radius:4px;
		-webkit-border-radius:4px;
		border-radius:4px;
	}


/* Menu items
===================*/

	.sm-blue a {
		padding:13px 24px;
		color:#fff;
		font-size:18px;
		line-height:23px;
		font-family:"PT Sans Narrow","Arial Narrow",Arial,Helvetica,sans-serif;
		font-weight:bold;
		text-decoration:none;
		text-shadow:0 1px 0 rgba(0,0,0,0.3);
	}
	.sm-blue a:hover, .sm-blue a:focus, .sm-blue a:active,
	.sm-blue a.highlighted {
		background:#1983af; /* Old browsers */
		background-image:url(css-gradients-fallback/main-item-hover-bg.png);
		background-image:-moz-linear-gradient(top,#34a2d0 0%,#006791 100%);
		background-image:-webkit-gradient(linear,left top, left bottom,color-stop(0%,#34a2d0),color-stop(100%,#006791));
		background-image:-webkit-linear-gradient(top,#34a2d0 0%,#006791 100%);
		background-image:-o-linear-gradient(top,#34a2d0 0%,#006791 100%);
		background-image:-ms-linear-gradient(top,#34a2d0 0%,#006791 100%);
		background-image:linear-gradient(top,#34a2d0 0%,#006791 100%);
		color:#fff;
	}
	.sm-blue-vertical a {
		padding:9px 40px 8px 23px;
		background:#3193c0; /* Old browsers */
		background-image:url(css-gradients-fallback/vertical-main-item-bg.png);
		background-image:-moz-linear-gradient(top,#3fa3d1 0%,#2586b3 100%);
		background-image:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#3fa3d1),color-stop(100%,#2586b3));
		background-image:-webkit-linear-gradient(top,#3fa3d1 0%,#2586b3 100%);
		background-image:-o-linear-gradient(top,#3fa3d1 0%,#2586b3 100%);
		background-image:-ms-linear-gradient(top,#3fa3d1 0%,#2586b3 100%);
		background-image:linear-gradient(top,#3fa3d1 0%,#2586b3 100%);
	}
	.sm-blue ul a {
		padding:9px 40px 8px 23px;
		background:transparent;
		color:#247eab;
		font-size:16px;
		text-shadow:none;
	}
	.sm-blue ul a:hover, .sm-blue ul a:focus, .sm-blue ul a:active,
	.sm-blue ul a.highlighted {
		background:#3193c0; /* Old browsers */
		background-image:url(css-gradients-fallback/main-menu-bg.png);
		background-image:-moz-linear-gradient(top,#4cb1e0 0%,#1675a1 100%);
		background-image:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#4cb1e0),color-stop(100%,#1675a1));
		background-image:-webkit-linear-gradient(top,#4cb1e0 0%,#1675a1 100%);
		background-image:-o-linear-gradient(top,#4cb1e0 0%,#1675a1 100%);
		background-image:-ms-linear-gradient(top,#4cb1e0 0%,#1675a1 100%);
		background-image:linear-gradient(top,#4cb1e0 0%,#1675a1 100%);
		color:#fff;
		text-shadow:0 1px 0 rgba(0,0,0,0.3);
	}
	/* current items - add the class manually to some item or check the "markCurrentItem" script option */
	.sm-blue a.current, .sm-blue a.current:hover, .sm-blue a.current:focus, .sm-blue a.current:active,
	.sm-blue ul a.current, .sm-blue ul a.current:hover, .sm-blue ul a.current:focus, .sm-blue ul a.current:active {
		background:#006892;
		background-image:url(css-gradients-fallback/current-item-bg.png);
		background-image:-moz-linear-gradient(top,#005a84 0%,#00749f 100%);
		background-image:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#005a84),color-stop(100%,#00749f));
		background-image:-webkit-linear-gradient(top,#005a84 0%,#00749f 100%);
		background-image:-o-linear-gradient(top,#005a84 0%,#00749f 100%);
		background-image:-ms-linear-gradient(top,#005a84 0%,#00749f 100%);
		background-image:linear-gradient(top,#005a84 0%,#00749f 100%);
		color:#fff;
		text-shadow:0 1px 0 rgba(0,0,0,0.3);
	}
	/* round the left corners of the first item for horizontal main menu */
	.sm-blue > li:first-child > a {
		-moz-border-radius:8px 0 0 8px;
		-webkit-border-radius:8px 0 0 8px;
		border-radius:8px 0 0 8px;
	}
	/* round the corners of the first and last items for vertical main menu */
	.sm-blue-vertical > li:first-child > a {
		-moz-border-radius:8px 8px 0 0;
		-webkit-border-radius:8px 8px 0 0;
		border-radius:8px 8px 0 0;
	}
	.sm-blue-vertical > li:last-child > a {
		-moz-border-radius:0 0 8px 8px;
		-webkit-border-radius:0 0 8px 8px;
		border-radius:0 0 8px 8px;
	}
	.sm-blue a.has-submenu {

	}


/* Sub menu indicators
===================*/

	.sm-blue a span.sub-arrow {
		position:absolute;
		bottom:2px;
		left:50%;
		margin-left:-5px;
		/* we will use one-side border to create a triangle so that we don't use a real background image, of course, you can use a real image if you like too */
		width:0;
		height:0;
		overflow:hidden;
		border-width:5px; /* tweak size of the arrow */
		border-style:solid dashed dashed dashed;
		border-color:#a4cde1 transparent transparent transparent;
	}
	.sm-blue-vertical a span.sub-arrow,
 	.sm-blue ul a span.sub-arrow {
		bottom:auto;
		top:50%;
		margin-top:-5px;
		right:15px;
		left:auto;
		margin-left:0;
		border-style:dashed dashed dashed solid;
		border-color:transparent transparent transparent #a4cde1;
	}


/* Items separators
===================*/

	.sm-blue li {
		border-left:1px solid #1a8bb9;
	}
	.sm-blue li:first-child,
	.sm-blue-vertical li,
	.sm-blue ul li {
		border-left:0;
	}


/* Scrolling arrows containers for tall sub menus - test sub menu: "Sub test" -> "more..." -> "more..." in the default download package
===================*/

	.sm-blue span.scroll-up, .sm-blue span.scroll-down {
		position:absolute;
		display:none;
		visibility:hidden;
		overflow:hidden;
		background:#ffffff;
		height:20px;
		/* width and position will be automatically set by the script */
	}
	.sm-blue span.scroll-up-arrow, .sm-blue span.scroll-down-arrow {
		position:absolute;
		top:-2px;
		left:50%;
		margin-left:-8px;
		/* we will use one-side border to create a triangle so that we don't use a real background image, of course, you can use a real image if you like too */
		width:0;
		height:0;
		overflow:hidden;
		border-width:8px; /* tweak size of the arrow */
		border-style:dashed dashed solid dashed;
		border-color:transparent transparent #247eab transparent;
	}
	.sm-blue span.scroll-down-arrow {
		top:6px;
		border-style:solid dashed dashed dashed;
		border-color:#247eab transparent transparent transparent;
	}



/*
---------------------------------------------------------------
  Responsiveness
  These will make the sub menus collapsible when the screen width is too small.
---------------------------------------------------------------*/


/* decrease horizontal main menu items left/right padding to avoid wrapping */
@media screen and (max-width: 700px) {
	.sm-blue:not(.sm-blue-vertical) > li > a {
		padding-left:18px;
		padding-right:18px;
	}
}

@media screen and (max-width: 640px) {

	/* The following will make the sub menus collapsible for small screen devices (it's not recommended editing these) */
	ul.sm-blue{width:auto !important;}
	ul.sm-blue ul{display:none;position:static !important;top:auto !important;left:auto !important;margin-left:0 !important;margin-top:0 !important;width:auto !important;min-width:0 !important;max-width:none !important;}
	ul.sm-blue>li{float:none;}
	ul.sm-blue>li>a,ul.sm-blue ul.sm-nowrap>li>a{white-space:normal;}
	ul.sm-blue iframe{display:none;}

	/* Uncomment this rule to disable completely the sub menus for small screen devices */
	/*.sm-blue ul, .sm-blue span.sub-arrow, .sm-blue iframe {
		display:none !important;
	}*/


/* Menu box
===================*/

	.sm-blue {
		background:transparent;
		-moz-box-shadow:0 1px 4px rgba(0,0,0,0.3);
		-webkit-box-shadow:0 1px 4px rgba(0,0,0,0.3);
		box-shadow:0 1px 4px rgba(0,0,0,0.3);
	}
	.sm-blue ul {
		border:0;
		padding:0;
		background:#fff;
		-moz-border-radius:0;
		-webkit-border-radius:0;
		border-radius:0;
		-moz-box-shadow:none;
		-webkit-box-shadow:none;
		box-shadow:none;
	}
	.sm-blue ul ul {
		/* darken the background of the 2+ level sub menus and remove border rounding */
		background:rgba(100,100,100,0.1);
		-moz-border-radius:0;
		-webkit-border-radius:0;
		border-radius:0;
	}


/* Menu items
===================*/

	.sm-blue a,
	.sm-blue a:hover, .sm-blue a:focus, .sm-blue a:active,
	.sm-blue a.highlighted {
		padding:10px 5px 10px 28px !important; /* add some additional left padding to make room for the sub indicator */
		background:#3193c0; /* Old browsers */
		background-image:url(css-gradients-fallback/vertical-main-item-bg.png);
		background-image:-moz-linear-gradient(top,#3fa3d1 0%,#2586b3 100%);
		background-image:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#3fa3d1),color-stop(100%,#2586b3));
		background-image:-webkit-linear-gradient(top,#3fa3d1 0%,#2586b3 100%);
		background-image:-o-linear-gradient(top,#3fa3d1 0%,#2586b3 100%);
		background-image:-ms-linear-gradient(top,#3fa3d1 0%,#2586b3 100%);
		background-image:linear-gradient(top,#3fa3d1 0%,#2586b3 100%);
		color:#fff;
	}
	.sm-blue ul a,
	.sm-blue ul a:hover, .sm-blue ul a:focus, .sm-blue ul a:active,
	.sm-blue ul a.highlighted {
		background:transparent;
		color:#247eab;
		text-shadow:none;
	}
	.sm-blue a.current, .sm-blue a.current:hover, .sm-blue a.current:focus, .sm-blue a.current:active,
	.sm-blue ul a.current, .sm-blue ul a.current:hover, .sm-blue ul a.current:focus, .sm-blue ul a.current:active {
		background:#006892; /* Old browsers */
		background-image:url(css-gradients-fallback/current-item-bg.png);
		background-image:-moz-linear-gradient(top,#005a84 0%,#00749f 100%);
		background-image:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#005a84),color-stop(100%,#00749f));
		background-image:-webkit-linear-gradient(top,#005a84 0%,#00749f 100%);
		background-image:-o-linear-gradient(top,#005a84 0%,#00749f 100%);
		background-image:-ms-linear-gradient(top,#005a84 0%,#00749f 100%);
		background-image:linear-gradient(top,#005a84 0%,#00749f 100%);
		color:#fff;
	}
	/* add some text indentation for the 2+ level sub menu items */
	.sm-blue ul a {
		border-left:8px solid transparent;
	}
	.sm-blue ul ul a {
		border-left:16px solid transparent;
	}
	.sm-blue ul ul ul a {
		border-left:24px solid transparent;
	}
	.sm-blue ul ul ul ul a {
		border-left:32px solid transparent;
	}
	.sm-blue ul ul ul ul ul a {
		border-left:40px solid transparent;
	}
	/* round the corners of the first and last items */
	.sm-blue > li:first-child > a {
		-moz-border-radius:8px 8px 0 0;
		-webkit-border-radius:8px 8px 0 0;
		border-radius:8px 8px 0 0;
	}
	/* presume we have 4 levels max */
	.sm-blue > li:last-child > a,
	.sm-blue > li:last-child > ul > li:last-child > a,
	.sm-blue > li:last-child > ul > li:last-child > ul > li:last-child > a,
	.sm-blue > li:last-child > ul > li:last-child > ul > li:last-child > ul > li:last-child > a,
	.sm-blue > li:last-child > ul > li:last-child > ul > li:last-child > ul > li:last-child > ul > li:last-child > a,
	.sm-blue > li:last-child > ul,
	.sm-blue > li:last-child > ul > li:last-child > ul,
	.sm-blue > li:last-child > ul > li:last-child > ul > li:last-child > ul,
	.sm-blue > li:last-child > ul > li:last-child > ul > li:last-child > ul > li:last-child > ul,
	.sm-blue > li:last-child > ul > li:last-child > ul > li:last-child > ul > li:last-child > ul > li:last-child > ul {
		-moz-border-radius:0 0 8px 8px;
		-webkit-border-radius:0 0 8px 8px;
		border-radius:0 0 8px 8px;
	}
	/* highlighted items, don't need rounding since their sub is open */
	.sm-blue > li:last-child > a.highlighted,
	.sm-blue > li:last-child > ul > li:last-child > a.highlighted,
	.sm-blue > li:last-child > ul > li:last-child > ul > li:last-child > a.highlighted,
	.sm-blue > li:last-child > ul > li:last-child > ul > li:last-child > ul > li:last-child > a.highlighted,
	.sm-blue > li:last-child > ul > li:last-child > ul > li:last-child > ul > li:last-child > ul > li:last-child > a.highlighted {
		-moz-border-radius:0;
		-webkit-border-radius:0;
		border-radius:0;
	}


/* Sub menu indicators
===================*/

	.sm-blue a span.sub-arrow,
	.sm-blue ul a span.sub-arrow {
		top:50%;
		margin-top:-9px;
		right:auto;
		left:6px;
		margin-left:0;
		width:17px;
		height:17px;
		font:bold 16px/16px monospace !important;
		text-align:center;
		border:0;
		text-shadow:none;
		background:rgba(0,0,0,0.1);
		-moz-border-radius:100px;
		-webkit-border-radius:100px;
		border-radius:100px;
	}
	/* Hide sub indicator "+" when item is expanded - we enable the item link when it's expanded */
	.sm-blue a.highlighted span.sub-arrow {
		display:none !important;
	}


/* Items separators
===================*/

	.sm-blue li {
		border-left:0;
	}
	.sm-blue ul li {
		border-top:1px solid rgba(0,0,0,0.05);
	}
	.sm-blue ul li:first-child {
		border-top:0;
	}

}



	/* ==================== | SHJS (syntax highlighter) | ==================== */

pre.sh_sourceCode .sh_keyword {
	color: #aa0d91;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_type {
	color: #008000;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_string {
	color: #c80000;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_regexp {
	color: #008000;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_specialchar {
	color: #ff00ff;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_comment {
	color: #007400;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_number {
	color: #3200ff;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_preproc {
	color: #008200;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_function {
	color: #000000;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_url {
	color: #008000;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_date {
	color: #000000;
	font-weight: bold;
	font-style: normal;
}
pre.sh_sourceCode .sh_time {
	color: #000000;
	font-weight: bold;
	font-style: normal;
}
pre.sh_sourceCode .sh_file {
	color: #000000;
	font-weight: bold;
	font-style: normal;
}
pre.sh_sourceCode .sh_ip {
	color: #008000;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_name {
	color: #008000;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_variable {
	color: #000000;
	font-weight: bold;
	font-style: normal;
}
pre.sh_sourceCode .sh_oldfile {
	color: #ff00ff;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_newfile {
	color: #008000;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_difflines {
	color: #000000;
	font-weight: bold;
	font-style: normal;
}
pre.sh_sourceCode .sh_selector {
	color: #000000;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_property {
	color: #c80000;
	font-weight: normal;
	font-style: normal;
}
pre.sh_sourceCode .sh_value {
	color: #3200ff;
	font-weight: normal;
	font-style: normal;
}