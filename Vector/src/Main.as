package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.Vector2D;
	
	/**
	 * ...
	 * @author bweij
	 */
	public class Main extends Sprite 
	{
		
		private var _rocketShip : RocketShip;
		private var _velocity : Vector2D;
		private var _location : Vector2D;
		private var _mouseLocation : Vector2D;
		private var _speed : Number = 5;
		private var _wind : Vector2D;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			_mouseLocation = new Vector2D(mouseX, mouseY);
			
			_rocketShip =  new RocketShip();
			_rocketShip.scaleX = 0.25;
			_rocketShip.scaleY = _rocketShip.scaleX;
			
			_location = new Vector2D(stage.stageWidth / 2, stage.stageHeight / 2);
			_velocity = new Vector2D(0, -3);
			_wind	=	new Vector2D(1, 1);
			
			addChild(_rocketShip);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			_mouseLocation.x = mouseX;
			_mouseLocation.y = mouseY;
			
			trace(_mouseLocation);
			
			_velocity = _mouseLocation.subtract(_location);
			
			if (_speed < _velocity.length)
			{
				_velocity.length = _speed;
			}
			
			// hier doen we alle logica voor het stuurgedrag
			_location.add(_velocity );// .add(_wind);
			//_location = _location.add(_wind);
			
			// hier laten we de logica ook visueel zien
			_rocketShip.x = _location.x;
			_rocketShip.y = _location.y;
			_rocketShip.rotation = _velocity.angle * 180 / Math.PI + 90;
		}
		
		
		
	}
	
}