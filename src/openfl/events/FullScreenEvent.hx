package openfl.events;

#if !flash
/**
	The Stage object dispatches a FullScreenEvent object whenever the Stage
	enters or leaves full-screen display mode. There is only one type of
	`fullScreen` event: `FullScreenEvent.FULL_SCREEN`.

**/
#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
class FullScreenEvent extends ActivityEvent
{
	/**
		The `FullScreenEvent.FULL_SCREEN` constant defines the value of the
		`type` property of a `fullScreen` event object.
		This event has the following properties:
		// TODO: Table <tgroup
		cols="2"><thead><row><entry>Property</entry><entry>Value</entry></row></thead><tbody><row><entry>`fullScreen`</entry><entry>`true`
		if the display state is full screen or `false` if it is
		normal.</entry></row><row><entry>`bubbles`</entry><entry>`false`</entry></row><row><entry>`cancelable`</entry><entry>`false`;
		there is no default behavior to
		cancel.</entry></row><row><entry>`currentTarget`</entry><entry>The
		object that is actively processing the Event object with an event
		listener.</entry></row><row><entry>`target`</entry><entry>The Stage
		object.</entry></row></tbody></tgroup>
	**/
	public static inline var FULL_SCREEN:String = "fullScreen";
	public static inline var FULL_SCREEN_INTERACTIVE_ACCEPTED:String = "fullScreenInteractiveAccepted";

	/**
		Indicates whether the Stage object is in full-screen mode (`true`) or
		not (`false`).
	**/
	public var fullScreen:Bool;
	public var interactive:Bool;

	/**
		Creates an event object that contains information about `fullScreen`
		events. Event objects are passed as parameters to event listeners.

		@param type       The type of the event. Event listeners can access
						  this information through the inherited `type`
						  property. There is only one type of `fullScreen`
						  event: `FullScreenEvent.FULL_SCREEN`.
		@param bubbles    Determines whether the Event object participates in
						  the bubbling phase of the event flow. Event
						  listeners can access this information through the
						  inherited `bubbles` property.
		@param cancelable Determines whether the Event object can be canceled.
						  Event listeners can access this information through
						  the inherited `cancelable` property.
		@param fullScreen Indicates whether the device is activating (`true`)
						  or deactivating (`false`). Event listeners can
						  access this information through the `activating`
						  property.
	**/
	public function new(type:String, bubbles:Bool = false, cancelable:Bool = false, fullScreen:Bool = false, interactive:Bool = false)
	{
		// TODO: What is the "activating" value supposed to be?

		super(type, bubbles, cancelable);

		this.fullScreen = fullScreen;
		this.interactive = interactive;
	}

	public override function clone():Event
	{
		var event = new FullScreenEvent(type, bubbles, cancelable, fullScreen, interactive);
		event.target = target;
		event.currentTarget = currentTarget;
		event.eventPhase = eventPhase;
		return event;
	}

	public override function toString():String
	{
		return __formatToString("FullscreenEvent", ["type", "bubbles", "cancelable", "fullscreen", "interactive"]);
	}
}
#else
typedef FullScreenEvent = flash.events.FullScreenEvent;
#end
