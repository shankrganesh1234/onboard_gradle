/*
jQWidgets v4.5.3 (2017-June)
Copyright (c) 2011-2017 jQWidgets.
License: http://jqwidgets.com/license/
*/
!function(a){"use strict";a.jqx.jqxWidget("jqxPopover","",{}),a.extend(a.jqx._jqxPopover.prototype,{defineInstance:function(){var b={arrowOffsetValue:null,animationType:"fade",position:"bottom",animationOpenDelay:"fast",animationCloseDelay:"fast",autoClose:!0,isModal:!1,height:null,initContent:null,offset:null,rtl:!1,showArrow:!0,showCloseButton:!1,selector:null,title:"",width:null,_toggleElement:null,_popover:null,_popoverTop:0,_popoverLeft:0,_init:!1,_ie8:a.jqx.browser.msie&&8===a.jqx.browser.version,_ie7:a.jqx.browser.msie&&a.jqx.browser.version<8,_left:0,_top:0,events:["open","close"]};return this===a.jqx._jqxPopover.prototype?b:(a.extend(!0,this,b),b)},createInstance:function(){var a=this;a._content=a.host.children()},render:function(){var b=this,c=b.element.id;if(b._content.detach(),b._toggleElement=a(b.selector),0===b._toggleElement.length)throw new Error('jqxPopover: Invalid Popover toggler: "'+b.selector+'".');if(null===b._toggleElement)throw new Error("jqxPopover: Missing Popover toggler.");var d=a('<div id="'+c+'" class="'+b.toThemeProperty("jqx-popover")+'"><div class="'+b.toThemeProperty("jqx-popover-arrow")+'"></div><div class="'+b.toThemeProperty("jqx-popover-title")+'"></div><div class="'+b.toThemeProperty("jqx-popover-content")+'"></div></div>');a("body").append(d);var e=b.host.data();b.host.detach(),b.host=d,b.host.data(e),b.element=d[0],b.element.id=c,b._popover=a("#"+c);var f=b._popover.find(".jqx-popover-title");f.append(b.title);var g=b._popover.find(".jqx-popover-content");if(g.append(b._content),b._popover.hide(),b._removeHandlers(),b._addHandlers(),b._popover.addClass(b.position),f.addClass(b.toThemeProperty("jqx-widget-header")),b._popover.addClass(b.toThemeProperty("jqx-widget jqx-widget-content jqx-rc-all")),b.showArrow?(b._popover.addClass(b.toThemeProperty("jqx-popover-arrow-"+b.position)),b._popover.find(".jqx-popover-arrow").css("display","block")):b._popover.find(".jqx-popover-arrow").css("display","none"),b.rtl&&(f.addClass(b.toThemeProperty("jqx-rtl")),f.css("direction","rtl"),g.css("direction","rtl")),b.showCloseButton){var h=a('<div class="'+this.toThemeProperty("jqx-window-close-button-background")+'"></div>'),i=a('<div style="width: 100%; height: 100%;" class="'+this.toThemeProperty("jqx-window-close-button")+" "+this.toThemeProperty("jqx-icon-close")+'"></div>');h.append(i),f.append(h),f.css("min-height","16px"),h.addClass(b.toThemeProperty("jqx-popover-close-button")),b.closeButton=i,b.rtl&&h.addClass(b.toThemeProperty("jqx-popover-close-button-rtl"))}if(b.arrowOffsetValue)if("bottom"==b.position||"top"==b.position){var j=b._popover.find(".jqx-popover-arrow").css("margin-left");b._popover.find(".jqx-popover-arrow").css("margin-left",parseInt(j)+b.arrowOffsetValue)}else{var k=b._popover.find(".jqx-popover-arrow").css("margin-top");b._popover.find(".jqx-popover-arrow").css("margin-top",parseInt(k)+b.arrowOffsetValue)}(b.width||b.height)&&(b._popover.css("width",b.width),b._popover.css("height",b.height))},refresh:function(a){this.render()},destroy:function(){var a=this;0!==a.length&&(a._removeHandlers(),a._popover.remove(),a._removeModalBackground())},propertyChangedHandler:function(a,b,c,d){this.render()},_stickToToggleElement:function(){var a=this;a._popover.css("left","0px"),a._popover.css("top","0px");var b=a._toggleElement,c=b.offset(),d=b.outerHeight(),e=b.outerWidth(),f=a._popover.height(),g=a._popover.width();switch(a.position){case"left":a._popoverTop=c.top-f/2+d/2,a._popoverLeft=c.left-a._popover.outerWidth();break;case"right":a._popoverTop=c.top-f/2+d/2,a._popoverLeft=c.left+e;break;case"top":a._popoverTop=c.top-a._popover.outerHeight(),a._popoverLeft=c.left-g/2+e/2;break;case"bottom":a._popoverTop=c.top+d,a._popoverLeft=c.left-g/2+e/2}var h=a.offset?parseFloat(a.offset.left):0,i=a.offset?parseFloat(a.offset.top):0;a._popover.css("top",i+a._popoverTop),a._popover.css("left",h+a._popoverLeft)},open:function(){function a(){c._popover.show(),c._raiseEvent("0"),c._isOpen=!0}function b(){c.initContent&&!1===c._init&&(c.initContent(),c._init=!0,c._stickToToggleElement())}var c=this;if(c._stickToToggleElement(),!0===c._ie7)return a(),void b();switch(c.animationType){case"fade":c._popover.fadeIn(c.animationOpenDelay,function(){c._raiseEvent("0"),b(),c._isOpen=!0});break;case"none":a(),b()}c._makeModalBackground()},close:function(){function a(){b._popover.hide(),b._raiseEvent("1"),b._isOpen=!1}var b=this;if(b._isOpen){if(!0===b._ie7)return void a();switch(b.animationType){case"fade":b._popover.fadeOut(b.animationCloseDelay,function(){b._raiseEvent("1"),b._isOpen=!1});break;case"none":a()}b._removeModalBackground()}},_raiseEvent:function(b,c){void 0===c&&(c={owner:null});var d=this.events[b];c.owner=this;var e=new a.Event(d);return e.owner=this,e.args=c,e.preventDefault&&e.preventDefault(),this._popover.trigger(e)},_makeModalBackground:function(){var b=this;!0===b.isModal&&(b.modalBackground=a("<div></div>"),b.modalBackground.addClass(this.toThemeProperty("jqx-popover-modal-background")),a(document.body).prepend(b.modalBackground),a(document.body).addClass(b.toThemeProperty("jqx-unselectable")),b.host.addClass(b.toThemeProperty("jqx-selectable")))},_removeModalBackground:function(){var b=this;!0===b.isModal&&void 0!==b.modalBackground&&(b.modalBackground.remove(),a(document.body).removeClass(b.toThemeProperty("jqx-unselectable")),b.host.removeClass(b.toThemeProperty("jqx-selectable")))},_addHandlers:function(){var b=this,c=b.element.id;b.addHandler(a(document),"keydown.jqxPopover"+c,function(a){27==a.keyCode&&b.close()}),b.addHandler(a(document),"click.jqxPopover"+c,function(c){b.closeButton&&c.target==b.closeButton[0]&&b.close(),!0===b.autoClose&&(c.target==b.element||a(c.target).ischildof(b._popover)||b.isModal||b.close())}),b.addHandler(a(window),"resize.jqxPopover"+c,function(a){"none"!=b.element.style.display&&b._stickToToggleElement()}),b.selector&&b.addHandler(b._toggleElement,"click.jqxPopover"+c,function(a){a.stopPropagation(),"none"!=b.host.css("display")?b.close():b.open()})},_removeHandlers:function(){var b=this,c=b.element.id;b.removeHandler(a(document),"click.jqxPopover"+c),b.selector&&b.removeHandler(b._toggleElement,"click.jqxPopover"+c),b.removeHandler(a(document),"keydown.jqxPopover"+c),b.removeHandler(a(window),"resize.jqxPopover"+c)}})}(jqxBaseFramework);

