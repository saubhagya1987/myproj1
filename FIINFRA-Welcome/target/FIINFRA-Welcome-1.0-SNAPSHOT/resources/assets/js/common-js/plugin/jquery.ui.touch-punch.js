/*!
 * jQuery UI Touch Punch 0.2.3
 *
 * Copyright 2011–2014, Dave Furfero
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 * Depends:
 *  jquery.ui.widget.js
 *  jquery.ui.mouse.js
 */
(function ($) {

  // Detect touch support
  $.support.touch = 'ontouchend' in document;

  // Ignore browsers without touch support
  if (!$.support.touch) {
    return;
  }

  var mouseProto = $.ui.mouse.prototype,
      _mouseInit = mouseProto._mouseInit,
      _mouseDestroy = mouseProto._mouseDestroy,
      touchHandled;

  /**
   * Simulate a mouse event based on a corresponding touch event
   * @param {Object} event A touch event
   * @param {String} simulatedType The corresponding mouse event
   */
  function simulateMouseEvent (event, simulatedType) {

    // Ignore multi-touch events
    if (event.originalEvent.touches.length > 1) {
      return;
    }

    event.preventDefault();

    var touch = event.originalEvent.changedTouches[0],
        simulatedEvent = document.createEvent('MouseEvents');
    
    // Initialize the simulated mouse event using the touch event's coordinates
    simulatedEvent.initMouseEvent(
      simulatedType,    // type
      true,             // bubbles                    
      true,             // cancelable                 
      window,           // view                       
      1,                // detail                     
      touch.screenX,    // screenX                    
      touch.screenY,    // screenY                    
      touch.clientX,    // clientX                    
      touch.clientY,    // clientY                    
      false,            // ctrlKey                    
      false,            // altKey                     
      false,            // shiftKey                   
      false,            // metaKey                    
      0,                // button                     
      null              // relatedTarget              
    );

    // Dispatch the simulated event to the target element
    event.target.dispatchEvent(simulatedEvent);
  }

  /**
   * Handle the jQuery UI widget's touchstart events
   * @param {Object} event The widget element's touchstart event
   */
  mouseProto._touchStart = function (event) {

    var self = this;

    // Ignore the event if another widget is already being handled
    if (touchHandled || !self._mouseCapture(event.originalEvent.changedTouches[0])) {
      return;
    }

    // Set the flag to prevent other widgets from inheriting the touch event
    touchHandled = true;

    // Track movement to determine if interaction was a click
    self._touchMoved = false;

    // Simulate the mouseover event
    simulateMouseEvent(event, 'mouseover');

    // Simulate the mousemove event
    simulateMouseEvent(event, 'mousemove');

    // Simulate the mousedown event
    simulateMouseEvent(event, 'mousedown');
  };

  /**
   * Handle the jQuery UI widget's touchmove events
   * @param {Object} event The document's touchmove event
   */
  mouseProto._touchMove = function (event) {

    // Ignore event if not handled
    if (!touchHandled) {
      return;
    }

    // Interaction was not a click
    this._touchMoved = true;

    // Simulate the mousemove event
    simulateMouseEvent(event, 'mousemove');
  };

  /**
   * Handle the jQuery UI widget's touchend events
   * @param {Object} event The document's touchend event
   */
  mouseProto._touchEnd = function (event) {

    // Ignore event if not handled
    if (!touchHandled) {
      return;
    }

    // Simulate the mouseup event
    simulateMouseEvent(event, 'mouseup');

    // Simulate the mouseout event
    simulateMouseEvent(event, 'mouseout');

    // If the touch interaction did not move, it should trigger a click
    if (!this._touchMoved) {

      // Simulate the click event
      simulateMouseEvent(event, 'click');
    }

    // Unset the flag to allow other widgets to inherit the touch event
    touchHandled = false;

  };

  /**
   * A duck punch of the $.ui.mouse _mouseInit method to support touch events.
   * This method extends the widget with bound touch event handlers that
   * translate touch events to mouse events and pass them to the widget's
   * original mouse event handling methods.
   */
  mouseProto._mouseInit = function () {
    
    var self = this;

    // Delegate the touch handlers to the widget's element
    self.element.bind({
      touchstart: $.proxy(self, '_touchStart'),
      touchmove: $.proxy(self, '_touchMove'),
      touchend: $.proxy(self, '_touchEnd')
    });

    // Call the original $.ui.mouse init method
    _mouseInit.call(self);
  };

  /**
   * Remove the touch event handlers
   */
  mouseProto._mouseDestroy = function () {
    
    var self = this;

    // Delegate the touch handlers to the widget's element
    self.element.unbind({
      touchstart: $.proxy(self, '_touchStart'),
      touchmove: $.proxy(self, '_touchMove'),
      touchend: $.proxy(self, '_touchEnd')
    });

    // Call the original $.ui.mouse destroy method
    _mouseDestroy.call(self);
  };

})(jQuery);

