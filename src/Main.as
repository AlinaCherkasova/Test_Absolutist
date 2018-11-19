package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;

	/**
	 * ...
	 * @author Alina Cherkasova
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{

		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public var tomato:Tomato_main = new Tomato_main();
		public var tomatoCry:Tomato_Peter = new Tomato_Peter();
		
		[Embed(source = "../lib/1.mp3")]
		public var SoundLaugh:Class;
		var haHa:Sound = new SoundLaugh();
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addChild(tomato);
			tomato.x = 300;
			tomato.y = 250;
			
			tomato.addEventListener(MouseEvent.MOUSE_DOWN, drag);
			tomato.addEventListener(MouseEvent.MOUSE_UP, drop);
			
		}
		
		private function drag(e:MouseEvent):void 
		{
			tomato.addChild(tomatoCry);
			tomato.startDrag();
			
			haHa.play();
		}
		
		private function drop(e:MouseEvent):void 
		{
			tomato.stopDrag();
			tomato.removeChild(tomatoCry);
		}

	}

}