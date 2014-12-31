function introStart(q,f){"object"===typeof exports?f(exports):"function"===typeof define&&define.amd?define(["exports"],f):f(q)}
var introfunction=function(q){function f(a){this._targetElement=a;this._options={nextLabel:"Next &rarr;",prevLabel:"&larr; Back",skipLabel:"Skip",doneLabel:"Done",tooltipPosition:"bottom",tooltipClass:"",exitOnEsc:!0,exitOnOverlayClick:!0,showStepNumbers:!0}}function y(a){var b=[],c=this;if(this._options.steps)for(var d=[],m=0,d=this._options.steps.length;m<d;m++){var f=this._options.steps[m];f.step=m+1;"string"===typeof f.element&&(f.element=document.querySelector(f.element));b.push(f)}else{d=a.querySelectorAll("*[data-intro]");
if(1>d.length)return!1;m=0;for(f=d.length;m<f;m++){var h=d[m];b.push({element:h,intro:h.getAttribute("data-intro"),step:parseInt(h.getAttribute("data-step"),10),tooltipClass:h.getAttribute("data-tooltipClass"),position:h.getAttribute("data-position")||this._options.tooltipPosition,action:h.getAttribute("data-intro-action")?h.getAttribute("data-intro-action"):""})}}b.sort(function(a,b){return a.step-b.step});c._introItems=b;z.call(c,a)&&(s.call(c),a.querySelector(".introjs-skipbutton"),a.querySelector(".introjs-nextbutton"),
c._onKeyDown=function(b){if(27===b.keyCode&&!0==c._options.exitOnEsc)r.call(c,a),void 0!=c._introExitCallback&&c._introExitCallback.call(c);else if(37===b.keyCode)u.call(c);else if(39===b.keyCode||13===b.keyCode)s.call(c),b.preventDefault?b.preventDefault():b.returnValue=!1},c._onResize=function(a){t.call(c,document.querySelector(".introjs-helperLayer"))},window.addEventListener?(window.addEventListener("keydown",c._onKeyDown,!0),window.addEventListener("resize",c._onResize,!0)):document.attachEvent&&
(document.attachEvent("onkeydown",c._onKeyDown),document.attachEvent("onresize",c._onResize)));return!1}function s(){if("undefined"===typeof this._currentStep){this._currentStep=0;var a=this._introItems[this._currentStep]}else a=this._introItems[this._currentStep],++this._currentStep;a.action&&eval(a.action);this._introItems.length<=this._currentStep?("function"===typeof this._introCompleteCallback&&this._introCompleteCallback.call(this),r.call(this,this._targetElement)):(a=this._introItems[this._currentStep],
"undefined"!==typeof this._introBeforeChangeCallback&&this._introBeforeChangeCallback.call(this,a.element),v.call(this,a))}function u(){if(0===this._currentStep)return!1;var a=this._introItems[--this._currentStep];"undefined"!==typeof this._introBeforeChangeCallback&&this._introBeforeChangeCallback.call(this,a.element);v.call(this,a)}function r(a){var b=a.querySelector(".introjs-overlay");b.style.opacity=0;setTimeout(function(){b.parentNode&&b.parentNode.removeChild(b)},500);(a=a.querySelector(".introjs-helperLayer"))&&
a.parentNode.removeChild(a);if(a=document.querySelector(".introjs-showElement"))a.className=a.className.replace(/introjs-[a-zA-Z]+/g,"").replace(/^\s+|\s+$/g,"");if((a=document.querySelectorAll(".introjs-fixParent"))&&0<a.length)for(var c=a.length-1;0<=c;c--)a[c].className=a[c].className.replace(/introjs-fixParent/g,"").replace(/^\s+|\s+$/g,"");window.removeEventListener?window.removeEventListener("keydown",this._onKeyDown,!0):document.detachEvent&&document.detachEvent("onkeydown",this._onKeyDown);
this._currentStep=void 0}function w(a,b,c){b.style.top=null;b.style.right=null;b.style.bottom=null;b.style.left=null;if(this._introItems[this._currentStep]){var d="",d=this._introItems[this._currentStep],d="string"===typeof d.tooltipClass?d.tooltipClass:this._options.tooltipClass;b.className=("introjs-tooltip "+d).replace(/^\s+|\s+$/g,"");switch(this._introItems[this._currentStep].position){case "top":b.style.left="15px";b.style.top="-"+(n(b).height+10)+"px";c.className="introjs-arrow bottom";break;
case "right":b.style.left=n(a).width+20+"px";c.className="introjs-arrow left";break;case "left":b.style.top="15px";b.style.right=n(a).width+20+"px";c.className="introjs-arrow right";break;default:b.style.bottom="-"+(n(b).height+10)+"px",c.className="introjs-arrow top"}}}function t(a){if(a&&this._introItems[this._currentStep]){var b=n(this._introItems[this._currentStep].element);a.setAttribute("style","width: "+(b.width+10)+"px; height:"+(b.height+10)+"px; top:"+(b.top-5)+"px;left: "+(b.left-5)+"px;")}}
function v(a){"undefined"!==typeof this._introChangeCallback&&this._introChangeCallback.call(this,a.element);var b=this,c=document.querySelector(".introjs-helperLayer");n(a.element);if(null!=c){var d=c.querySelector(".introjs-helperNumberLayer"),f=c.querySelector(".introjs-tooltiptext"),q=c.querySelector(".introjs-arrow"),h=c.querySelector(".introjs-tooltip"),e=c.querySelector(".introjs-skipbutton"),g=c.querySelector(".introjs-prevbutton"),l=c.querySelector(".introjs-nextbutton");h.style.opacity=
0;t.call(b,c);if((c=document.querySelectorAll(".introjs-fixParent"))&&0<c.length)for(var k=c.length-1;0<=k;k--)c[k].className=c[k].className.replace(/introjs-fixParent/g,"").replace(/^\s+|\s+$/g,"");c=document.querySelector(".introjs-showElement");c.className=c.className.replace(/introjs-[a-zA-Z]+/g,"").replace(/^\s+|\s+$/g,"");b._lastShowElementTimer&&clearTimeout(b._lastShowElementTimer);b._lastShowElementTimer=setTimeout(function(){null!=d&&(d.innerHTML=a.step);f.innerHTML=a.intro;w.call(b,a.element,
h,q);h.style.opacity=1},350)}else{e=document.createElement("div");c=document.createElement("div");k=document.createElement("div");e.className="introjs-helperLayer";t.call(b,e);this._targetElement.appendChild(e);c.className="introjs-arrow";k.innerHTML='<div class="introjs-tooltiptext">'+a.intro+'</div><div class="introjs-tooltipbuttons"></div>';this._options.showStepNumbers&&(g=document.createElement("span"),g.className="introjs-helperNumberLayer",g.innerHTML=a.step,e.appendChild(g));k.appendChild(c);
e.appendChild(k);l=document.createElement("a");l.onclick=function(){b._introItems.length-1!=b._currentStep&&s.call(b)};l.href="javascript:void(0);";l.innerHTML=this._options.nextLabel;g=document.createElement("a");g.onclick=function(){0!=b._currentStep&&u.call(b)};g.href="javascript:void(0);";g.innerHTML=this._options.prevLabel;e=document.createElement("a");e.className="introjs-button introjs-skipbutton";e.href="javascript:void(0);";e.innerHTML=this._options.skipLabel;e.onclick=function(){b._introItems.length-
1==b._currentStep&&"function"===typeof b._introCompleteCallback&&b._introCompleteCallback.call(b);b._introItems.length-1!=b._currentStep&&"function"===typeof b._introExitCallback&&b._introExitCallback.call(b);r.call(b,b._targetElement)};var p=k.querySelector(".introjs-tooltipbuttons");p.appendChild(e);1<this._introItems.length&&(p.appendChild(g),p.appendChild(l));w.call(b,a.element,k,c)}0==this._currentStep?(g.className="introjs-button introjs-prevbutton introjs-disabled",l.className="introjs-button introjs-nextbutton",
e.innerHTML=this._options.skipLabel):this._introItems.length-1==this._currentStep?(e.innerHTML=this._options.doneLabel,g.className="introjs-button introjs-prevbutton",l.className="introjs-button introjs-nextbutton introjs-disabled"):(g.className="introjs-button introjs-prevbutton",l.className="introjs-button introjs-nextbutton",e.innerHTML=this._options.skipLabel);l.focus();a.element.className+=" introjs-showElement";e=x(a.element,"position");"absolute"!==e&&"relative"!==e&&(a.element.className+=
" introjs-relativePosition");for(e=a.element.parentNode;null!=e&&"body"!==e.tagName.toLowerCase();)g=x(e,"z-index"),/[0-9]+/.test(g)&&(e.className+=" introjs-fixParent"),e=e.parentNode;A(a.element)||(g=a.element.getBoundingClientRect(),e=g.bottom-(g.bottom-g.top),g=g.bottom-B().height,0>e?window.scrollBy(0,e-30):window.scrollBy(0,g+100))}function x(a,b){var c="";a.currentStyle?c=a.currentStyle[b]:document.defaultView&&document.defaultView.getComputedStyle&&(c=document.defaultView.getComputedStyle(a,
null).getPropertyValue(b));return c&&c.toLowerCase?c.toLowerCase():c}function B(){if(void 0!=window.innerWidth)return{width:window.innerWidth,height:window.innerHeight};var a=document.documentElement;return{width:a.clientWidth,height:a.clientHeight}}function A(a){a=a.getBoundingClientRect();return 0<=a.top&&0<=a.left&&a.bottom+80<=window.innerHeight&&a.right<=window.innerWidth}function z(a){var b=document.createElement("div"),c="",d=this;b.className="introjs-overlay";if("body"===a.tagName.toLowerCase())c+=
"top: 0;bottom: 0; left: 0;right: 0;position: fixed;",b.setAttribute("style",c);else{var f=n(a);f&&(c+="width: "+f.width+"px; height:"+f.height+"px; top:"+f.top+"px;left: "+f.left+"px;",b.setAttribute("style",c))}a.appendChild(b);b.onclick=function(){!0==d._options.exitOnOverlayClick&&r.call(d,a);void 0!=d._introExitCallback&&d._introExitCallback.call(d)};setTimeout(function(){c+="opacity: .8;";b.setAttribute("style",c)},10);return!0}function n(a){var b={};b.width=a.offsetWidth;b.height=a.offsetHeight;
for(var c=0,d=0;a&&!isNaN(a.offsetLeft)&&!isNaN(a.offsetTop);)c+=a.offsetLeft,d+=a.offsetTop,a=a.offsetParent;b.top=d;b.left=c;return b}var p=function(a){if("object"===typeof a)return new f(a);if("string"===typeof a){if(a=document.querySelector(a))return new f(a);throw Error("There is no element with given selector.");}return new f(document.body)};p.version="0.5.0";p.fn=f.prototype={clone:function(){return new f(this)},setOption:function(a,b){this._options[a]=b;return this},setOptions:function(a){var b=
this._options,c={},d;for(d in b)c[d]=b[d];for(d in a)c[d]=a[d];this._options=c;return this},start:function(){y.call(this,this._targetElement);return this},goToStep:function(a){this._currentStep=a-2;"undefined"!==typeof this._introItems&&s.call(this);return this},exit:function(){r.call(this,this._targetElement)},refresh:function(){t.call(this,document.querySelector(".introjs-helperLayer"));return this},onbeforechange:function(a){if("function"===typeof a)this._introBeforeChangeCallback=a;else throw Error("Provided callback for onbeforechange was not a function");
return this},onchange:function(a){if("function"===typeof a)this._introChangeCallback=a;else throw Error("Provided callback for onchange was not a function.");return this},oncomplete:function(a){if("function"===typeof a)this._introCompleteCallback=a;else throw Error("Provided callback for oncomplete was not a function.");return this},onexit:function(a){if("function"===typeof a)this._introExitCallback=a;else throw Error("Provided callback for onexit was not a function.");return this}};return q.introJs=
p};introThis=this;introStart(introThis,introfunction);