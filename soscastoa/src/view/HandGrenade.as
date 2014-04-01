package view 
{
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author bweij
	 */
	public class HandGrenade extends CanonBall 
	{
		
		
		public function HandGrenade() 
		{
			super();
			
			// een handgrenade is hetzelfde als een CannonBall
			// alleen explodeert hij na een bepaalde tijd
			
			_speed	=	20;
			
			// dit doen we met een Timeout. Hiermee kunnen we een functie aanroepen
			// na een bepaalde tijd
			setTimeout(explode, 1200);
		}
				
		private function explode() : void
		{
			this.visible	=	false;
		}
		
	}

}