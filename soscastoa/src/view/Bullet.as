package view 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author bweij
	 */
	public class Bullet extends Sprite 
	{
		
		// deze Class is de zogenoemde 'baseclass' van alle kogels
		// het is de meest simpele vorm van een kogel
		// hij heeft geen zwaartekracht
		protected var _asset	:	MovieClip;
		
		// in stepX en stepY slaan de stappen op hoeveel de kogel steeds op moet schuiven
		protected var _stepX	:	Number;
		protected var _stepY	:	Number;
		
		// per kogel bepalen we de snelheid. Dit verschilt per type (kogel is sneller dan kanonskogel)
		protected var _speed	:	Number;
		
		public function Bullet() 
		{
			super();
			
			// aller eerst bepalen we de snelheid van een Bullet
			_speed			=	25;
			
			// en we laten hem eruit zien als een bullet
			_asset			=	new Ball();
			_asset.scaleX	=	0.3;
			_asset.scaleY	=	_asset.scaleX;
			
			addChild(_asset);
		}
		
		public function setDirection(angle : Number ) : void
		{
			// deze functie wordt eenmaal aangeroepen en geeft deze kogel de informatie
			// hoe hij uit de turret moet vliegen. Vervolgens bepalen we weer met SOS, CAS, TOA
			// wat de stap op de x en y as moet zijn
			
			// eerst rekenen we de hoek (degrees) om naar radians
			// dit is nodig voor de cosinus en sinus
			var radian	:	Number	=	angle / (180 / Math.PI);
			_stepX	=	Math.cos( radian ) * _speed;
			_stepY	=	Math.sin( radian ) * _speed;
		}
		
		public function update() : void
		{
			// elke frame tick wordt de kogel een stukje opgeschoven
			// deze functie wordt aangeroepen vanuit Game.as
			this.x	+=	_stepX;
			this.y	+=	_stepY;
			trace(_stepY);
		}
	}

}