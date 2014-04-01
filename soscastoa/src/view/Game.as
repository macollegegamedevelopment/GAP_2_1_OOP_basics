package  view
{
	import flash.display.Sprite;
	import view.Tower;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author bweij
	 */
	public class Game extends Sprite 
	{
		
		// variabele om de tower in op te slaan
		private var _tower		:	Tower;
		
		// we houden een Array bij met alle bullets zodat we ze elke frame kunnen updaten
		private var _bullets	:	Array;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// we gaan luisteren naar de ENTER_FRAME zodat we alle bullets kunnen updaten
			addEventListener(Event.ENTER_FRAME, update);
			
			// de game start dus we moeten alle variabelen gaan 'initieren' (aanmaken)
			// zo ook de array voor de bullets
			_bullets	=	[];
			
			// we maken de toren aan en zetten hem onderin het scherm
			_tower		=	new Tower();
			_tower.x	=	stage.stageWidth / 2;
			_tower.y	=	stage.stageHeight - 40;
			
			// we luisteren naar ons eigen event SHOOT zodat we weten wanneer er een
			// kogel moet worden toegevoegd aan de wereld
			_tower.addEventListener(Tower.SHOOT, fire);
			
			// we maken de toren zichtbaar in de game
			addChild(_tower);
		}
		
		private function update(e:Event):void 
		{
			// deze functie wordt elke frame aangeroepen
			// vervolgens loopt hij door de array met alle bullets en wordt op elke bullet
			// update aangeroepen zodat ze hun positie updaten
			var l : int	=	_bullets.length;
			
			for (var i : int = 0 ; i < l ; i++ )
			{
				_bullets[i].update();
			}
		}
		
		private function fire(e:Event):void 
		{
			// deze functie wordt aangeroepen als de toren 'roept' dat er geschoten moet worden
			// als reactie hierop maakt de Game Class een nieuwe kogel en stuurt hem de juiste kant op
			var newBullet	:	Bullet	=	new CanonBall();
			
			newBullet.setDirection( _tower.turretRotation );
			
			newBullet.x	=	_tower.x;
			newBullet.y	=	_tower.y;
			
			addChildAt(newBullet, 0);
			
			// om de positie van de kogel steeds aan te kunnen passen zetten we de nieuwe kogel in de array
			// hierdoor kan deze nieuwe kogel steeds in de 'update' functie worden aangeroepen
			_bullets.push(newBullet);
		}

	}

}