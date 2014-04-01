package view 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author bweij
	 */
	public class Tower extends Sprite 
	{
		// deze variabele wordt gebruikt voor onze 'custom' event
		public static const SHOOT	:	String	=	"shoot";
		
		// variabele om de assets van de Tower in op te slaan (het gebouw plus de losse turret/lanceerbuis)
		private var _turret			:	Turret;
		private var _building		:	Building;
		
		public function Tower() 
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// we gaan luisteren naar een muisklik. Als er met de muis wordt geklikt dan willen we vuren
			stage.addEventListener(MouseEvent.CLICK, fire);
			
			// we luisteren naar de beweging van de muis. Als de muis beweegt dan draaien we de turret
			stage.addEventListener(MouseEvent.MOUSE_MOVE, aimTurret);
			
			// we maken het gebouw en de turret daadwerkelijk aan
			_turret		=	new Turret();
			_building	=	new Building();
			
			// vervolgens maken we het gebouw en de turret zichtbaar
			addChild(_turret);
			addChild(_building);
		}
		
		private function aimTurret(e:MouseEvent):void 
		{
			// deze functie wordt aangeroepen als de muis beweegt
			
			// eerst berekenen we het verschil tussen de positie van de muis en deze toren
			// als we het verschil weten dan kunnen we met SOS, CAS, TOA aan de slag
			var diffX				:	Number	=	e.localX - this.x;
			var diffY				:	Number	=	e.localY - this.y;
			
			// we kunnen de hoek berekenen met atan (TOA)
			var rotationInRadians	:	Number	=	Math.atan2(diffY, diffX);
			
			_turret.rotation					=	rotationInRadians * (180 / Math.PI);
		}
		
		private function fire(e:MouseEvent):void 
		{
			// deze functie wordt aangeroepen als er met de muis geklikt wordt
			// we laten de turret zijn animatie spelen
			_turret.play();
			
			// en we 'roepen' door de applicatie heen dat er geschoten moet worden
			// iedereen die 'luistert' (addEventListener) die krijgt dit signaal
			// in ons geval is dit Game.as
			dispatchEvent(new Event(SHOOT));
		}
		
		public function get turretRotation() : Number
		{
			// deze functie is een GETTER en zorgt ervoor dat de buitenwereld (buiten deze toren)
			// ook de hoek van de turret kunnen opvragen
			return _turret.rotation;
		}
		
	}

}