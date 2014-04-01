package view 
{
	/**
	 * ...
	 * @author bweij
	 */
	public class CanonBall extends Bullet 
	{
		
		public static const GRAVITY	:	Number	=	0.5;
		
		public function CanonBall() 
		{
			super();
			
			// een CannonBall is hetzelfde als een Bullet
			// hij is alleen langzamer (minder speed) en in de update
			// halen we steeds een klein beetje van de stepY af
			// in de toekomst gaan we dit soort berekeningen met Vectors doen
			
			_speed			=	15;
			_asset.scaleX	=	0.6;
			_asset.scaleY	=	_asset.scaleX;
		}
		
		override public function update() : void
		{
			super.update();
			_stepY	+=	GRAVITY;
		}
		
	}

}