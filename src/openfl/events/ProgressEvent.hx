package openfl.events;

#if !flash
/**
	A ProgressEvent object is dispatched when a load operation has begun or a
	socket has received data. These events are usually generated when SWF
	files, images or data are loaded into an application. There are two types
	of progress events: `ProgressEvent.PROGRESS` and
	`ProgressEvent.SOCKET_DATA`. Additionally, in AIR ProgressEvent
	objects are dispatched when a data is sent to or from a child process using
	the NativeProcess class.
**/
#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
class ProgressEvent extends Event
{
	/**
		Defines the value of the `type` property of a `progress` event object.

		This event has the following properties:
		// TODO: Table <tgroup
		cols="2"><thead><row><entry>Property</entry><entry>Value</entry></row></thead><tbody><row><entry>`bubbles`</entry><entry>`false`</entry></row><row><entry>`bytesLoaded`</entry><entry>The
		number of items or bytes loaded at the time the listener processes the
		event.</entry></row><row><entry>`bytesTotal`</entry><entry>The total
		number of items or bytes that ultimately will be loaded if the loading
		process
		succeeds.</entry></row><row><entry>`cancelable`</entry><entry>`false`;
		there is no default behavior to
		cancel.</entry></row><row><entry>`currentTarget`</entry><entry>The
		object that is actively processing the Event object with an event
		listener.</entry></row><row><entry>`target`</entry><entry>The object
		reporting progress. </entry></row></tbody></tgroup>
	**/
	public static inline var PROGRESS:String = "progress";

	/**
		Defines the value of the `type` property of a `socketData` event
		object.
		This event has the following properties:
		// TODO: Table <tgroup
		cols="2"><thead><row><entry>Property</entry><entry>Value</entry></row></thead><tbody><row><entry>`bubbles`</entry><entry>`false`</entry></row><row><entry>`cancelable`</entry><entry>`false`;
		there is no default behavior to
		cancel.</entry></row><row><entry>`currentTarget`</entry><entry>The
		object that is actively processing the
		Event.</entry></row><row><entry>`bytesLoaded`</entry><entry>The number
		of items or bytes loaded at the time the listener processes the
		event.</entry></row><row><entry>`bytesTotal`</entry><entry>0; this
		property is not used by `socketData` event
		objects.</entry></row><row><entry>`target`</entry><entry>The socket
		reporting progress.</entry></row></tbody></tgroup>
	**/
	public static inline var SOCKET_DATA:String = "socketData";

	/**
		The number of items or bytes loaded when the listener processes the event.
	**/
	public var bytesLoaded:Float;

	/**
		The total number of items or bytes that will be loaded if the loading
		process succeeds. If the progress event is dispatched/attached to a Socket
		object, the bytesTotal will always be 0 unless a value is specified in the
		bytesTotal parameter of the constructor. The actual number of bytes sent
		back or forth is not set and is up to the application developer.
	**/
	public var bytesTotal:Float;

	/**
		Creates an Event object that contains information about progress events.
		Event objects are passed as parameters to event listeners.

		@param type        The type of the event. Possible values
						   are:`ProgressEvent.PROGRESS`,
						   `ProgressEvent.SOCKET_DATA`,
						   `ProgressEvent.STANDARD_ERROR_DATA`,
						   `ProgressEvent.STANDARD_INPUT_PROGRESS`, and
						   `ProgressEvent.STANDARD_OUTPUT_DATA`.
		@param bubbles     Determines whether the Event object participates in the
						   bubbling stage of the event flow.
		@param cancelable  Determines whether the Event object can be canceled.
		@param bytesLoaded The number of items or bytes loaded at the time the
						   listener processes the event.
		@param bytesTotal  The total number of items or bytes that will be loaded
						   if the loading process succeeds.
	**/
	public function new(type:String, bubbles:Bool = false, cancelable:Bool = false, bytesLoaded:Float = 0, bytesTotal:Float = 0)
	{
		super(type, bubbles, cancelable);

		this.bytesLoaded = bytesLoaded;
		this.bytesTotal = bytesTotal;
	}

	public override function clone():Event
	{
		var event = new ProgressEvent(type, bubbles, cancelable, bytesLoaded, bytesTotal);
		event.target = target;
		event.currentTarget = currentTarget;
		event.eventPhase = eventPhase;
		return event;
	}

	public override function toString():String
	{
		return __formatToString("ProgressEvent", ["type", "bubbles", "cancelable", "bytesLoaded", "bytesTotal"]);
	}
}
#else
typedef ProgressEvent = flash.events.ProgressEvent;
#end
