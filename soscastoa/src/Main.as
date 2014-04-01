package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import view.Game;
	
	/**
	 * ...
	 * @author bweij
	 */
	public class Main extends Sprite 
	{
		
		private var _game : Game;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			// eerst maken we de game aan
			// de game is een eigen Class. Hierdoor zien we de game als een eigen object
			// die we visible kunnen maken (of juist niet)
			_game	=	new Game();
			addChild(_game);
		}
		
	}
	
}