(function($) {
  
  var defaults = {
    'swipeTolerance': 40
  };
  
  var touchStatus = function(target, touch) {
    this.target    = $(target);
    this.touch     = touch;
    this.startX    = this.currentX = touch.screenX;
    this.startY    = this.currentY = touch.screenY;
    this.eventType = null;
  }
  touchStatus.options = {};
  touchStatus.latestTap = null;

  touchStatus.prototype.move = function(touch) {
    this.currentX = touch.screenX;
    this.currentY = touch.screenY;
  }

  touchStatus.prototype.process = function() {
    var offsetX = this.currentX - this.startX;
    var offsetY = this.currentY - this.startY;
    if(offsetX == 0 && offsetY == 0) {
      this.checkForDoubleTap();
    } else if(Math.abs(offsetY) > touchStatus.options.swipeTolerance && Math.abs(offsetY) > Math.abs(offsetX)) {
      this.eventType = offsetY > 0 ? 'swipedown' : 'swipeup';
      this.target.trigger('swipe', [this])
    } else if(Math.abs(offsetX) > touchStatus.options.swipeTolerance) {
      this.eventType = offsetX > 0 ? 'swiperight' : 'swipeleft';
      this.target.trigger('swipe', [this])
    }
    if(this.eventType) this.target.trigger(this.eventType, [this])
    this.target.trigger('touch',        [this])
  }

  touchStatus.prototype.checkForDoubleTap = function() {
    if(touchStatus.latestTap) {
      if((new Date() - touchStatus.latestTap) < 400) 
        this.eventType = 'doubletap'
    }
    if(!this.eventType) this.eventType = 'tap'
    touchStatus.latestTap = new Date()
  }

  var swipeEvents = function(elements, options) {
    touchStatus.options = $.extend(defaults, options);
    elements.bind('touchstart',  this.touchStart);
    elements.bind('touchmove',   this.touchMove);
    elements.bind('touchcancel', this.touchCancel);
    elements.bind('touchend',    this.touchEnd);
  }

  swipeEvents.prototype.touchStart = function(evt) {
    var target = this;
    swipeEvents.eachTouch(evt, function(touch) {
      swipeEvents.touches[touch.identifier] = new touchStatus(target, touch);
    })
  }

  swipeEvents.prototype.touchMove = function(evt) {
    swipeEvents.eachTouch(evt, function(touch) {
      var loc = swipeEvents.touches[touch.identifier]
      if(loc) loc.move(touch)
    })
  }

  swipeEvents.prototype.touchCancel = function(evt) {
    swipeEvents.eachTouch(evt, function(touch) {
      swipeEvents.purge(touch, true)
    })
  }

  swipeEvents.prototype.touchEnd = function(evt) {
    swipeEvents.eachTouch(evt, function(touch) {
      swipeEvents.purge(touch)
    })
  }

  swipeEvents.touches = {}
  swipeEvents.purge = function(touch, cancelled) {
    if(!cancelled) {
      var loc = swipeEvents.touches[touch.identifier]
      if(loc) loc.process()
    }
    delete swipeEvents.touches[touch.identifier]
  }

  swipeEvents.eachTouch = function(evt, callback) {
    var evt = evt.originalEvent;
    var num = evt.changedTouches.length;
    for(var i = 0; i < num; i++) {
      callback(evt.changedTouches[i])
    }
  }

  // adds custom events:
  //   touch      // all events
  //   swipe      // only swipe* events
  //   swipeleft
  //   swiperight
  //   swipeup
  //   swipedown
  //   tap
  //   doubletap
  $.fn.addSwipeEvents = function(options, callback) { 
    if (!callback && jQuery.isFunction(options)) {
      callback = options;
      options = null;
    }
    new swipeEvents(this, options);
    if(callback) this.bind('touch', callback);
    return this;
  }
})(jQuery);